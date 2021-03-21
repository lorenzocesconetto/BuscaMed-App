import 'package:buscamed/app/shared/components/button_secundary_component.dart';
import 'package:buscamed/app/shared/components/subtitle_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ProductCardComponent extends StatefulWidget {
  ProductCardComponent(
      {this.name,
      this.id,
      this.img_small,
      this.best_price,
      this.producer,
      this.active_principle});

  final name;
  final id;
  final img_small;
  final best_price;
  final producer;
  final active_principle;

  @override
  _ProductCardComponentState createState() => _ProductCardComponentState();
}

class _ProductCardComponentState extends State<ProductCardComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Modular.to.pushNamed('/product/${widget.id}/${widget.best_price}'),
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: image(widget.img_small),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      child: Text(widget.name,
                          maxLines: 2,
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    activePrinciple(widget.active_principle),
                    SizedBox(height: 5),
                    producerPrinciple(widget.producer),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "A partir de",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    PriceFormat(widget.best_price),
                  ],
                ),
              ),
              ButtonSecundaryComponent(
                text: "Comparar Preços",
                big: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Row PriceFormat(double best_price) {
  final formatNumbe = new NumberFormat("#,##0.00", "pt-Br");
  var price = formatNumbe.format(best_price).split(',');

  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    children: [
      Text(
        "R\$ ${price[0]},",
        style: TextStyle(fontSize: 26, color: ThemeColors.price_red),
      ),
      Text("${price[1]}",
          style: TextStyle(fontSize: 18, color: ThemeColors.price_red))
    ],
  );
}

Widget activePrinciple(String active_principle) {
  return active_principle != null
      ? SubtitleComponent(
          "assets/pill@2x.png",
          active_principle,
          subtitleStyle(),
        )
      : SizedBox(height: 20);
}

Widget image(String urlImage) {
  try {
    return urlImage != null && urlImage.contains("https")
        ? Image.network(
            urlImage,
            height: 80,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Image.asset(
                "assets/sem-image.png",
                width: 80,
              );
            },
          )
        : Image.asset("assets/sem-image.png", width: 80);
  } catch (e) {
    return Image.asset("assets/sem-image.png", width: 80);
  }
}

Widget producerPrinciple(String producer) {
  return producer != null
      ? SubtitleComponent(
          "assets/lab@2x.png",
          producer,
          subtitleStyle2(),
        )
      : SizedBox(
          height: 20,
        );
}

TextStyle subtitleStyle() {
  return TextStyle(fontSize: 12, color: ThemeColors.input_blue);
}

TextStyle subtitleStyle2() {
  return TextStyle(fontSize: 12, color: ThemeColors.text_gray);
}

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
    return Card(
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            image(widget.img_small),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,
                      maxLines: 2,
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis),
                  SizedBox(
                    height: 10,
                  ),
                  activePrinciple(widget.active_principle),
                  producerPrinciple(widget.producer),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "A partir de",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  PriceFormat(widget.best_price),
                ],
              ),
            ),
            ButtonSecundaryComponent(
              text: "Comparar Preços",
              big: false,
              onPressed: () => Modular.to.pushNamed('/product/${widget.id}'),
            )
          ],
        ),
      ),
    );
  }
}

Text PriceFormat(double best_price) {
  final oCcy = new NumberFormat("#,##0.00", "pt-Br");

  return Text(
    "R\$ ${oCcy.format(best_price)}",
    style: TextStyle(fontSize: 20, color: ThemeColors.price_red),
  );
}

Widget activePrinciple(String active_principle) {
  return active_principle != null
      ? SubtitleComponent(
          "assets/pill@2x.png",
          active_principle,
          subtitleStyle(),
        )
      : SizedBox();
}

Widget image(String urlImage) {
  return urlImage != null && urlImage.contains("https")
      ? Image.network(
          urlImage,
          width: 120,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) {
            return Image.asset("assets/sem-image.png", width: 120);
          },
        )
      : Image.asset("assets/sem-image.png", width: 120);
}

Widget producerPrinciple(String producer) {
  return producer != null
      ? SubtitleComponent(
          "assets/lab@2x.png",
          producer,
          subtitleStyle2(),
        )
      : SizedBox();
}

TextStyle subtitleStyle() {
  return TextStyle(fontSize: 12, color: ThemeColors.input_blue);
}

TextStyle subtitleStyle2() {
  return TextStyle(fontSize: 12, color: ThemeColors.text_gray);
}

import 'package:buscamed/app/shared/components/button_secundary_component.dart';
import 'package:buscamed/app/shared/components/subtitle_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductCardComponent extends StatefulWidget {
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
            Image.asset(
              "assets/sem-image.png",
              width: 120,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Microvlar com 63 drágeas",
                  style: TextStyle(fontSize: 16),
                ),
                SubtitleComponent(
                    "assets/pill@2x.png", 'MICROVLAR', subtitleStyle()),
                SubtitleComponent(
                    "assets/lab@2x.png", 'Call Farma', subtitleStyle2()),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "A partir de",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "R\$ 16,55",
                  style: TextStyle(fontSize: 20, color: ThemeColors.price_red),
                ),
              ],
            ),
            ButtonSecundaryComponent(
              text: "Comparar Preços",
              big: false,
              onPressed: () => Modular.to.pushNamed('/product'),
            )
          ],
        ),
      ),
    );
  }
}

TextStyle subtitleStyle() {
  return TextStyle(fontSize: 12, color: ThemeColors.input_blue);
}

TextStyle subtitleStyle2() {
  return TextStyle(fontSize: 12, color: ThemeColors.text_gray);
}

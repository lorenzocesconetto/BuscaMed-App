import 'package:buscamed/app/shared/components/header_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background_product,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderComponent(
            action: () => Modular.to.pop(),
            title: 'Detalhes',
          ),
          Image.asset(
            "assets/sem-image.png",
            height: 150,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MICROVLAR",
                    style:
                        TextStyle(fontSize: 12, color: ThemeColors.text_gray),
                  ),
                  Text(
                    "Microvlar com 63 drágeas",
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("COMPARATIVO DE PREÇOS EM SUA REGIÃO"),
                  ),
                  Text(
                    "Abaixo segue uma listagem da disponibilidade deste medicamento e sua região. "
                    "Ao tocar em um de nossos parceiros, você será levado ao site oficial da drogaria.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 12, textBaseline: TextBaseline.alphabetic),
                  ),
                ],
              ),
            ),
          )
        ],
      ))),
    );
  }
}

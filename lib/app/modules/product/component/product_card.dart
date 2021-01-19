import 'package:buscamed/app/shared/components/button_secundary_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      child: Column(
        children: [
          Text("Microvlar com 63 drágeas"),
          Text("Microvlar com 63 drágeas"),
          Text("Microvlar com 63 drágeas"),
          Text("R\$ 16,55"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ButtonSecundaryComponent(
              text: "Comparar Preços",
              big: false,
            ),
          )
        ],
      ),
    );
  }
}

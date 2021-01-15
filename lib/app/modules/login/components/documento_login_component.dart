import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:buscamed/app/shared/components/input_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentLoginComponent extends StatefulWidget {
  @override
  _DocumentLoginComponentState createState() => _DocumentLoginComponentState();
}

class _DocumentLoginComponentState extends State<DocumentLoginComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
      child: Column(children: [
        Text(
            "Para usar o BuscaMed sem cadastro, digite o seu CEP para que possamos localizar as melhores ofertas em sua região."),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: InputComponent(label: 'CEP'),
        ),
        SizedBox(height: 40),
        ButtonComponent(text: 'ENTRAR'),
      ]),
    );
  }
}

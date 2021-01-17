import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_zipcode_component.dart';

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
        ZipcodeInputComponent(),
        SizedBox(height: 20),
        ButtonComponent(text: 'ENTRAR'),

      ]),
    );
  }
}

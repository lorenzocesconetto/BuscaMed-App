import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final String title;
  final Function action;

  HeaderComponent({this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical : 24.0, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: action,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.0,
              semanticLabel: 'Voltar Tela de login',
            ),
          ),
          Expanded(
              child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18
                ),
              ))
        ],
      ),
    );
  }
}

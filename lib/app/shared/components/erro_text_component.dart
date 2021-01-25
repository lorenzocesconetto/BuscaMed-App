import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorTextComponent extends StatelessWidget {
  final String mensage;

  ErrorTextComponent(this.mensage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        mensage,
        style: TextStyle(
          color: Colors.red,
          fontSize: 12,
        ),
      ),
    );
  }
}

import 'package:buscamed/app/shared/components/input_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailInputComponent extends StatelessWidget {
  final bool readOnly;
  final TextEditingController controller;

  EmailInputComponent({this.readOnly = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return InputComponent(
        label: "E-mail",
        readOnly: readOnly,
        controller: controller,
        keyboardInputType: TextInputType.emailAddress);
  }
}

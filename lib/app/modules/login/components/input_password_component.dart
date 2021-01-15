import 'package:buscamed/app/shared/components/input_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordInputComponent extends StatelessWidget {
  final bool obscureText;
  final String label;
  final Widget icon;
  final TextEditingController controller;

  PasswordInputComponent(
      {this.icon,
      this.obscureText = true,
      this.label = "Senha",
      this.controller});

  @override
  Widget build(BuildContext context) {
    return InputComponent(
        label: label,
        obscureText: obscureText,
        autocorrect: false,
        enableSuggestions: false,
        controller: controller,
        keyboardInputType: TextInputType.emailAddress,
        icon: icon);
  }
}

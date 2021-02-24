import 'package:buscamed/app/shared/components/input_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneInputComponent extends StatelessWidget {
  final bool readOnly;
  final TextEditingController controller;
  var maskFormatterPhone = new MaskTextInputFormatter(
      mask: '(##) # ####-####', filter: {"#": RegExp(r'[0-9]')});

  PhoneInputComponent({this.readOnly = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return InputComponent(
        label: "Telefone",
        textFormatter: [maskFormatterPhone],
        readOnly: readOnly,
        controller: controller,
        checkEmpty: true,
        keyboardInputType: TextInputType.emailAddress);
  }
}

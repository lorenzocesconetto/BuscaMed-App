import 'package:buscamed/app/shared/components/input_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ZipcodeInputComponent extends StatelessWidget {
  var maskFormatterCPF = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  final bool readOnly;
  final TextEditingController controller;

  ZipcodeInputComponent({this.readOnly = false, this.controller});

  @override
  Widget build(BuildContext context) {
    return InputComponent(
        textFormatter: [maskFormatterCPF],
        label: "CEP",
        readOnly: readOnly,
        controller: controller,
        keyboardInputType: TextInputType.number);
  }
}

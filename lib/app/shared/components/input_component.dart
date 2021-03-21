import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputComponent extends StatelessWidget {
  final String label;
  final bool obscureText;
  final bool readOnly;
  final bool checkEmpty;
  final bool autocorrect;
  final bool Function(String text) validator;
  final int minLenght;
  final bool enableSuggestions;
  final TextEditingController controller;
  final TextInputType keyboardInputType;
  final Widget icon;

  List<TextInputFormatter> textFormatter = [
    FilteringTextInputFormatter.singleLineFormatter
  ];

  InputComponent(
      {this.label,
      this.obscureText = false,
      this.icon,
      this.checkEmpty = false,
      this.textFormatter,
      this.readOnly = false,
      this.minLenght = 0,
      this.validator,
      this.autocorrect = true,
      this.enableSuggestions = true,
      this.controller,
      this.keyboardInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: TextFormField(
        inputFormatters: textFormatter,
        readOnly: readOnly,
        enabled: !readOnly,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardInputType,
        enableSuggestions: enableSuggestions,
        autocorrect: autocorrect,
        decoration: InputDecoration(
          suffixIcon: icon,
          alignLabelWithHint: true,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          errorStyle: TextStyle(
            color: ThemeColors.red,
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: ThemeColors.input_blue)),
        ),
        style: TextStyle(
            color: readOnly ? Colors.grey : Colors.black,
            fontFamily: 'Lato-Black'),
        validator: (value) {
          if (checkEmpty && value.isEmpty) {
            return 'Não pode ser vazio';
          }
          if (value.length < minLenght) {
            return 'Mínimo de  $minLenght caracteres';
          }
          if (validator != null && !validator(value)) {
            return 'Campo inválido';
          }
          return null;
        },
      ),
    );
  }
}

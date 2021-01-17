import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputComponent extends StatelessWidget {
  final String label;
  final bool obscureText;
  final bool readOnly;
  final bool autocorrect;
  final bool enableSuggestions;
  final TextEditingController controller;
  final TextInputType keyboardInputType;
  final Widget icon;

  List<TextInputFormatter > textFormatter = [FilteringTextInputFormatter.singleLineFormatter] ;

  InputComponent(
      {@required this.label,
      this.obscureText = false,
      this.icon,
        this.textFormatter,
      this.readOnly = false,
      this.autocorrect = true,
      this.enableSuggestions = true,
      this.controller,
      this.keyboardInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical : 8.0),
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
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: ThemeColors.input_blue)),
        ),
        style: TextStyle(color: readOnly ? Colors.grey : Colors.black),
      ),
    );
  }
}

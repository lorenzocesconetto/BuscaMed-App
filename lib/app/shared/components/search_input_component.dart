import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchInputComponent extends StatelessWidget {
  final String hint;
  final bool autocorrect;
  final bool enableSuggestions;
  final TextEditingController controller;
  final TextInputType keyboardInputType;

  SearchInputComponent(
      {this.hint = 'Pesquisar',
      this.autocorrect = true,
      this.enableSuggestions = true,
      this.controller,
      this.keyboardInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardInputType,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        filled: true,
        fillColor: ThemeColors.search_input,
        hintText: hint,
        suffixIcon: Icon(
          FontAwesomeIcons.search,
          color: ThemeColors.input_blue,
          size: 14,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      style: TextStyle(color: Colors.black, fontFamily: 'Lato-Black'),
    );
  }
}

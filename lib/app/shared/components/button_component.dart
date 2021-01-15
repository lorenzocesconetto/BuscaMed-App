import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final bool loading;
  final Function onPressed;

  ButtonComponent({@required this.text, this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.button_default,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 50.0,
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
        ),
      ),
    );
  }
}

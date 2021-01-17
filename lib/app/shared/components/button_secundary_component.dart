import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSecundaryComponent extends StatelessWidget {
  final String text;
  final bool loading;
  final bool light;
  final Function onPressed;

  ButtonSecundaryComponent({@required this.text, this.onPressed, this.loading = false, this.light = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical : 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: light ? ThemeColors.button_secundary_light : ThemeColors.button_secundary,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: ThemeColors.button_default,
              width: 1,
            ),
          ),
          height: 50.0,
          child: Center(
            child: loading
                ? CircularProgressIndicator()
                : Text(
                    text,
                    style: TextStyle(
                      color: light ? Colors.black :Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 1.0,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

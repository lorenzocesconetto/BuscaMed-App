import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSecundaryComponent extends StatelessWidget {
  final String text;
  final bool loading;
  final bool big;
  final Function onPressed;

  ButtonSecundaryComponent(
      {this.text, this.onPressed, this.loading = false, this.big = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: ThemeColors.button_secundary,
            borderRadius: BorderRadius.circular(6.0),
          ),
          height: big ? 50.0 : 40,
          child: Center(
            child: loading
                ? CircularProgressIndicator()
                : FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato-Black',
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

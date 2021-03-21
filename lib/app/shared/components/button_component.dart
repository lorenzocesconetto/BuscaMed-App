import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final bool loading;
  final Function onPressed;

  ButtonComponent({this.text, this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: ThemeColors.button_default,
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 50.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: loading
                  ? CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato-Black',
                        fontSize: 16.0,
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

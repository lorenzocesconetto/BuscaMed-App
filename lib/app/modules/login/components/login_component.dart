import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'input_email_component.dart';
import 'input_password_component.dart';

class LoginComponent extends StatefulWidget {
  @override
  _LoginComponentState createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  bool ocultPassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Column(children: [
        EmailInputComponent(),
        PasswordInputComponent(
          obscureText: ocultPassword,
          // icon: GestureDetector(
          //   onTap: () => setState(() {
          //     ocultPassword = !ocultPassword;
          //   }),
          //   child: Icon(
          //     ocultPassword
          //         ? FontAwesomeIcons.eye
          //         : FontAwesomeIcons.eyeSlash,
          //     color: Colors.grey,
          //     size: 16,
          //   ),
          // ),
        ),
        SizedBox(height: 20),
        ButtonComponent(
          text: 'ENTRAR',
          onPressed: () => Modular.to.pushNamed("/home"),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: GestureDetector(
              onTap: () => Modular.to.pushNamed("/forget-pass"),
              child: Text(
                "Esqueci minha senha",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'Lato-Black',
                ),
              ),
            )),
      ]),
    );
  }
}

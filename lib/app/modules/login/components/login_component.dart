import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'input_cpf_component.dart';
import 'input_password_component.dart';

class LoginComponent extends StatefulWidget {
  @override
  _LoginComponentState createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  bool ocultPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: EmailInputComponent(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: PasswordInputComponent(
            obscureText: ocultPassword,
            icon: GestureDetector(
              onTap: () => setState(() {
                ocultPassword = !ocultPassword;
              }),
              child: Icon(
                ocultPassword
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash,
                color: Colors.grey,
                size: 16,
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
        ButtonComponent(text: 'ENTRAR'),
        Text("Esqueci minha senha")
      ]),
    );
  }
}

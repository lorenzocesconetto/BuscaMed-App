import 'package:buscamed/app/modules/login/controllers/auth_controller.dart';
import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:buscamed/app/shared/components/erro_text_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'input_email_component.dart';
import 'input_password_component.dart';

class LoginComponent extends StatefulWidget {
  @override
  _LoginComponentState createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  final loginController = Modular.get<AuthController>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool ocultPassword = true;

  final _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (_formKey.currentState.validate()) {
      await loginController.login(
          emailController.text, passwordController.text);
      if (loginController.auth_token) {
        Modular.to.pushNamed("/home");
      }
    }
  }

  Function goResetPassword() {
    loginController.erro = false;
    Modular.to.pushNamed("/forget-pass");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Form(
        key: _formKey,
        child: Column(children: [
          EmailInputComponent(
            controller: emailController,
          ),
          PasswordInputComponent(
            controller: passwordController,
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
          Observer(builder: (_) {
            return loginController.erro
                ? ErrorTextComponent("Ops! Alguma informação não está correta")
                : SizedBox(height: 20);
          }),
          Observer(
              name: "Button Loadind",
              builder: (_) {
                return ButtonComponent(
                  loading: loginController.loading,
                  text: 'ENTRAR',
                  onPressed: () => login(),
                );
              }),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () => goResetPassword(),
                child: Text(
                  "Esqueci minha senha",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: 'Lato-Black',
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}

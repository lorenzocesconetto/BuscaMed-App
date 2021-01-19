import 'package:buscamed/app/modules/login/components/input_email_component.dart';
import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:buscamed/app/shared/components/header_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.gray,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderComponent(
              action: () => Modular.to.pop(),
              title: 'Recuperação de Senha',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Text(
                            'Para recuperar a sua senha, digite seu e-mail abaixo e siga as instruções enviadas em sua caixa de mensagens'),
                        EmailInputComponent(),
                      ],
                    ),
                    ButtonComponent(
                      text: 'ENVIAR E-MAIL',
                      onPressed: () => Modular.to.pushNamed("/home"),
                    )
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}

import 'package:buscamed/app/modules/login/components/input_email_component.dart';
import 'package:buscamed/app/modules/login/components/input_password_component.dart';
import 'package:buscamed/app/modules/login/components/input_zipcode_component.dart';
import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:buscamed/app/shared/components/header_component.dart';
import 'package:buscamed/app/shared/components/input_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.gray,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderComponent(
                action: () => Modular.to.pop(),
                title: 'Criação de Conta',
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Text(
                            'Preencha os campos abaixo para criar uma conta e acessar o Buscamed com todos os recursos disponíveis.'),
                        InputComponent(label: 'Nome'),
                        EmailInputComponent(),
                        ZipcodeInputComponent(),
                        PasswordInputComponent(),
                        PasswordInputComponent(
                          label: 'Confirmar senha',
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    ButtonComponent(text: 'REGISTRAR')
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

import 'package:buscamed/app/modules/login/components/input_email_component.dart';
import 'package:buscamed/app/modules/login/controllers/auth_controller.dart';
import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:buscamed/app/shared/components/erro_text_component.dart';
import 'package:buscamed/app/shared/components/header_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final loginController = Modular.get<AuthController>();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future<void> forgetPassword() async {
    if (_formKey.currentState.validate()) {
      await loginController.forgetPassword(emailController.text);
      if (!loginController.erro) {
        loginController.erro = false;
        Modular.to.pushNamed("/login");
      }
    }
  }

  Function backScreen() {
    loginController.erro = false;
    Modular.to.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.gray,
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderComponent(
                action: () => backScreen(),
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
                          Observer(builder: (_) {
                            return loginController.erro
                                ? ErrorTextComponent(
                                    "Ops! Não encontramos um usuário com esse email")
                                : SizedBox(height: 5);
                          }),
                          EmailInputComponent(
                            controller: emailController,
                          ),
                        ],
                      ),
                      Observer(builder: (_) {
                        return ButtonComponent(
                          loading: loginController.loading,
                          text: 'ENVIAR E-MAIL',
                          onPressed: () => forgetPassword(),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}

import 'package:buscamed/app/modules/login/components/input_email_component.dart';
import 'package:buscamed/app/modules/login/components/input_password_component.dart';
import 'package:buscamed/app/modules/login/components/input_zipcode_component.dart';
import 'package:buscamed/app/modules/login/controllers/auth_controller.dart';
import 'package:buscamed/app/modules/user/controllers/user_controller.dart';
import 'package:buscamed/app/shared/cepSearch/CepModel.dart';
import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:buscamed/app/shared/components/header_component.dart';
import 'package:buscamed/app/shared/components/input_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final loginController = Modular.get<AuthController>();
  final userController = Modular.get<UserController>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordCheckController = TextEditingController();

  final zipCodeController = TextEditingController();
  final streetController = TextEditingController();
  final numberController = TextEditingController();
  final blockController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _zipCodeKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (_formKey.currentState.validate()) {
      // await loginController.login(
      //     emailController.text, passwordController.text);
      if (loginController.auth_token) {
        //Modular.to.pushNamed("/home");
      }
    }
  }

  Future<void> searchZipCode() async {
    CepModel addressInfo =
        await userController.getInfoCep(zipCodeController.text);
    streetController.text = addressInfo.logradouro;
    blockController.text = addressInfo.bairro;
    cityController.text = addressInfo.localidade;
    stateController.text = addressInfo.uf;
  }

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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                              'Preencha os campos abaixo para criar uma conta e acessar o Buscamed com todos os recursos disponíveis.'),
                          InputComponent(
                            validator: true,
                            label: 'Nome',
                            controller: nameController,
                          ),
                          EmailInputComponent(
                            controller: emailController,
                          ),
                          PasswordInputComponent(
                            controller: passwordController,
                          ),
                          PasswordInputComponent(
                            controller: passwordCheckController,
                            label: 'Confirmar senha',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: ZipcodeInputComponent(
                              controller: zipCodeController,
                            )),
                            Observer(builder: (_) {
                              return ButtonComponent(
                                loading: userController.loading,
                                text: 'Buscar',
                                onPressed: () => searchZipCode(),
                              );
                            })
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: InputComponent(
                                  controller: streetController,
                                  label: 'Logradouro',
                                  readOnly: true,
                                )),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: InputComponent(
                                  label: 'Número',
                                  controller: numberController,
                                  keyboardInputType: TextInputType.number),
                            ),
                          ],
                        ),
                        InputComponent(
                          validator: true,
                          readOnly: true,
                          label: 'Bairro',
                          controller: blockController,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: InputComponent(
                                  controller: cityController,
                                  validator: true,
                                  readOnly: true,
                                  label: 'Cidade',
                                )),
                            SizedBox(width: 10),
                            Expanded(
                                flex: 1,
                                child: InputComponent(
                                  controller: stateController,
                                  validator: true,
                                  readOnly: true,
                                  label: 'Estado',
                                )),
                          ],
                        ),
                      ],
                    ),
                    ButtonComponent(
                      loading: loginController.loading,
                      text: 'REGISTRAR',
                      onPressed: () => login(),
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

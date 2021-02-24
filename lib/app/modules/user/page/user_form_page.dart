import 'package:buscamed/app/modules/login/components/input_email_component.dart';
import 'package:buscamed/app/modules/login/components/input_password_component.dart';
import 'package:buscamed/app/modules/login/components/input_zipcode_component.dart';
import 'package:buscamed/app/modules/login/controllers/auth_controller.dart';
import 'package:buscamed/app/modules/user/controllers/user_controller.dart';
import 'package:buscamed/app/modules/user/models/user_model.dart';
import 'package:buscamed/app/shared/cepSearch/CepModel.dart';
import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:buscamed/app/shared/components/header_component.dart';
import 'package:buscamed/app/shared/components/input_component.dart';
import 'package:buscamed/app/shared/components/input_phone_component.dart';
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
  final phoneController = TextEditingController();
  final passwordCheckController = TextEditingController();

  final zipCodeController = TextEditingController();
  final streetController = TextEditingController();
  final numberController = TextEditingController();
  final blockController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();

  bool diferrentPass = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (_formKey.currentState.validate()) {
      if (passwordController.text != passwordCheckController.text) {
        setState(() => diferrentPass = true);
      } else {
        setState(() => diferrentPass = false);

        UserModel newuser = new UserModel(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            password: passwordController.text,
            logradouro: streetController.text,
            complemento: numberController.text,
            bairro: blockController.text,
            municipio: cityController.text,
            uf: stateController.text,
            cep: zipCodeController.text.replaceAll(RegExp('-'), ''));

        await userController.createUser(newuser);
        if (userController.user != null) {
          Modular.to.pushNamed("/login");
        } else {}
      }
    }
  }

  Future<void> searchZipCode() async {
    CepModel addressInfo =
        await userController.getInfoCep(zipCodeController.text);
    if (addressInfo != null) {
      streetController.text = addressInfo.logradouro;
      blockController.text = addressInfo.bairro;
      cityController.text = addressInfo.localidade;
      stateController.text = addressInfo.uf;
    }
  }

  @override
  void dispose() {
    super.dispose();
    userController.cleanErrors();
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Text(
                              'Preencha os campos abaixo para criar uma conta e acessar o Buscamed com todos os recursos disponíveis.'),
                          InputComponent(
                            checkEmpty: true,
                            label: 'Nome',
                            controller: nameController,
                          ),
                          EmailInputComponent(
                            controller: emailController,
                          ),
                          PhoneInputComponent(
                            controller: phoneController,
                          ),
                          PasswordInputComponent(
                            label: "Senha (Mínimo 7 digitos)",
                            controller: passwordController,
                          ),
                          PasswordInputComponent(
                            controller: passwordCheckController,
                            label: 'Confirmar senha',
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Visibility(
                        visible: diferrentPass,
                        child: Text(
                          "Senha estão diferentes",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
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
                                    checkEmpty: true,
                                  )),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: InputComponent(
                                    label: 'N°/Compl.',
                                    checkEmpty: true,
                                    controller: numberController),
                              ),
                            ],
                          ),
                          InputComponent(
                            checkEmpty: true,
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
                                    checkEmpty: true,
                                    readOnly: true,
                                    label: 'Cidade',
                                  )),
                              SizedBox(width: 10),
                              Expanded(
                                  flex: 1,
                                  child: InputComponent(
                                    controller: stateController,
                                    checkEmpty: true,
                                    readOnly: true,
                                    label: 'Estado',
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Observer(
                        builder: (_) => Column(
                          children: [
                            _errorMsg(),
                            ButtonComponent(
                              loading: userController.loading,
                              text: 'REGISTRAR',
                              onPressed: () => login(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  Widget _errorMsg() {
    return userController.errors != null
        ? Text(
            userController.errors,
            style: TextStyle(color: Colors.red),
          )
        : Container();
  }
}

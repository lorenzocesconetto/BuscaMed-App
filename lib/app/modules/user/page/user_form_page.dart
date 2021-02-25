import 'dart:async';

import 'package:buscamed/app/modules/login/components/input_email_component.dart';
import 'package:buscamed/app/modules/login/components/input_password_component.dart';
import 'package:buscamed/app/modules/login/components/input_zipcode_component.dart';
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
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final userController = Modular.get<UserController>();
  var maskFormatterCPF = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

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

  UserModel user;
  String textSearchZipCode = '';
  Timer _debounce;

  @override
  void initState() {
    zipCodeController.addListener(() => listeningZipCodeInput());
    super.initState();
    if (userController.user != null) {
      user = userController.user;
      textSearchZipCode = maskFormatterCPF.maskText(user.cep);
      setDate();
    }
  }

  listeningZipCodeInput() {
    String search = zipCodeController.value.text;
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (search.length == 9 && textSearchZipCode != search) {
        textSearchZipCode = search;
        await searchZipCode();
      } else if (search.length == 0 && textSearchZipCode != search) {
        textSearchZipCode = search;
        cleanAddress();
      }
    });
  }

  setDate() {
    nameController.text = user.name;
    phoneController.text = user.phone;
    passwordController.text = user.password;
    emailController.text = user.email;
    zipCodeController.text = maskFormatterCPF.maskText(user.cep);
    streetController.text = user.logradouro;
    numberController.text = user.complemento;
    blockController.text = user.bairro;
    cityController.text = user.municipio;
    stateController.text = user.uf;
  }

  bool diferrentPass = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if (_formKey.currentState.validate()) {
      if (user == null) {
        if (passwordController.text != passwordCheckController.text) {
          setState(() => diferrentPass = true);
        } else {
          setState(() => diferrentPass = false);

          UserModel userModel = new UserModel(
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

          await userController.createUser(userModel);
          if (userController.user != null) {
            Modular.to.pushNamed("/login");
          }
        }
      } else {
        UserModel userModel = new UserModel(
            name: nameController.text,
            phone: phoneController.text,
            logradouro: streetController.text,
            complemento: numberController.text,
            bairro: blockController.text,
            municipio: cityController.text,
            uf: stateController.text,
            cep: zipCodeController.text.replaceAll(RegExp('-'), ''));

        await userController.editUser(userModel);
        if (userController.errors == null) {
          Modular.to.pop();
        }
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
    } else {
      cleanAddress();
    }
  }

  cleanAddress() {
    streetController.text = "";
    blockController.text = "";
    cityController.text = "";
    stateController.text = "";
  }

  @override
  void dispose() {
    super.dispose();
    userController.cleanErrors();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    passwordCheckController.dispose();
    zipCodeController.dispose();
    streetController.dispose();
    numberController.dispose();
    blockController.dispose();
    stateController.dispose();
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
                title: user == null ? 'Criação de Conta' : 'Editar dados',
              ),
              Padding(
                padding: user == null
                    ? EdgeInsets.all(36.0)
                    : EdgeInsets.symmetric(vertical: 0, horizontal: 36),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          user == null
                              ? Text(
                                  'Preencha os campos abaixo para criar uma conta e acessar o Buscamed com todos os recursos disponíveis.')
                              : SizedBox(),
                          InputComponent(
                            checkEmpty: true,
                            label: 'Nome',
                            controller: nameController,
                          ),
                          user == null
                              ? EmailInputComponent(
                                  controller: emailController,
                                )
                              : SizedBox(),
                          PhoneInputComponent(
                            controller: phoneController,
                          ),
                          user == null
                              ? PasswordInputComponent(
                                  label: "Senha (Mínimo 7 digitos)",
                                  controller: passwordController,
                                )
                              : SizedBox(),
                          user == null
                              ? PasswordInputComponent(
                                  controller: passwordCheckController,
                                  label: 'Confirmar senha',
                                )
                              : SizedBox(),
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
                      user == null ? SizedBox(height: 20) : SizedBox(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: ZipcodeInputComponent(
                                controller: zipCodeController,
                              )),
                              // Observer(builder: (_) {
                              //   return ButtonComponent(
                              //     loading: userController.loading,
                              //     text: 'Buscar',
                              //     onPressed: () => searchZipCode(),
                              //   );
                              // })
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
                              text: user == null ? 'REGISTRAR' : 'EDITAR',
                              onPressed: () => register(),
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
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              userController.errors,
              style: TextStyle(color: Colors.red),
            ),
          )
        : Container();
  }
}

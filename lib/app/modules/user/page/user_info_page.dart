import 'package:buscamed/app/modules/user/controllers/user_controller.dart';
import 'package:buscamed/app/shared/components/button_secundary_component.dart';
import 'package:buscamed/app/shared/components/header_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final userController = Modular.get<UserController>();

  @override
  void initState() {
    super.initState();
    userController.getUserLogin();
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
                title: 'Perfil do Usuário',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("INFORMAÇÕES"),
                    SizedBox(
                      height: 20,
                    ),
                    new Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Observer(
                            builder: (_) {
                              if (userController.user != null) {
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    dateUser('Nome', userController.user.name),
                                    dateUser(
                                        'E-mail', userController.user.email),
                                    dateUser('CEP', userController.user.cep),
                                    dateUser(
                                        'Telefone', userController.user.phone),
                                    dateUser('Logradouro',
                                        userController.user.logradouro),
                                    dateUser('N°/Complemento',
                                        userController.user.complemento),
                                    dateUser(
                                        'Bairro', userController.user.bairro),
                                    dateUser('Cidade',
                                        userController.user.municipio),
                                    dateUser('Estado', userController.user.uf),
                                    ButtonSecundaryComponent(
                                      text: 'Editar',
                                      onPressed: () =>
                                          Modular.to.pushNamed('/user-form'),
                                    )
                                  ],
                                );
                              } else if (userController.loading) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return Text(userController.errors);
                              }
                            },
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        )));
  }

  Widget dateUser(String title, String date) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.green),
          ),
          date != null ? Text(date): SizedBox()
        ],
      ),
    );
  }
}

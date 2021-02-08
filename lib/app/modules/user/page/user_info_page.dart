import 'package:buscamed/app/modules/user/controllers/user_controller.dart';
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
                                    Text(
                                      'Nome',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text(userController.user.name),
                                    SizedBox(height: 15),
                                    Text(
                                      'E-mail',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text('fulano@gmail.com'),
                                    SizedBox(height: 15),
                                    Text(
                                      'CEP',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text('12345-678'),
                                  ],
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
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
}

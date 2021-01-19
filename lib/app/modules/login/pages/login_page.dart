import 'package:buscamed/app/modules/login/components/login_component.dart';
import 'package:buscamed/app/shared/components/button_secundary_component.dart';
import 'package:buscamed/app/shared/components/logo_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../components/zipcode_login_component.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  bool selectedWidgetLogin = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.gray,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  LogoComponent(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Container(
                      height: 300,
                      child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 400),
                          child: getCustomContainer()),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ButtonSecundaryComponent(
                      text: selectedWidgetLogin
                          ? 'FAZER CADASTRO'
                          : 'VOLTAR A TELA DE LOGIN',
                      onPressed: () => {
                        if (selectedWidgetLogin)
                          {Modular.to.pushNamed('/user-form')}
                        else
                          {
                            setState(() {
                              selectedWidgetLogin = !selectedWidgetLogin;
                            })
                          }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  AnimatedOpacity(
                    opacity: selectedWidgetLogin ? 1 : 0,
                    duration: Duration(milliseconds: 400),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedWidgetLogin = !selectedWidgetLogin;
                          });
                        },
                        child: Text(
                          'Entrar sem Login',
                          style: TextStyle(
                              fontFamily: 'Lato-Black', color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getCustomContainer() {
    return selectedWidgetLogin ? LoginComponent() : DocumentLoginComponent();
  }
}

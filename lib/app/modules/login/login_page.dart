import 'package:buscamed/app/modules/login/components/login_component.dart';
import 'package:buscamed/app/shared/components/button_component.dart';
import 'package:buscamed/app/shared/components/logo_component.dart';
import 'package:buscamed/app/shared/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/documento_login_component.dart';

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoComponent(),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Container(
                        height: 300,
                        child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 800),
                            child: getCustomContainer()),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      )),
                  ButtonComponent(
                    text: 'CPF',
                    onPressed: () {
                      setState(() {
                        selectedWidgetLogin = !selectedWidgetLogin;
                      });
                    },
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

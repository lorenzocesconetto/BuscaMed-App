import 'package:buscamed/app/modules/login/controllers/auth_controller.dart';
import 'package:buscamed/app/modules/user/controllers/user_controller.dart';
import 'package:buscamed/app/shared/components/logo_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreenPage> {
  final authController = Modular.get<AuthController>();
  final userController = Modular.get<UserController>();

  @override
  void initState() {
    super.initState();
    loadingInfo();
  }

  loadingInfo() async {
    await authController.getIsAuth();
    if (!authController.loading) {
      if (authController.auth_token != null && authController.auth_token) {
        Modular.to.popAndPushNamed("/home");
      } else {
        Modular.to.popAndPushNamed("/login");
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo_b@3x.png"),
                    fit: BoxFit.contain)),
            child: Center(
              child: LogoComponent(),
            ),
          ),
        ),
      ),
    );
  }
}

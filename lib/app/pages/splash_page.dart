import 'dart:async';

import 'package:buscamed/app/shared/components/logo_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Modular.to.popAndPushNamed("/login");
    });
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

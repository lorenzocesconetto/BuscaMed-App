import 'package:flutter/cupertino.dart';

class LogoComponent extends StatelessWidget {
  final bool small;

  LogoComponent({this.small = false});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo.png",
      height: small ? 30 : 55,
    );
  }
}

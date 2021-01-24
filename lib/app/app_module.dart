import 'package:buscamed/app/modules/home/home_page.dart';
import 'package:buscamed/app/modules/login/pages/login_page.dart';
import 'package:buscamed/app/modules/product/pages/product_page.dart';
import 'package:buscamed/app/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart.dart';
import 'modules/login/pages/forget_pass_page.dart';
import 'modules/user/page/user_form_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/splash', child: (_, __) => SplashScreenPage()),
        ModularRouter('/home', child: (_, __) => HomePage()),
        ModularRouter('/forget-pass', child: (_, __) => ForgetPasswordPage()),
        ModularRouter('/user-form', child: (_, __) => UserFormPage()),
        ModularRouter('/client-form', child: (_, __) => HomePage()),
        ModularRouter('/login', child: (_, __) => LoginPage()),
        ModularRouter('/product', child: (_, __) => ProductPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}

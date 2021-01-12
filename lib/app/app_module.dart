import 'package:buscamed/app/modules/home/home.dart';
import 'package:buscamed/app/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/splash', child: (_, __) => SplashScreenPage()),
        ModularRouter('/home', child: (_, __) => HomePage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}

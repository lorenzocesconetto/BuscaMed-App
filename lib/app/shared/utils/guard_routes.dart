import 'package:buscamed/app/modules/login/controllers/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GuardRoutes implements RouteGuard {
  final loginController = Modular.get<AuthController>();

  @override
  bool canActivate(String url) {
    if (loginController.auth_token != null && loginController.auth_token) {
      return true;
    } else {
      Modular.to.popAndPushNamed('/login');
      return false;
    }
  }

  @override
  List<GuardExecutor> get executors => [];
}

import 'package:buscamed/app/modules/user/controllers/user_controller.dart';
import 'package:buscamed/app/shared/repositories/auth_repository.dart';
import 'package:buscamed/app/shared/service/shared_local_storage_service.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final AuthRepository repository;
  final SharedLocalStorageService localStorage;
  final UserController userController;

  _AuthController(this.repository, this.localStorage, this.userController);

  @observable
  bool auth_token;

  @observable
  bool _loadingStatus = false;

  @observable
  bool erro = false;

  @action
  login(String username, String password) async {
    _loadingStatus = true;
    erro = false;
    final token = await repository.getToken(username, password);
    if (token != null) {
      localStorage.put("auth_token", token);
      //await setUserController(token);
      auth_token = true;
      erro = false;
    } else {
      auth_token = false;
      erro = true;
    }
    _loadingStatus = false;
  }

  @action
  forgetPassword(String username) async {
    _loadingStatus = true;
    final forgetPassword = await repository.forgetPassword(username);
    if (!forgetPassword) {
      await localStorage.delete("auth_token");
      auth_token = false;
      erro = true;
    } else {
      erro = false;
    }
    _loadingStatus = false;
  }

  @action
  logout() async {
    await localStorage.delete("auth_token");
    auth_token = null;
  }

  @action
  getIsAuth() async {
    var token = await localStorage.get("auth_token");
    if (token != null) await setUserController(token);
  }

  void setUserController(String token) async {
    await userController.getUserLogin();
    auth_token = userController.errors == null;
  }

  @computed
  bool get loading => _loadingStatus;
}

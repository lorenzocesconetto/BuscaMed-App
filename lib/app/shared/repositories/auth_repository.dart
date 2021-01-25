import 'package:buscamed/app/modules/login/model/login.dart';

import 'BaseRepository.dart';

class AuthRepository {
  final BaseRepository baseRepository;

  AuthRepository(this.baseRepository);

  @override
  Future<String> getToken(username, password) async {
    try {
      var response = await baseRepository.post(
          url: "/api/login",
          body: new LoginModel(email: username, password: password).toJson());
      // if (response.headers.value("authorization").isNotEmpty) {
      //   return response.headers.value("authorization");
      // }
      print("Chamada Login: ${response.statusCode}");
      if (response.statusCode == 200) {
        return response.headers["set-cookie"][0];
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<bool> forgetPassword(username) async {
    try {
      var response = await baseRepository
          .post(url: "/api/forgot_password", body: {"email": username});
      // if (response.headers.value("authorization").isNotEmpty) {
      //   return response.headers.value("authorization");
      // }
      print("Chamada Forget Password: ${response.statusCode}");
      return response.statusCode == 200;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

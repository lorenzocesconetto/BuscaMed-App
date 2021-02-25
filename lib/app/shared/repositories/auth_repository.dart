import 'dart:convert';

import 'BaseRepository.dart';

class AuthRepository {
  final BaseRepository baseRepository;

  AuthRepository(this.baseRepository);

  @override
  Future<String> getToken(username, password) async {
    try {
      var response = await baseRepository.login(
          url: "/token",
          auth: 'Basic ' + base64Encode(utf8.encode('$username:$password')));
      if (response.statusCode == 200) {
        return response.data["token"];
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<bool> forgetPassword(username) async {
    try {
      var response = await baseRepository.post(
          url: "/forgot_password", body: {"email": username}, getToken: false);
      print("Chamada Forget Password: ${response.statusCode}");
      return response.statusCode == 200;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

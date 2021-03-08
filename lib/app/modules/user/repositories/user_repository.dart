import 'package:buscamed/app/modules/user/models/user_model.dart';
import 'package:buscamed/app/shared/repositories/BaseRepository.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final BaseRepository baseRepository;

  UserRepository(this.baseRepository);

  Future<dynamic> getUser() async {
    try {
      var response = await baseRepository.get(url: "/user");
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> createUser(UserModel model) async {
    try {
      var response =
          await baseRepository.post(url: "/register", body: model.toJson());
      if (response.data["success"]) {
        return response.data;
      }
    } on DioError catch (dioError) {
      print(dioError);
      return dioError.response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> editUser(UserModel model) async {
    try {
      var response =
          await baseRepository.post(url: "/user", body: model.editToJson());
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> deleteUser(String uuid) async {
    try {
      var response = await baseRepository.delete(url: "/users/$uuid");
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> findServiceByUuid(String uuid) async {
    try {
      var response = await baseRepository.get(url: "/users/$uuid/services");
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

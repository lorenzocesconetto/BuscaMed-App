import 'package:buscamed/app/modules/user/models/user_model.dart';
import 'package:buscamed/app/shared/repositories/BaseRepository.dart';

class UserRepository {
  final BaseRepository baseRepository;

  UserRepository(this.baseRepository);

  Future<dynamic> getUser(String uuid) async {
    try {
      var response = await baseRepository.get(url: "/users/$uuid");
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
      var response = await baseRepository.post(url: "/users/", body: model);
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> editUser(String uuid, UserModel model) async {
    try {
      var response =
          await baseRepository.put(url: "/users/$uuid", body: model.toJson());
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

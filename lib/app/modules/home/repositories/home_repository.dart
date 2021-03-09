import 'package:buscamed/app/shared/repositories/BaseRepository.dart';

class HomeRepository {
  final BaseRepository baseRepository;

  HomeRepository(this.baseRepository);

  Future<dynamic> getHome() async {
    try {
      var response = await baseRepository.get(url: "/index");
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> searchProduct({String searchName, int page = 1}) async {
    try {
      var response =
          await baseRepository.get(url: "/search?q=$searchName&page=$page");
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> autoComplete({String searchName}) async {
    try {
      var response =
          await baseRepository.get(url: "/autocomplete?q=$searchName");
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

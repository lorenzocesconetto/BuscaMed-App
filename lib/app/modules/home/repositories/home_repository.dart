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
}

import 'package:buscamed/app/shared/repositories/BaseRepository.dart';

class ProductRepository {
  final BaseRepository baseRepository;

  ProductRepository(this.baseRepository);

  getProduct(String id) async {
    try {
      var response = await baseRepository.get(url: "/detail?id=$id");
      if (response.data != null) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

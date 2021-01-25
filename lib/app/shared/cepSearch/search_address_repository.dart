import 'package:dio/dio.dart';

import 'CepModel.dart';

class SearchAddressRepository {
  final Dio dio;

  SearchAddressRepository(this.dio);

  @override
  Future<CepModel> getInfoByCep(String cep) async {
    try {
      var response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200) {
        return CepModel.fromMap(response.data);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

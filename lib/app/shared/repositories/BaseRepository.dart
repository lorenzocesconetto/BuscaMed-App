import 'dart:convert';

import 'package:buscamed/app/shared/service/shared_local_storage_service.dart';
import 'package:dio/dio.dart';

class BaseRepository {
  final Dio dio;
  final SharedLocalStorageService localStorageService;

  BaseRepository(this.dio, this.localStorageService);

  getHearder() async {
    String token = await localStorageService.get("auth_token");
    dio.options.headers['content-type'] = 'application/json';
    if (token != null)
      dio.options.headers["authorization"] =
          'Basic ' + base64Encode(utf8.encode('$token:' ''));
  }

  Future get({String url}) async {
    await getHearder();
    return await dio.get(url);
  }

  Future post({String url, dynamic body}) async {
    await getHearder();
    return await dio.post(url, data: body);
  }

  Future put({String url, dynamic body}) async {
    await getHearder();
    return await dio.put(url, data: body);
  }

  Future delete({String url}) async {
    await getHearder();
    return await dio.delete(url);
  }

  Future login({String url, var auth}) async {
    dio.options.headers['content-type'] = 'application/json';
    dio.options.headers['authorization'] = auth;
    return await dio.get(url);
  }
}

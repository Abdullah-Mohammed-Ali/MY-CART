import 'package:dio/dio.dart';
import 'package:mycart/data/constants.dart';

class Api {
  Dio? dio;

  Api() {
    BaseOptions options = BaseOptions(
      baseUrl: basicUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
      connectTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List> fetchData() async {
    Response? response = await dio?.get('', queryParameters: {'name': ''});
    return response!.data;
  }
}

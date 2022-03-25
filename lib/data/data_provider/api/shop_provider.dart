import 'package:dio/dio.dart';
import 'package:mycart/data/constants.dart';
import 'package:mycart/data/data_provider/api/path_end_points.dart';

class ShopProvider {
  static late Dio _dio;

  static init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: path,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    _dio = Dio(baseOptions);
  }

  static Future<Response?> getCategories() async {
    _dio.options.headers = {'lang': 'en'};
    try {
      Response response = await _dio.get(categories);
      return response;
    } catch (e) {
      print(e);
    }
  }

  static Future<Response> getData({required String path}) async {
    _dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    Response response = await _dio.get(path);
    return response;
  }

  static Future<Response> setData(
      {required String key, required var data, required String path}) async {
    _dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await _dio.post(path, data: {key: data});
  }
}

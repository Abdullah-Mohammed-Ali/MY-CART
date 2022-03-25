import 'package:dio/dio.dart';
import 'package:mycart/data/data_provider/api/path_end_points.dart';

class ApiAuth {
  static late Dio _dio;
  static init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: path,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
      connectTimeout: 20 * 1000,
    );
    _dio = Dio(baseOptions);
  }

  static Future<Response>? postData(
      {required String path,
      Map<String, String>? parameters,
      required Map<String, dynamic> data}) {
    return _dio.post(
      path,
      data: data,
      queryParameters: parameters,
    );
  }

  static Future<Response> logOut(String token) async {
    Response response =
        await _dio.post('logout', queryParameters: {'fcm_token': token});
    return response;
  }

  static Future<Response?> getProfile({required String token}) async {
    try {
      _dio.options.headers = {'Authorization': token};
      Response response = await _dio.get('profile');

      print(response.data);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:mycart/data/data_model/login_model.dart';
import 'package:mycart/data/data_model/user.dart';
import 'package:mycart/data/data_provider/api/login_provider.dart';
import '../constants.dart';

class AuthRepository {
  Future<LoginModel> login(
      {required String email, required String password}) async {
    Response? response = await ApiAuth.postData(path: Login, data: {
      'email': email,
      'password': password,
    });
    LoginModel loginModel = LoginModel.fromJSON(response!.data);
    return loginModel;
  }

  Future<LoginModel> register(Map<String, dynamic> data) async {
    Response? response = await ApiAuth.postData(path: Register, data: data);
    LoginModel loginModel = LoginModel.fromJSON(response!.data);
    return loginModel;
  }

  Future<String> logOut(String token) async {
    String message = '';
    await ApiAuth.logOut(token)
        .then((value) => message = value.data['message'])
        .catchError((error) => message = error);
    return message;
  }

  // todo : continue when i come back from work ...
  Future<User?> getProfile({required String token}) async {
    Response? response = await ApiAuth.getProfile(token: token);
    User? user;
    if (response!.data['status'] == true) {
      user = User.fromJSON(json: response.data['data']);
    } else {
      return null;
    }
    return user;
  }
}

import 'package:mycart/data/data_model/user.dart';

class LoginModel {
  bool? status;
  String? message;
  User? data;

  LoginModel.fromJSON(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = User.fromJSON(json: json["data"]);
  }
}

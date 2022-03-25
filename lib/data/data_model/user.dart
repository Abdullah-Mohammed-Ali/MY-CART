class User {
  late String name;
  late String email;
  late String password;
  late String photo;
  late String phone;
  String? token;
  int? points;
  int? credit;

  User({
    required String name,
    required String email,
    required String password,
    required String photo,
    required String phone,
    this.token,
    this.points,
    this.credit,
  });

  User.fromJSON({required Map<String, dynamic> json}) {
    name = json["name"];
    // password = json['password'];
    email = json['email'];
    photo = json['image'];
    phone = json['phone'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}

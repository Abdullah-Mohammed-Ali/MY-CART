class DBModel {
  int? id;
  String? name;

  DBModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }

  static Map toMap({required DBModel dbModel}) {
    Map<String, dynamic> map = {};
    map['name'] = dbModel.name;
    map['id'] = dbModel.id;
    return map;
  }
}

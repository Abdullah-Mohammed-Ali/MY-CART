class CategoriesModel {
  bool? status;
  String? message;
  List<CategoryModel>? data = [];

  CategoriesModel.fromJSON(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    json["data"]['data'].forEach(
      (e) => data!.add(CategoryModel.fromJSON(e)),
    );
  }
}

class FavModels {
  late bool status;
  late String message;

  FavModels.fromJSON(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}

class CategoryModel {
  int? id;
  String? image;
  String? name;

  CategoryModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    name = json["name"];
  }
}

class ProductModel {
  late int id;
  late var price;
  late var oldPrice;
  late var discount;
  late String image;
  late String name;
  late String description;
  late List<String> images = [];
  late bool? inFav;
  late bool? inCart;

  ProductModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    oldPrice = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    description = json["description"];
    if (json['images'] != null) {
      json["images"].forEach((e) => images.add(e));
    }
    inFav = json['in_favorites'];
    inCart = json["in_cart"];
  }
}

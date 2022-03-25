import 'dart:math';

import 'package:mycart/data/data_model/shop_models.dart';

class HomeModel {
  bool? status;
  String? message;
  List<BannerModel> banners = [];
  List<ProductModel> products = [];
  HomeModel.fromJSON(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    json['data']['banners'].forEach(
      (e) => banners.add(
        BannerModel.fromJSON(e),
      ),
    );
    json["data"]["products"]
        .map(
          (e) => products.add(ProductModel.fromJSON(e)),
        )
        .toList();
  }
}

class BannerModel {
  late int? id;
  late String? image;
  late String? category;
  late String? product;

  BannerModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    category = json["category"];
    product = json["product"];
  }
}

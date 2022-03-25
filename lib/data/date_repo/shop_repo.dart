import 'package:dio/dio.dart';
import 'package:mycart/data/data_model/home_model.dart';
import 'package:mycart/data/data_model/shop_models.dart';
import 'package:mycart/data/data_provider/api/path_end_points.dart';
import 'package:mycart/data/data_provider/api/shop_provider.dart';

class ShopRepo {
  static HomeModel? _homeModel;
  static Future<CategoriesModel?> getCategories() async {
    Response? response = await ShopProvider.getCategories();
    CategoriesModel? categories;
    categories = CategoriesModel.fromJSON(response!.data);

    return categories;
  }

  static Future<HomeModel> getHome() async {
    Response response = await ShopProvider.getData(path: 'home');

    _homeModel = HomeModel.fromJSON(response.data);

    return _homeModel!;
  }

  static Future<FavModels> setFav({required int id}) async {
    Response response =
        await ShopProvider.setData(key: favoriteKey, data: id, path: favorite);
    FavModels models = FavModels.fromJSON(response.data);
    return models;
  }

  static Future<List<ProductModel>> getFavs() async {
    Response response = await ShopProvider.getData(path: favorite);
    List data = response.data['data']['data'];
    List<ProductModel> favProducts = [];
    data.forEach((element) {
      favProducts.add(
        ProductModel.fromJSON(element['product']),
      );
    });
    return favProducts;
  }

  static Future<List<ProductModel>> searchProducts(
      {required String search}) async {
    Response response = await ShopProvider.setData(
        key: searchKey, data: search, path: searchEndPoint);
    List<ProductModel> searchList = [];
    response.data['data']['data']
        .forEach((element) => searchList.add(ProductModel.fromJSON(element)));
    return searchList;
  }
}

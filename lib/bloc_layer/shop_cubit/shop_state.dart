part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class CategoryLoading extends ShopState {}

class CategorySuccess extends ShopState {
  CategoriesModel categoriesModel;
  CategorySuccess(this.categoriesModel);
}

class BannerSuccess extends ShopState {
  HomeModel homeModel;
  BannerSuccess(this.homeModel);
}

class ScreenSuccess extends ShopState {}

class FavsSuccess extends ShopState {}

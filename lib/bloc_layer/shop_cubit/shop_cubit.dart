import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mycart/data/data_model/home_model.dart';
import 'package:mycart/data/data_model/shop_models.dart';
import 'package:mycart/data/date_repo/shop_repo.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);
  List<CategoryModel>? categoriesList;

  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  Future<void> getCategories() async {
    await ShopRepo.searchProducts(search: 'phone');
    print('test');
    emit(CategoryLoading());
    CategoriesModel? categoriesModel = await ShopRepo.getCategories();
    categoriesList = categoriesModel!.data!;
    emit(CategorySuccess(categoriesModel));
  }

  Future<void> updateFavs() async {
    homeModel!.products.forEach((element) {
      favorites.addAll({element.id: element.inFav!});
    });
  }

  Future<void> getHome() async {
    emit(CategoryLoading());
    homeModel = await ShopRepo.getHome();
    updateFavs();
    await getCategories();
    emit(ScreenSuccess());
  }

  Future<void> setFav({required int id}) async {
    favorites[id] = !favorites[id]!;
    emit(ScreenSuccess());
    print(id);
    await ShopRepo.setFav(id: id);
    emit(ScreenSuccess());
    // await getHome();
  }
}

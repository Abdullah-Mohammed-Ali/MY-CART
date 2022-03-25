import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mycart/bloc_layer/shop_cubit/shop_cubit.dart';
import 'package:mycart/data/data_model/shop_models.dart';
import 'package:mycart/data/date_repo/shop_repo.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  static FavCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  Future<void> getFavs() async {
    emit(LoadingFavsState());
    try {
      products = await ShopRepo.getFavs();
      emit(FavsSuccess());
    } catch (e) {
      emit(FavsError(error: e.toString()));
    }
  }

  Future<void> setFav(int id) async {
    emit(LoadingFavsState());
    FavModels favsModel = await ShopRepo.setFav(id: id);
    await getFavs();
  }
}

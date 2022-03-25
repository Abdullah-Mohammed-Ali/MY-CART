part of 'fav_cubit.dart';

@immutable
abstract class FavState {}

class FavInitial extends FavState {}

class LoadingFavsState extends FavState {}

class FavsSuccess extends FavState {}

class FavsError extends FavState {
  String error;
  FavsError({required this.error});
}

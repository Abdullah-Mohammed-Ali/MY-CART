import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mycart/bloc_layer/login_cubit/login_cubit.dart';
import 'package:mycart/data/constants.dart';
import 'package:mycart/data/data_model/user.dart';
import 'package:mycart/data/date_repo/auth_repo.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  static SettingCubit get(context) => BlocProvider.of(context);
  AuthRepository _authRepository = AuthRepository();
  User? currentUser;

  Future<void> getUser() async {
    emit(LoadingProfile());
    currentUser = await _authRepository.getProfile(token: token!);
    emit(ProfileSuccess(currentUser!));
  }

  Future<void> logOut() async {
    emit(LoadingProfile());
    await _authRepository.logOut(token!);
    emit(LogOutSuccess());
  }
}

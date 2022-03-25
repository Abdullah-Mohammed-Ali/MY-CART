import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mycart/data/constants.dart';
import 'package:mycart/data/data_model/user.dart';
import 'package:mycart/data/data_provider/local/cashe_helper.dart';
import 'package:mycart/data/date_repo/auth_repo.dart';
import 'package:mycart/routes.dart';
part 'login_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(LoginInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  final AuthRepository _authRepository = AuthRepository();

  User? _currentUser;

  bool ismoved = false;

  void splashChoice({required BuildContext context}) async {
    Future.delayed(Duration(seconds: 2), () async {
      ismoved = true;
      emit(AnimationState());
      print(ismoved);
    });

    String? getUser = await CasheHelper.getData(key: 'token');

    print(getUser);
    if (getUser != null) {
      _currentUser = await getUserProfile(token: getUser);
      token = getUser;
    }

    if (_currentUser == null) {
      Future.delayed(Duration(seconds: 3), () async {
        Navigator.pushReplacementNamed(context, Screens.WelcomeScreen);
      });
    } else {
      Future.delayed(Duration(seconds: 3), () async {
        Navigator.pushReplacementNamed(context, Screens.homeScreen,
            arguments: _currentUser);
      });
    }
  }

  void saveUser({required String token}) async {
    await CasheHelper.saveData(key: 'token', value: token);
  }

  Future<User?> getUserProfile({required String token}) async {
    return await _authRepository.getProfile(token: token);
  }

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    _authRepository.login(email: email, password: password).then((value) {
      _currentUser = value.data;
      token = _currentUser!.token;
      if (value.status == true) {
        saveUser(token: _currentUser!.token!);
        emit(LoginSuccess(user: _currentUser));
      }
    }).catchError(
      (error) => emit(LoginError(error.toString())),
    );
  }

  void register(
      {required String name,
      required String phone,
      required String email,
      required String password,
      String? image}) async {
    await _authRepository.register({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image
    }).then((value) {
      _currentUser = value.data;
      token = _currentUser!.token;
      if (value.status == true) {
        saveUser(token: _currentUser!.token!);
        emit(LoginSuccess(user: _currentUser));
      }
    }).catchError((error) {
      emit(LoginError(error.toString()));
    });
  }

  void logOut({required BuildContext context}) async {
    emit(LoginLoading());
    await _authRepository.logOut(_currentUser!.token!).then(
      (value) {
        emit(LogoutSuccess(message: value));
        token = '';
        CasheHelper.saveData(key: 'token', value: '');
        Navigator.pushReplacementNamed(context, Screens.WelcomeScreen);
      },
    ).catchError(
      (error) => emit(LoginError(error.toString())),
    );
  }
}

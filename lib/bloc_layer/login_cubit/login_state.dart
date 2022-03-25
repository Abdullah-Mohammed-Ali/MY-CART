part of 'login_cubit.dart';

@immutable
abstract class AuthStates {}

class LoginInitial extends AuthStates {}

class LoginLoading extends AuthStates {}

class AnimationState extends AuthStates {}

class LogoutSuccess extends AuthStates {
  String message;
  LogoutSuccess({required this.message});
}

class LoginSuccess extends AuthStates {
  User? user;
  LoginSuccess({required user}) {
    this.user = user;
  }
}

class LoginError extends AuthStates {
  String? error;
  LoginError(this.error) {
    print(error);
  }
}

part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class LoadingProfile extends SettingState {}

class LogOutSuccess extends SettingState {}

class ProfileSuccess extends SettingState {
  final User user;

  ProfileSuccess(this.user);
}

part of 'setting_bloc.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class PasswordChanged extends SettingState {
  final String message;

  PasswordChanged(this.message);
}

class PasswordChangeError extends SettingState {
  final String message;

  PasswordChangeError({this.message});
}

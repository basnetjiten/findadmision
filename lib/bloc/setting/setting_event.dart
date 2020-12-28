part of 'setting_bloc.dart';

@immutable
abstract class SettingEvent {}

class ChangePassword extends SettingEvent {
  final ChangePwDto passDto;

  ChangePassword({this.passDto});
}

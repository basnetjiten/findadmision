part of 'account_setting_bloc.dart';

@immutable
abstract class AccountSettingState {}

class AccountSettingInitial extends AccountSettingState {

}
class AccountSettingLoaded extends AccountSettingState{
  final SettingLoadRes setting;
  AccountSettingLoaded({this.setting});

}
class AccountSettingRefreshed extends AccountSettingState{
  final SettingLoadRes setting;
  AccountSettingRefreshed({this.setting});

}

class AccountSettingUpdated extends AccountSettingState{
final bool updated;
  AccountSettingUpdated({this.updated});
}


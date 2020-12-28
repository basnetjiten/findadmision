part of 'account_setting_bloc.dart';

@immutable
abstract class AccountSettingEvent {}
class FetchAccountSetting extends AccountSettingEvent{

}
class RefreshAccountSetting extends AccountSettingEvent{

}
class UpdateAccountSetting extends AccountSettingEvent{
  final Map<String,String> formData;
  UpdateAccountSetting({this.formData});
}

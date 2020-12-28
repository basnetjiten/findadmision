import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/home/setting.dart';
import 'package:findadmissionaffiliate/repository/setting_repo.dart';
import 'package:meta/meta.dart';

part 'account_setting_event.dart';

part 'account_setting_state.dart';

class AccountSettingBloc
    extends Bloc<AccountSettingEvent, AccountSettingState> {
  AccountSettingBloc() : super(AccountSettingInitial());

  @override
  Stream<AccountSettingState> mapEventToState(
    AccountSettingEvent event,
  ) async* {
    if (event is FetchAccountSetting) {
      print("callded refreshed");
      final accountSettingRes = await getIt<SettingRepo>().fetchSettingData();
      if (accountSettingRes is SettingLoadRes) {
        print(accountSettingRes.status);
        if (accountSettingRes.status == "success") {
          yield
          AccountSettingLoaded(setting: accountSettingRes);
        }
      }
    }

    if (event is RefreshAccountSetting) {
      print("callded refreshed");
      final accountSettingRes = await getIt<SettingRepo>().fetchSettingData();
      if (accountSettingRes is SettingLoadRes) {
        print(accountSettingRes.status);
        if (accountSettingRes.status == "success") {
          yield  AccountSettingRefreshed(setting: accountSettingRes);
        }
      }
    }
    if (event is UpdateAccountSetting) {
      final successMessage =
          await getIt<SettingRepo>().updateSettingData(event.formData);

      if (successMessage) {
        yield AccountSettingUpdated(updated: successMessage);
      } else {
        yield AccountSettingUpdated(updated: successMessage);
      }
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/dto/change_pw_dto.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/setting_repo.dart';
import 'package:meta/meta.dart';

part 'setting_event.dart';

part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial());

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    if (event is ChangePassword) {
      final pwChangeRes = await getIt<SettingRepo>()
          .changePw(event.passDto);
      if (pwChangeRes.status == "success") {
        yield PasswordChanged(pwChangeRes.message);
      } else {
        yield PasswordChangeError(message: pwChangeRes.message);
      }
    }
  }
}

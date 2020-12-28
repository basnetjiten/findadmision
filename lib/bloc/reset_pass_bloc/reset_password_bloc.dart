import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:meta/meta.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial());

  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    if (event is ResetPasswordBtnPressed) {
      yield ResetPasswordInitial();
      final isResetPassword =
          await getIt<UserRepository>().resetPassword(event.email);
      if (isResetPassword) {
        yield ResetPasswordSent();
      }else{
        yield ResetPasswordUnSent();
      }

    }
  }
}

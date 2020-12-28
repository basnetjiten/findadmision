import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:meta/meta.dart';
part 'pin_verification_event.dart';
part 'pin_verification_state.dart';

class PinVerificationBloc
    extends Bloc<PinVerificationEvent, PinVerificationState> {
  PinVerificationBloc() : super(PinVerificationInitial());

  @override
  Stream<PinVerificationState> mapEventToState(
    PinVerificationEvent event,
  ) async* {

    if (event is PinVerificationBtnPressed) {
      yield PinVerificationInitial();
      final bool valid =
          await getIt<UserRepository>().verifyPin(event.email, event.pin);
      //if true invalid or wrong pin
      if (valid) {
        yield PinVerificationInvalid();
      } else {
        yield PinVerificationValid();
      }
    }
   else if (event is ResendPinVerification) {
      yield PinVerificationInitial();
      final String status =
          await getIt<UserRepository>().resendPinVerification(event.email);
      print("RESEND PIN"+status);
      if (status =="pinchange") {
        yield PinResentToEmail();
      } else if(status =="dologin"){
        yield PinVerificationValidDoLogin();
      }
    }
  }
}

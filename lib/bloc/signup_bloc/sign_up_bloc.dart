import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/dto/signuppost.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/login/error.dart';
import 'package:findadmissionaffiliate/models/signup_response.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:meta/meta.dart';
import 'dart:async';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(SignUpInitial signUpInitial) : super(SignUpInitial());

  @override
  // ignore: must_call_super
  void onTransition(
      Transition<SignUpEvent, SignUpState> transition) {
    print(transition);
  }
  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpButtonPressed) {
     // yield SignUpInitial();
      try {
        final SignUpPost signUpPost = event.signUpPost;


       final response = await getIt<UserRepository>().getSignUpResponse(signUpPost, event.uniqueCode);

        if (response is SignUpResponse) {
          yield SignUpSuccess();
        } else if (response is LoginError) {
          print("HEREEE IS SIGNUP ERROR");
          yield SignUpFailure(message:response.message);
        }
      } catch (_) {
        print("SIGNUP ERORRRO"+_.toString());
      }
    }
  }
}

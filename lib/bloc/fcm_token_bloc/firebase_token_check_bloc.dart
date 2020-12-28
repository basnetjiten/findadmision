import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/dto/fcm_token_post.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/auth/fcm_token_check.dart';
import 'package:findadmissionaffiliate/models/login/error.dart';
import 'package:findadmissionaffiliate/repository/auth_repo.dart';
import 'package:findadmissionaffiliate/repository/user/menu/local_repo.dart';
import 'package:meta/meta.dart';

part 'firebase_token_check_event.dart';

part 'firebase_token_check_state.dart';

class FcmTokenCheckBloc
    extends Bloc<FirebaseTokenCheckEvent, FirebaseTokenCheckState> {
  FcmTokenCheckBloc() : super(FirebaseTokenCheckInitial());

  @override
  Stream<FirebaseTokenCheckState> mapEventToState(
    FirebaseTokenCheckEvent event,
  ) async* {
    if (event is DispatchFcmTokenCheck) {

      final fcmTokenPostData =FcmTokenPostData(firebasetoken:fcmToken,appversion: appVersion );
      final tokenCheckResponse = await getIt<AuthRepository>()

          .firebaseTokeCheck(fcmTokenPostData);
      if (tokenCheckResponse is FcmTokenCheckResponse) {
        if (tokenCheckResponse.status == "success" &&
            tokenCheckResponse.message == "token_found") {

          yield FcmTokenCheckCompleted(
              fcmTokenCheckResponse: tokenCheckResponse);
        }
      } else if (tokenCheckResponse is LoginError) {
        getIt<LocalLoginRepository>().deleteAllLoginResponse();
        yield FcmTokenCheckError();
      }
    }
  }
}

import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_event.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_state.dart';
import 'package:findadmissionaffiliate/bloc/notification_bloc/notification_bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/models/auth/token_check_res.dart';
import 'package:findadmissionaffiliate/models/dashboard_data.dart';
import 'package:findadmissionaffiliate/models/institute/loaddata_label.dart';
import 'package:findadmissionaffiliate/models/login/login_response.dart';
import 'package:findadmissionaffiliate/models/notification_list.dart';
import 'package:findadmissionaffiliate/repository/app_check_repo.dart';
import 'package:findadmissionaffiliate/repository/auth_repo.dart';
import 'package:findadmissionaffiliate/repository/user/menu/local_repo.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;

import 'package:package_info/package_info.dart';

String uniqueCode;
AppCheck appCheck;
LoginTokenInfo loginTokenInfo;
String os;
String appVersion;
String version;
DashboardDataRes dashboardDataRes;
NotificationListRes notificationListRes;
LoadDataLabel loadDataLabel;


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  bool firstStart;
  LocalLoginRepository localLoginRepository;

  AuthenticationBloc({@required this.localLoginRepository})
      : assert(localLoginRepository != null),
        super(AuthenticationInitial());

/*  @override
  AuthenticationState get initialState => AuthenticationUninitialized();*/

  @override
  // ignore: must_call_super
  void onTransition(
      Transition<AuthenticationEvent, AuthenticationState> transition) {
    print(transition);
  }

/*@override
  Stream<AuthenticationState> transformEvents(Stream<AuthenticationEvent> events, Stream<AuthenticationState> Function(AuthenticationEvent event) next) {
   
  //  return super.transformEvents(events, next);

    return (next as AuthenticationState).debounceTime(Duration(seconds: 250));


  */ /* return (events as PublishSubject<AuthenticationEvent>)
        .transform(DebounceStreamTransformer((_) => TimerStream(true, const Duration(milliseconds: 250))));*/ /*


  }*/

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      try {
        final AppCheckRepo _appCheckRepo = getIt<AppCheckRepo>();
        PackageInfo packageInfo = await PackageInfo.fromPlatform();

        // String os;
        //PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        version = packageInfo.buildNumber;
        appVersion = packageInfo.version;
        //print(appVersion);
        if (Platform.isAndroid) {
          os = 'android';
        } else if (Platform.isIOS) {
          os = 'ios';
        }

        final LoginResponse localLoginResponse =
            await getIt<LocalLoginRepository>().getLocalLoginResponse();
        // print("EXECUTED" + localLoginResponse.accessToken);
        if (localLoginResponse != null) {
          if (localLoginResponse.accessToken != null) {
            accessToken = localLoginResponse.accessToken;
            loginTokenInfo = localLoginResponse.tokenInfo;
            final tokenCheckResponse = await getIt<AuthRepository>()
                .checkToken(localLoginResponse.accessToken);

            if (tokenCheckResponse is TokenCheckResponse) {
              if (tokenCheckResponse.status == "success" &&
                  tokenCheckResponse.message == "token_found") {
                //fetch load data partner to fill apply for institute
                loadDataLabel =
                    await getIt<AppCheckRepo>().loadPartnerFormLabel();
                dashboardDataRes =
                    await getIt<UserRepository>().fetchDashboardData();
                NotificationBloc().add(FetchNotification(index:0));
              }
            } else {
              getIt<LocalLoginRepository>().deleteAllLoginResponse();
              print("THIS CHECK");
              yield LogOutUser(loginError: "Token Expired");
              //token not found
            }
          }
        }

        appCheck =
            await _appCheckRepo.getAppCheckData(version: version, os: os);

        if (appCheck.valid) {
          uniqueCode = appCheck.uniquecode;

          int buildVersion = int.parse(version);
          if (appCheck.androidver > buildVersion) {
            yield DisplayUpdateAppMessage(
                appCheck: appCheck,
                version: buildVersion,
                localLoginResponse: localLoginResponse);
          } else {
            yield NoUpdateAppDialog(
                appCheck: appCheck,
                version: buildVersion,
                localLoginResponse: localLoginResponse);
          }
        }
      } catch (_) {
        getIt<LocalLoginRepository>().deleteAllLoginResponse();
        appCheck = await getIt<AppCheckRepo>()
            .getAppCheckData(version: version, os: os);
        print("THIS CHECK");
        yield LogOutUser(loginError: "Token Expired");
      }
    }
    /*   if (state is AuthenticationInitial) {
      try {
        final AppCheckRepo _appCheckRepo = getIt<AppCheckRepo>();
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String version;
        String os;
        //PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        version = packageInfo.buildNumber;

        if (Platform.isAndroid) {
          os = 'android';
        } else if (Platform.isIOS) {
          os = 'ios';
        }
        //});

        final _appCheckData =
            await _appCheckRepo.getAppCheckData(version: version, os: os);

        if (_appCheckData.valid) {
          uniqueCode = _appCheckData.uniquecode;
          appCheck = _appCheckData;
          int buildVersion = int.parse(version);
          if (appCheck.androidver > buildVersion) {

            yield DisplayUpdateAppMessage(
                appCheck: _appCheckData, version: buildVersion);
          } else {


            final LoginResponse localLoginResponse =
            await getIt<LocalLoginRepository>().getLocalLoginResponse();

            if (localLoginResponse != null) {
              if (localLoginResponse.accessToken != null) {
                accessToken = localLoginResponse.accessToken;
                final tokenCheckResponse = await getIt<AuthRepository>()
                    .checkToken(localLoginResponse.accessToken);

                if (tokenCheckResponse is TokenCheckResponse) {
                  if (tokenCheckResponse.status == "success" &&
                      tokenCheckResponse.message == "token_found") {
                    yield UserLoggedInServer(
                        localLoginResponse: localLoginResponse);
                  }
                } else {
                  yield LogOutUser(loginError: "Token Expired");
                  //token not found
                }
              }
            }





            yield NoUpdateAppDialog(
                appCheck: _appCheckData, version: buildVersion);
          }
        }
      } catch (_) {}
    }*/
/*    if (event is LoggedOut) {
      yield* _mapLoggedOutToState(event.authToken);
    }*/

/*    if (event is LoggedIn) {
      yield* _mapLoggedInToState(event.accessToken);
    }*/

/*    if (event is LoginFailedEvent) {
      yield* _mapFailedInToState(event.loginFailed);
    }*/
  }
}

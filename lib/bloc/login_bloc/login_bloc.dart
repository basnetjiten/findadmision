import 'package:findadmissionaffiliate/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:findadmissionaffiliate/bloc/login_bloc/login_events.dart';
import 'package:findadmissionaffiliate/bloc/login_bloc/login_states.dart';
import 'package:findadmissionaffiliate/bloc/notification_bloc/notification_bloc.dart';
import 'package:findadmissionaffiliate/bloc/univ_filter_bloc/univ_filter_bloc.dart';
import 'package:findadmissionaffiliate/dto/loginpost.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/helpers/store_login_cred.dart';
import 'package:findadmissionaffiliate/models/login/error.dart';
import 'package:findadmissionaffiliate/models/login/login_response.dart';
import 'package:findadmissionaffiliate/models/login/pending_approval.dart';
import 'package:findadmissionaffiliate/repository/app_check_repo.dart';
import 'package:findadmissionaffiliate/repository/user/menu/local_repo.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DashboardBloc dashboardBloc;
  final NotificationBloc notificationBloc;
  LoginBloc(this.dashboardBloc,this.notificationBloc) : super(LoginInitialization());

  @override
  // ignore: must_call_super
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    print(transition);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      getIt<LocalLoginRepository>().deleteAllLoginResponse();
      try {
        LoginPost userLoginPost = event.userLoginPost;
        UserRepository userRepository = getIt<UserRepository>();
        final Map<String, dynamic> loginResponseMap = await userRepository
            .getLoginResponse(userLoginPost, event.uniqueCode);
        final String message = loginResponseMap["message"];

        switch (message) {
          case "success":
            final LoginResponse loginResponse =
                LoginResponse.fromJson(loginResponseMap);

            loginTokenInfo = loginResponse.tokenInfo;
            accessToken = loginResponse.accessToken;
            dashboardBloc.add(FetchDashBoardData());
            notificationBloc.add(FetchNotification(index: 0));
            //FETCH DASHBOARD PAGE DATA

            //fetch load data partner to fill apply for institute
            loadDataLabel = await getIt<AppCheckRepo>().loadPartnerFormLabel();
            appCheck = await getIt<AppCheckRepo>().getAppCheckData(version: version, os: os);

            getIt<UnivFilterBloc>().add(FetchUnivData());
            int loginStored =
                await DbManager.storeLoginResInLocalDB(loginResponse);

            print("LOGIN STORED" + loginStored.toString());
            if (loginStored == 1) {
              yield LoginSuccess(loginResponse: loginResponse);
            }

            break;

          case 'pendingapproval':
            final PendingApproval pendingApproval =
                PendingApproval.fromJson(loginResponseMap);
            yield LoginPendingApproval(pendingApproval: pendingApproval);
            break;
          case 'wrongpass':
            final LoginError loginError = LoginError.fromJSON(loginResponseMap);
            yield LoginFailed(
                errorMessage:
                    "Please enter a valid combination of email and password");

            break;
          case 'emailverify':
            yield VerifyEmail(message: "Please verify your email");

            break;
        }
      } catch (error) {
        yield LoginFailed(
            errorMessage: "Unable to precess your request, Please try later.");
        print("LOGIN ERROR" + error.toString());
      }
    }
  }
}

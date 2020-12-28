import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/models/login/login_response.dart';

abstract class AuthenticationState {}

class StatusAuthenticationState extends AuthenticationState {
  @override
  String toString() => 'StatusAuthenticationState';
}

class LogOutUser extends AuthenticationState {
  final String loginError;

  LogOutUser({this.loginError});
}

class AuthenticationInitial extends AuthenticationState {
  @override
  String toString() => 'AuthenticationInitial';
}

class DisplayUpdateAppMessage extends AuthenticationState {
  AppCheck appCheck;
  int version;
  LoginResponse localLoginResponse;

  DisplayUpdateAppMessage(
      {this.appCheck, this.version, this.localLoginResponse});

  @override
  String toString() => 'CheckAppDataFetched';
}

class NoUpdateAppDialog extends AuthenticationState {
  AppCheck appCheck;
  int version;
  LoginResponse localLoginResponse;

  NoUpdateAppDialog({this.appCheck, this.version, this.localLoginResponse});

  @override
  String toString() => 'CheckAppDataFetched';
}

/*class AuthenticationAuthenticated extends AuthenticationState {
  final String accessToken;

  AuthenticationAuthenticated({this.accessToken});

  @override
  String toString() => 'AuthenticationAuthenticated';
}

class RegistrationAuthenticationAuthenticated extends AuthenticationState {
  final String accessToken;

  RegistrationAuthenticationAuthenticated({this.accessToken});

  @override
  String toString() => 'AuthenticationAuthenticated';
}

class UserAlreadyAuthenticated extends AuthenticationState {
  final String accessToken;

  UserAlreadyAuthenticated({this.accessToken});

  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}

class SharedPreferenceState extends AuthenticationState {
  final String siteId;
  final bool firstStart;

  SharedPreferenceState(this.siteId, this.firstStart);

  @override
  String toString() => 'SharedPreferenceState';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}*/

/*class NoInternetPage extends AuthenticationState {
  @override
  String toString() => 'No Internet';
}

class LoginFailed extends AuthenticationState {
  String loginError;

  LoginFailed({this.loginError});

  @override
  String toString() => 'Login Failed';
}

class LogOutUser extends AuthenticationState {
  String loginError;

  LogOutUser({this.loginError});

  @override
  String toString() => 'Login Failed';
}*/

/*class UserLoggedInServer extends AuthenticationState {
  final LoginResponse localLoginResponse;

  UserLoggedInServer({this.localLoginResponse});

  @override
  String toString() => 'UserLoggedInServer';
}*/

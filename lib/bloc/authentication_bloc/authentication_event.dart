import 'package:findadmissionaffiliate/helpers/login_type_enum.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent {}

class StatusAuthentication extends AuthenticationEvent {
/*  @override
  String toString() => 'StatusAuthentication';*/
}

class LoggedIn extends AuthenticationEvent {
  final String accessToken;

  LoggedIn({@required this.accessToken});

/*  @override
  String toString() => 'LoggedIn { token: $accessToken }';*/
}

class LoggedOut extends AuthenticationEvent {
  final String authToken;

  LoggedOut({this.authToken});

/*  @override
  String toString() => 'LoggedOut';*/
}

//================================
class SiteIdFetchEvent extends AuthenticationEvent {
  final String authToken;

  SiteIdFetchEvent({this.authToken}) : assert(authToken != null);

/*  @override
  String toString() => 'SiteIdFetchEvent';*/
}

class AppLabelFetchEvent extends AuthenticationEvent {
  final String siteId;
  final bool firstStart;

  AppLabelFetchEvent({this.siteId, this.firstStart}) : assert(siteId != null);

/*  @override
  String toString() => 'AppLabelFetchEvent';*/
}

class SharedPreferenceEvent extends AuthenticationEvent {
/*  @override
  String toString() => 'SharedPreferenceEvent';*/
}

class AppStarted extends AuthenticationEvent {
  final LoginType initialStart;
  final countryFromIndex;

  AppStarted({this.initialStart,this.countryFromIndex});

  @override
  String toString() => 'AppStarted';
}

class LoginFailedEvent extends AuthenticationEvent {
  final String loginFailed;

  LoginFailedEvent({this.loginFailed});

/*  @override
  String toString() => 'loginFailed';*/
}

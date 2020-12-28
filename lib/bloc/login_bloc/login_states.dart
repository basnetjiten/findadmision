import 'package:findadmissionaffiliate/models/login/login_response.dart';
import 'package:findadmissionaffiliate/models/login/pending_approval.dart';
import 'package:meta/meta.dart';

abstract class LoginState {}

class LoginInitialization extends LoginState {
  @override
  String toString() => 'LoginInitialization';
}

class LoginSuccess extends LoginState {
  LoginResponse loginResponse;

  LoginSuccess({@required this.loginResponse});

  @override
  String toString() => 'LOGIN SUCCESS';
}

class LoginPendingApproval extends LoginState {
  final PendingApproval pendingApproval;
  LoginPendingApproval({this.pendingApproval});

}

class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed({@required this.errorMessage});

}
class VerifyEmail extends LoginState {
  final String message;

  VerifyEmail({@required this.message});

  @override
  String toString() => 'LoginFailure { error: $message }';
}

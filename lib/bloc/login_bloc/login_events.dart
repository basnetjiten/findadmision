import 'package:equatable/equatable.dart';
import 'package:findadmissionaffiliate/dto/loginpost.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonPressed extends LoginEvent {
  final LoginPost userLoginPost;
  final String uniqueCode;

  LoginButtonPressed({@required this.userLoginPost, @required this.uniqueCode});

  @override
  List<Object> get props => [];

/*  @override
  String toString() =>
      'LoginButtonPressed { usr: $userLoginPost}';*/
}

class NavigationCompleted extends LoginEvent {
  @override
  List<Object> get props => [];
}

class ForgotPasswordEvent extends LoginEvent {
  final String email, siteId;

  ForgotPasswordEvent({this.email, this.siteId});

  @override
  List<Object> get props => [email, siteId];
}

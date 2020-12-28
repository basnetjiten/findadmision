part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {
  final SignUpPost signUpPost;
  final String uniqueCode;

  SignUpButtonPressed({this.signUpPost,this.uniqueCode});
}

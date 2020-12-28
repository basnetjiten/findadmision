part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordEvent {}

class ResetPasswordBtnPressed extends ResetPasswordEvent{
  final String email;
  ResetPasswordBtnPressed({this.email});
}

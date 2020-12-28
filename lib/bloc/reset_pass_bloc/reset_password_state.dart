part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}
class ResetPasswordSent extends ResetPasswordState {}
class ResetPasswordUnSent extends ResetPasswordState {}

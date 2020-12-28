part of 'email_check_cubit.dart';

@immutable
abstract class EmailCheckState {}

class EmailCheckInitial extends EmailCheckState {}
class EmailCheckFailed extends EmailCheckState {}
class EmailValidStatus extends EmailCheckState {
  final String message;
  EmailValidStatus({this.message});
}
class EmailInValidStatus extends EmailCheckState {
  final String message;
  EmailInValidStatus({this.message});
}



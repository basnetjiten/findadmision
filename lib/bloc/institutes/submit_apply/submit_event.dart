part of 'submit_bloc.dart';

@immutable
abstract class SubmitEvent {}

class SubmitApplication extends SubmitEvent {
  final String stdId, instId;

  SubmitApplication({this.stdId, this.instId});
}

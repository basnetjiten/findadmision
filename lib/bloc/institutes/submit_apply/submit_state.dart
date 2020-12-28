part of 'submit_bloc.dart';

@immutable
abstract class SubmitState {}

class SubmitInitial extends SubmitState {}

class ApplySubmitted extends SubmitState {
  final SubmitSuccess submitSuccess;

  ApplySubmitted({this.submitSuccess});
}

class ApplySubmittedFailed extends SubmitState {}

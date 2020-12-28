part of 'finish_first_step_bloc.dart';

@immutable
abstract class FinishFirstStepEvent {}

class FinishFirstStdStep extends FinishFirstStepEvent {
  final FirstStepDto firstStepDto;
  final String stdId;

  FinishFirstStdStep({this.firstStepDto, this.stdId});
}

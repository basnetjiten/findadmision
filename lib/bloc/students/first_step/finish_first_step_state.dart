part of 'finish_first_step_bloc.dart';

@immutable
abstract class FinishFirstStepState {}

class FinishFirstStepInitial extends FinishFirstStepState {}
class FirstStepSuccess extends FinishFirstStepState{}
class FirstStepError extends FinishFirstStepState{}

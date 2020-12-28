part of 'apply_application_bloc.dart';

@immutable
abstract class ApplyApplicationState {}

class ApplyApplicationInitial extends ApplyApplicationState {}
class FirstStepApplied extends ApplyApplicationState{
  final StepOneApplyRes appliedResponse;
  FirstStepApplied({this.appliedResponse});
}

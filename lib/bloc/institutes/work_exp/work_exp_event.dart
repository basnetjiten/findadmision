part of 'work_exp_bloc.dart';

@immutable
abstract class WorkExpEvent {}

class SaveWorkExperience extends WorkExpEvent {
  final String stdId;
  final WorkExpDto workExpDto;

  SaveWorkExperience({this.stdId, this.workExpDto});
}

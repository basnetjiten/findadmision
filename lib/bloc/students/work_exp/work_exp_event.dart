part of 'work_exp_bloc.dart';

@immutable
abstract class StdWorkExpEvent {}

class SaveWorkExperience extends StdWorkExpEvent {
  final String stdId;
  final WorkExpDto workExpDto;

  SaveWorkExperience({this.stdId, this.workExpDto});
}

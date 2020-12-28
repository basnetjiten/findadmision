part of 'apply_application_bloc.dart';

@immutable
abstract class ApplyApplicationEvent {}
class ApplyFirstStep extends ApplyApplicationEvent{
  final String stdId,instId,studyLevel;
  final stepOneDto;
  ApplyFirstStep({@required this.instId,@required this.studyLevel,this.stdId,@required this.stepOneDto});
}

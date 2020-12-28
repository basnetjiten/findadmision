part of 'student_status_bloc.dart';

@immutable
abstract class StudentStatusEvent {}
class UpdateStdStatus extends StudentStatusEvent {
  final String stdId,newStatus;

  UpdateStdStatus({this.stdId,this.newStatus});
}
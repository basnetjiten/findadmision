part of 'student_status_bloc.dart';

@immutable
abstract class StudentStatusState {}

class StudentStatusInitial extends StudentStatusState {}
class StatusUpdated extends StudentStatusState{}
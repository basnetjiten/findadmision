part of 'add_students_bloc.dart';

@immutable
abstract class AddStudentsEvent {}



class AddStudent extends AddStudentsEvent {
  final AddStudentDto addStudentDto;

  AddStudent({this.addStudentDto});
}

class FetchStudentList extends AddStudentsEvent{
  final int status;

  FetchStudentList({this.status});
}

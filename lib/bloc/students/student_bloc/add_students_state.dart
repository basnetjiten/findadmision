part of 'add_students_bloc.dart';

@immutable
abstract class AddStudentsState {}

class AddStudentsInitial extends AddStudentsState {}

class StudentAddSuccess extends AddStudentsState {
  final StudentAddedResponse studentAddedRes;

  StudentAddSuccess(this.studentAddedRes);
}

class StudentApiEmpty extends AddStudentsState {}
class StudentListFetched extends AddStudentsState {
  final StudentListResponse studentListRes;
  StudentListFetched({this.studentListRes});
}

class StudentListFetching extends AddStudentsState {

}


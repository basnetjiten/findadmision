
part of 'course_bloc.dart';

@immutable
abstract class StdCourseEvent {}
class SaveCourse extends StdCourseEvent{
 final String stdId;
 final List<Selectedcoursearr> courses;
 SaveCourse({this.courses,this.stdId});
}

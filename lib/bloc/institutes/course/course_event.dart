part of 'course_bloc.dart';

@immutable
abstract class CourseEvent {}
class SelectCourse extends CourseEvent{
 final String instId,stdId,level;
 final List<ApplyCourseDto> courses;
  SelectCourse({this.level,this.courses,this.instId,this.stdId});
}

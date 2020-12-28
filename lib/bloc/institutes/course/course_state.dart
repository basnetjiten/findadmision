
part of 'course_bloc.dart';


@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}
class CourseApplied extends CourseState{
  final StepOneApplyRes courseAppliedRes;
  CourseApplied({this.courseAppliedRes});

}
class CourseApplyError extends CourseState{}

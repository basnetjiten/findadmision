part of 'course_bloc.dart';

@immutable
abstract class StdCourseState {}

class CourseInitial extends StdCourseState {}

class CourseApplied extends StdCourseState {}

class CourseApplyError extends StdCourseState {}

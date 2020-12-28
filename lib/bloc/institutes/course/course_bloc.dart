import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/dto/institutes/courses.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:meta/meta.dart';
import 'package:findadmissionaffiliate/models/institute/apply_step_one_res.dart';

part 'course_event.dart';

part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial());

  @override
  Stream<CourseState> mapEventToState(
    CourseEvent event,
  ) async* {
    if (event is SelectCourse) {
      final courseAppliedRes = await getIt<UnivFilterRepository>()
          .getAppliedCourse(event.level,event.courses, event.stdId, event.instId);
      if (courseAppliedRes is StepOneApplyRes) {
        yield CourseApplied(courseAppliedRes:courseAppliedRes);
      } else {
        CourseApplyError();
      }
    }
  }
}

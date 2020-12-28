import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/dto/institutes/courses.dart';
import 'package:findadmissionaffiliate/dto/students/std_apply_course_dto.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/institute/go_next.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:findadmissionaffiliate/repository/student_repo.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';

part 'course_state.dart';

class StdCourseBloc extends Bloc<StdCourseEvent, StdCourseState> {
  StdCourseBloc() : super(CourseInitial());

  @override
  Stream<StdCourseState> mapEventToState(
      StdCourseEvent event,
  ) async* {
    if (event is SaveCourse) {
      final courseAppliedRes = await getIt<StudentRepo>()
          .saveCourses(event.courses, event.stdId,);
      if (courseAppliedRes is GoNext) {
        yield CourseApplied();
      } else {
        CourseApplyError();
      }
    }
  }
}

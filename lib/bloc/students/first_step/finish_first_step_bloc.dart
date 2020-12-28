import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/dto/students/first_step_dto.dart';
import 'package:findadmissionaffiliate/dto/students/std_apply_course_dto.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/student/first_step_res.dart';
import 'package:findadmissionaffiliate/repository/student_repo.dart';
import 'package:meta/meta.dart';

part 'finish_first_step_event.dart';

part 'finish_first_step_state.dart';

class FinishFirstStepBloc
    extends Bloc<FinishFirstStepEvent, FinishFirstStepState> {
  FinishFirstStepBloc() : super(FinishFirstStepInitial());

  @override
  Stream<FinishFirstStepState> mapEventToState(
    FinishFirstStepEvent event,
  ) async* {
    if (event is FinishFirstStdStep) {
      final firstStepRes = await getIt<StudentRepo>()
          .finishFirstStep(event.firstStepDto, event.stdId);
      if (firstStepRes is FirstStepRes) {
        yield FirstStepSuccess();
      } else {
        yield FirstStepError();
      }
    }
  }
}

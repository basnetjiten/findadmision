import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/institute/apply_step_one_res.dart';
import 'package:findadmissionaffiliate/repository/app_repo.dart';
import 'package:meta/meta.dart';

part 'apply_application_event.dart';

part 'apply_application_state.dart';

class ApplyApplicationBloc
    extends Bloc<ApplyApplicationEvent, ApplyApplicationState> {
  ApplyApplicationBloc() : super(ApplyApplicationInitial());

  @override
  Stream<ApplyApplicationState> mapEventToState(
    ApplyApplicationEvent event,
  ) async* {
    if (event is ApplyFirstStep) {
      final appliedResponse = await getIt<ApplicationRepo>()
          .applyFirstStep(event.stepOneDto,event.stdId,event.instId, event.studyLevel);
     print( (appliedResponse is StepOneApplyRes).toString());
      if (appliedResponse is StepOneApplyRes) {

        yield FirstStepApplied(appliedResponse: appliedResponse);
      }
    }
  }
}

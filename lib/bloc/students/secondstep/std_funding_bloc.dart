import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/dto/students/funding_dto.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/student_repo.dart';
import 'package:meta/meta.dart';

part 'std_funding_event.dart';

part 'std_funding_state.dart';

class StdFundingBloc extends Bloc<StdFundingEvent, StdFundingState> {
  StdFundingBloc() : super(StdFundingInitial());

  @override
  Stream<StdFundingState> mapEventToState(
    StdFundingEvent event,
  ) async* {
    if (event is StoreFundingInfoAndNext) {
      final fundingRes = await getIt<StudentRepo>()
          .saveFundingInfo(event.stdId, event.stepTwoFundingDto);
      if (fundingRes != null) {
        yield StdFundingStoredNext();
      }
    }

    if (event is StoreFundingInfoAndSave) {
      final fundingRes = await getIt<StudentRepo>()
          .saveFundingInfo(event.stdId, event.stepTwoFundingDto);
      if (fundingRes != null) {
        yield StdFundingStoredSave();
      }
    }
  }
}

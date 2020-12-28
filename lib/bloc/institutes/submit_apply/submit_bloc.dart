import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/institute/submit_success.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:meta/meta.dart';
part 'submit_event.dart';
part 'submit_state.dart';

class SubmitBloc extends Bloc<SubmitEvent, SubmitState> {
  SubmitBloc() : super(SubmitInitial());

  @override
  Stream<SubmitState> mapEventToState(
    SubmitEvent event,
  ) async* {
    if (event is SubmitApplication) {
      final submitApplyRes = await getIt<UnivFilterRepository>()
          .getSubmitApply(event.stdId, event.instId);
      if (submitApplyRes is SubmitSuccess) {
        if (submitApplyRes.status == "success") {
          yield ApplySubmitted(submitSuccess: submitApplyRes);
        }
      } else {
        yield ApplySubmittedFailed();
      }
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/institute/preview_apply.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:meta/meta.dart';

part 'preview_apply_event.dart';

part 'preview_apply_state.dart';

class PreviewApplyBloc extends Bloc<PreviewApplyEvent, PreviewApplyState> {
  PreviewApplyBloc() : super(PreviewApplyInitial());

  @override
  Stream<PreviewApplyState> mapEventToState(
    PreviewApplyEvent event,
  ) async* {
    if (event is FetchPreviewData) {
      final applyPreviewRes = await getIt<UnivFilterRepository>()
          .getPreviewApply(event.stdId, event.instID);
      if (applyPreviewRes is PreviewApplyRes) {
        if (applyPreviewRes.status == "success") {
          yield PreviewApplyFetched(previewApplyRes: applyPreviewRes);
        }
      } else {
        yield PreviewApplyFailed();
      }
    }
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/dto/institutes/apply/work_exp_dto.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/institute/work_exp_res.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:meta/meta.dart';

part 'work_exp_event.dart';

part 'work_exp_state.dart';

WorkExpRes workExpSubmittedRes;

class StdWorkExp extends Bloc<StdWorkExpEvent, StdWorkExpState> {
  StdWorkExp() : super(WorkExpInitial());

  @override
  Stream<StdWorkExpState> mapEventToState(
    StdWorkExpEvent event,
  ) async* {
    if (event is SaveWorkExperience) {
      final workExpRes = await getIt<UnivFilterRepository>()
          .storeWorkExp(event.stdId, event.workExpDto);
      if (workExpRes is WorkExpRes) {
        workExpSubmittedRes = workExpRes;
        yield WorkExpSubmitted(workExpRes: workExpRes);
      } else {
        yield WorkExpError();
      }
    }
  }
}

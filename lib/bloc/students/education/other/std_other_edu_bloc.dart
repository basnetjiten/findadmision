import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/education/high/std_high_educ_bloc.dart';
import 'package:findadmissionaffiliate/dto/students/saveother_edu_dto.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/student_repo.dart';
import 'package:meta/meta.dart';

part 'std_other_edu_event.dart';

part 'std_other_edu_state.dart';

class StdOtherEduBloc extends Bloc<StdOtherEduEvent, StdOtherEduState> {
  StdOtherEduBloc() : super(StdOtherEduInitial());

  @override
  Stream<StdOtherEduState> mapEventToState(
    StdOtherEduEvent event,
  ) async* {
    if (event is AddOtherEdu) {
      final otherEduAdded = await getIt<StudentRepo>()
          .addOtherEdu(event.saveOtherEduDto, event.stdId);
      if (otherEduAdded is StdHighEducAdded) {}
    }
  }
}

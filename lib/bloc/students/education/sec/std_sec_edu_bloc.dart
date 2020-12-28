import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/education/high/std_high_educ_bloc.dart';
import 'package:findadmissionaffiliate/dto/students/savesec_dto.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/student_repo.dart';
import 'package:meta/meta.dart';

part 'std_sec_edu_event.dart';

part 'std_sec_edu_state.dart';

class StdSecEduBloc extends Bloc<StdSecEduEvent, StdSecEduState> {
  StdSecEduBloc() : super(StdSecEduInitial());

  @override
  Stream<StdSecEduState> mapEventToState(
    StdSecEduEvent event,
  ) async* {

    if(event is AddSecEdu){
      final secEduAdded = await getIt<StudentRepo>().addHighEdu(event.saveSecEduDto, event.stdId);
      if(secEduAdded is StdHighEducAdded){

      }
    }
  }
}

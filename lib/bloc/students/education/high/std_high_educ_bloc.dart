import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/dto/students/savehigh_dto.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/student_repo.dart';
import 'package:meta/meta.dart';

part 'std_high_educ_event.dart';
part 'std_high_educ_state.dart';

class StdHighEducBloc extends Bloc<StdHighEducEvent, StdHighEducState> {
  StdHighEducBloc() : super(StdHighEducInitial());

  @override
  Stream<StdHighEducState> mapEventToState(
    StdHighEducEvent event,
  ) async* {
    if(event is AddHighEdu){
      final highEduAdded = await getIt<StudentRepo>().addHighEdu(event.saveHighEduDto, event.stdId);
      if(highEduAdded is StdHighEducAdded){

      }
    }
   
  }
}

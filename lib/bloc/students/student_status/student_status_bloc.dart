import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/student_repo.dart';
import 'package:meta/meta.dart';

part 'student_status_event.dart';

part 'student_status_state.dart';

class StudentStatusBloc extends Bloc<StudentStatusEvent, StudentStatusState> {
  StudentStatusBloc() : super(StudentStatusInitial());

  @override
  Stream<StudentStatusState> mapEventToState(
    StudentStatusEvent event,
  ) async* {
    if (event is UpdateStdStatus) {
      final response = await getIt<StudentRepo>()
          .updateStdStatus(event.stdId, event.newStatus);
      if (response == "success") {
        yield StatusUpdated();
      }
    }
  }
}

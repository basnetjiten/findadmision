import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'student_profile_event.dart';
part 'student_profile_state.dart';

class StudentProfileBloc extends Bloc<StudentProfileEvent, StudentProfileState> {
  StudentProfileBloc() : super(StudentProfileInitial());

  @override
  Stream<StudentProfileState> mapEventToState(
    StudentProfileEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

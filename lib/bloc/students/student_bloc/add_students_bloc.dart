import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:findadmissionaffiliate/dto/students/add_student.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/student/added_std_res.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:findadmissionaffiliate/repository/student_repo.dart';
import 'package:meta/meta.dart';

part 'add_students_event.dart';

part 'add_students_state.dart';



StudentAddedResponse studentAddedRes;
StudentListResponse studentListResponse;
class AddStudentsBloc extends Bloc<AddStudentsEvent, AddStudentsState> {
  AddStudentsBloc() : super(AddStudentsInitial());

  @override
  // ignore: must_call_super
  void onTransition(Transition<AddStudentsEvent, AddStudentsState> transition) {
    print("STUDENT BLOC" + transition.toString());
  }

  @override
  Stream<AddStudentsState> mapEventToState(
    AddStudentsEvent event,
  ) async* {
    try {
      if (event is FetchStudentList) {
        yield StudentListFetching();
        final studentListRes = await getIt<StudentRepo>().getStudentList(event.status);
        print((studentListRes is StudentListResponse).toString());

        if (studentListRes is StudentListResponse) {
          if (studentListRes.status == "success" &&
              studentListRes.studentlist.isNotEmpty) {
            studentListResponse=studentListRes;
            print("TOTAL STUDENT"+studentListRes.studentlist.length.toString());
            // print("STUDNET LIST IS ERORORRR"+studentListRes.studentlist.length.toString());
            yield StudentListFetched(studentListRes: studentListRes);
          } else {
            yield StudentApiEmpty();
          }
        }
      }
      if (event is AddStudent) {
        final StudentAddedResponse studentAddedRes =
        await getIt<StudentRepo>().addStudent(event.addStudentDto);
        print("CHECK" + (studentAddedRes is StudentAddedResponse).toString());
        if (studentAddedRes is StudentAddedResponse) {

          if (studentAddedRes.status == "success") {


           /* final StudentListResponse addedStd = StudentListResponse(
              studentAddedRes.status,
              studentListResponse.studentlist,
              "",
            );*/
            // studentAddedRes = studentAddedResp;
            yield StudentAddSuccess(studentAddedRes);
          }
        } else {
          yield StudentApiEmpty();
        }
      }


    } catch (error) {
      print("ADDDED STD ERROR" + error.toString());
    }
  }
}

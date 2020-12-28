import 'dart:io';

import 'package:findadmissionaffiliate/datasources/student_ds.dart';
import 'package:findadmissionaffiliate/models/student/added_std_res.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class StudentRepo {
  final StudentDS studentDS = StudentDS(httpClient: http.Client());

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'token';
  }

  Future<StudentListResponse> getStudentList(int status) async {
    return studentDS.fetchStudentList(status);
  }
  Future<String> updateStdStatus(id,newStatus) async {
    return studentDS.updateStdStatus(id,newStatus);
  }

  Future<StudentAddedResponse> addStudent(studentPostData) async {
    return studentDS.getAddedStudent(addStudentDto: studentPostData);
  }

  Future<dynamic> loadStdData(stdId) async {
    return studentDS.fetchStdData(stdId: stdId);
  }

  Future<dynamic> saveCourses(
    stdCourses,
    stdId,
  ) async {
    return studentDS.saveCourses(stdId: stdId, stdApplyCourseDto: stdCourses);
  }

  Future<dynamic> saveFundingInfo(
      stdId,
      fundingDto
      ) async {
    return studentDS.saveFundingInfo(stdId: stdId, fundingDto: fundingDto);
  }

  Future<dynamic> finishFirstStep(
    firstStepDto,
    stdId,
  ) async {
    return studentDS.finishFirstStep(stdId: stdId, firstStepDto: firstStepDto);
  }

  Future<dynamic> uploadFile(file,studentId,docId,fileName) async{
    return studentDS.uploadFile(file,studentId,docId,fileName);
  }

  Future<dynamic> addHighEdu(highEduDto,studentId) async{return studentDS.addHighEdu(highEduDto,studentId);}
  Future<dynamic> addSecEdu(secEduDto,studentId) async{return studentDS.addSecondaryEdu(secEduDto,studentId);}
  Future<dynamic> addOtherEdu(secEduDto,studentId) async{return studentDS.addOtherEdu(secEduDto,studentId);}
}

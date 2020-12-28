import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:findadmissionaffiliate/constants/api.dart';
import 'package:findadmissionaffiliate/dto/students/add_student.dart';
import 'package:findadmissionaffiliate/dto/students/first_step_dto.dart';
import 'package:findadmissionaffiliate/dto/students/funding_dto.dart';
import 'package:findadmissionaffiliate/dto/students/savehigh_dto.dart';
import 'package:findadmissionaffiliate/dto/students/savesec_dto.dart';
import 'package:findadmissionaffiliate/dto/students/std_apply_course_dto.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/login/error.dart';
import 'package:findadmissionaffiliate/models/student/added_std_res.dart';
import 'package:findadmissionaffiliate/models/student/apply_course_res.dart';
import 'package:findadmissionaffiliate/models/student/edu_add_res.dart';
import 'package:findadmissionaffiliate/models/student/first_step_res.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:findadmissionaffiliate/utils/affiliate_headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class StudentDS {
  final http.Client httpClient;

  StudentDS({@required this.httpClient});

  final addStudentUrl = AffiliatesConst.addStudentUrl;
  final studentListUrl = AffiliatesConst.studentListUrl;
  final loadStudentDataUrl = AffiliatesConst.loadStudentDataUrl;
  final saveCourseUrl = AffiliatesConst.saveCourseUrl;
  final myPlanFirsStepUrl = AffiliatesConst.myPlanFirsStepUrl;
  final stdWrkExpUrl = AffiliatesConst.stdWrkExpUrl;
  final saveStdFundUrl = AffiliatesConst.saveFundUrl;
  final updateStdStatusUrl = AffiliatesConst.updateStdStatus;
  final studentFileUploadUrl = AffiliatesConst.studentFileUploadUrl;
  final saveHighEduUrl = AffiliatesConst.saveHighEduUrl;
  final saveSecEduUrl = AffiliatesConst.saveSecEduUrl;
  final saveOtherEduUrl = AffiliatesConst.saveOtherEduUrl;

  Future<StudentListResponse> fetchStudentList(int status) async {
    Map<String, String> queryParam = {
      "filter": status.toString(),
    };

    Uri uri = Uri.parse(studentListUrl);
    uri = uri.replace(queryParameters: queryParam);

    print("STUDNET LIST URL" + uri.toString());

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> studentListMap = json.decode(response.body);
        print("STUDENT LIST" + studentListMap.toString());
        final StudentListResponse studentListRes =
            StudentListResponse.fromJson(studentListMap);
        print(studentListRes.toJson().toString());
        return studentListRes;
      } catch (_) {
        print("ERRROR" + _.toString());
      }
    }
    // return null;
  }

  Future<String> updateStdStatus(String id, String newStatus) async {
    Map<String, String> queryParam = {"id": id, "newstatus": newStatus};

    Uri uri = Uri.parse(updateStdStatusUrl);
    uri = uri.replace(queryParameters: queryParam);

    print("STUDNET LIST URL" + uri.toString());

    final http.Response response = await httpClient.post(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> stdUpdatedStatus =
            json.decode(response.body);
        //  print("STUDENT LIST" + studentListMap.toString());
        return stdUpdatedStatus["status"];
      } catch (_) {
        print("ERRROR" + _.toString());
      }
    }
    // return null;
  }

  Future<StudentAddedResponse> getAddedStudent(
      {AddStudentDto addStudentDto}) async {
    Uri uri = Uri.parse(addStudentUrl);
    String addStudentPostData = json.encode(addStudentDto);

    print(uri.toString() + addStudentPostData);

    final http.Response response = await httpClient.post(uri,
        body: addStudentPostData,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map studentAddedMap = json.decode(response.body);
        print("STUDENT ADDED RES" + studentAddedMap.toString());
        final StudentAddedResponse studentAddedRes =
            StudentAddedResponse.fromJson(studentAddedMap);
        print(studentAddedRes.runtimeType.toString());
        return studentAddedRes;
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> fetchStdData({String stdId}) async {
    Map<String, String> queryParam = {
      "type": "partner",
      "fpro": stdId,
    };

    Uri uri = Uri.parse(loadStudentDataUrl);
    uri = uri.replace(queryParameters: queryParam);

    print("LOAD STD DATA" + uri.toString());

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map stdLoadDataMap = json.decode(response.body);
        print("std data" + stdLoadDataMap.toString());
        final status = stdLoadDataMap["status"];
        switch (status) {
          case "success":
            //change this later
            final StdLoadDataRes stdLoadDataRes =
                StdLoadDataRes.fromJson(stdLoadDataMap);
            return stdLoadDataRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(stdLoadDataMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> saveCourses(
      {String stdId, List<Selectedcoursearr> stdApplyCourseDto}) async {
    Map<String, String> queryParam = {
      "type": "partner",
      "fpro": "$stdId",
    };

    var jsonBody =
        jsonEncode(stdApplyCourseDto.map((e) => e.toJson()).toList());

    Uri uri = Uri.parse(saveCourseUrl);
    uri = uri.replace(queryParameters: queryParam);

    print(uri.toString());

    final http.Response response = await httpClient.post(uri,
        body: jsonBody, headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map applyCourseMap = json.decode(response.body);
        print("STD SAVE COURSE" + applyCourseMap.toString());
        final status = applyCourseMap["status"];
        switch (status) {
          case "success":
            //change this later
            final StdCourseApplyRes stdLoadDataRes =
                StdCourseApplyRes.fromJson(applyCourseMap);
            return stdLoadDataRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(applyCourseMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> saveFundingInfo(
      {String stdId, StepTwoFundingDto fundingDto}) async {
    Map<String, String> queryParam = {
      "lang": "1",
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(saveStdFundUrl);
    uri = uri.replace(queryParameters: queryParam);

    print(uri.toString());
    final body = jsonEncode(fundingDto);

    final http.Response response = await httpClient.post(uri,
        body: body, headers: AffiliateHeaders.authHeaders(accessToken));

    //debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map applyCourseMap = json.decode(response.body);
        print("STD FUNDING DATA" + applyCourseMap.toString());
        final status = applyCourseMap["status"];
        switch (status) {
          case "success":
            //change this later
            final StdCourseApplyRes stdLoadDataRes =
                StdCourseApplyRes.fromJson(applyCourseMap);
            return stdLoadDataRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(applyCourseMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> finishFirstStep(
      {String stdId, FirstStepDto firstStepDto}) async {
    Map<String, String> queryParam = {
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(myPlanFirsStepUrl);
    uri = uri.replace(queryParameters: queryParam);
    String body = json.encode(firstStepDto);
    print(uri.toString() + body.toString());

    final http.Response response = await httpClient.post(uri,
        body: body, headers: AffiliateHeaders.authHeaders(accessToken));

    //debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map firstStepMap = json.decode(response.body);
        print("STD FIRST STEP" + firstStepMap.toString());
        final status = firstStepMap["status"];
        switch (status) {
          case "success":
            //change this later
            final FirstStepRes stdLoadDataRes =
                FirstStepRes.fromJson(firstStepMap);
            return stdLoadDataRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(firstStepMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> stdWorkExpStep(
      {String stdId, FirstStepDto firstStepDto}) async {
    Map<String, String> queryParam = {
      "lang": "1",
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(myPlanFirsStepUrl);
    uri = uri.replace(queryParameters: queryParam);
    String body = json.encode(firstStepDto);
    print(uri.toString() + body.toString());

    final http.Response response = null;
    /*await httpClient.post(uri,
        body: body, headers: AffiliateHeaders.authHeaders(accessToken))*/
    ;

    //debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map firstStepMap = json.decode(response.body);
        print("STD APPLIED COURSE" + firstStepMap.toString());
        final status = firstStepMap["status"];
        switch (status) {
          case "success":
            //change this later
            final FirstStepRes stdLoadDataRes =
                FirstStepRes.fromJson(firstStepMap);
            return stdLoadDataRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(firstStepMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> uploadFile(
      File fileToUpload, String stdId, String docId, String fileName) async {
    Map<String, String> queryParam = {
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(studentFileUploadUrl);
    uri = uri.replace(queryParameters: queryParam);
    /*var stream = new http.ByteStream(fileToUpload.openRead());
    stream.cast();*/
    var stream =
        http.ByteStream(DelegatingStream.typed(fileToUpload.openRead()));

    // get file length
    var length = await fileToUpload.length();
    print("DOC UPLOAD " + uri.toString());
    print("FILE NAME" + fileName + length.toString());
    final mimeTypeData =
        lookupMimeType(fileToUpload.path, headerBytes: [0xFF, 0xD8]).split('/');
    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    //add headers
    request.headers.addAll(AffiliateHeaders.authHeaders(accessToken));

    // multipart that takes file
    var multipartFile = await http.MultipartFile.fromPath(
        "file", fileToUpload.path,
        filename: fileName,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
    // add file to multipart
    request.files.add(multipartFile);
    //adding params
    request.fields['doc'] = docId;

    try {
      // send
      var response = await request.send();
      print("FIELDS" + request.fields.toString());
      print(response.statusCode);

      // listen for response
      // response.stream.transform(utf8.decoder).listen((value) {
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);

        Map fileUploadedMap = json.decode(responseString);

        print("FILE UPLOAD MAP" + fileUploadedMap.toString());
        final status = fileUploadedMap["status"];
        switch (status) {
          case "success":
            final dynamic errorResponse = LoginError.fromJSON(fileUploadedMap);
            return errorResponse;

          case "error":
            final dynamic errorResponse = LoginError.fromJSON(fileUploadedMap);
            return errorResponse;
            break;
        }
      }
    } catch (_) {
      print(_.toString());
    }
  }

  Future<dynamic> addHighEdu(SaveHighEduDto saveHighEduDto, String stdId) async {
    Map<String, String> queryParam = {
      "lang": "1",
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(saveHighEduUrl);
    uri = uri.replace(queryParameters: queryParam);
    String body = json.encode(saveHighEduDto);
   // print(uri.toString() + body.toString());

    final http.Response response = await httpClient.post(uri,
        body: body, headers: AffiliateHeaders.authHeaders(accessToken));

    //debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map firstStepMap = json.decode(response.body);
        print("STD APPLIED COURSE" + firstStepMap.toString());
        final status = firstStepMap["status"];
        switch (status) {
          case "success":
            //change this later
            final EduAddedRes eduAddedRes = EduAddedRes.fromJson(firstStepMap);
            return eduAddedRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(firstStepMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }
  Future<dynamic> addSecondaryEdu(SaveSecEduDto saveSecEduDto, String stdId) async {
    Map<String, String> queryParam = {
      "lang": "1",
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(saveSecEduUrl);
    uri = uri.replace(queryParameters: queryParam);
    String body = json.encode(saveSecEduDto);
   // print(uri.toString() + body.toString());

    final http.Response response = await httpClient.post(uri,
        body: body, headers: AffiliateHeaders.authHeaders(accessToken));

    //debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map firstStepMap = json.decode(response.body);
        print("STD APPLIED COURSE" + firstStepMap.toString());
        final status = firstStepMap["status"];
        switch (status) {
          case "success":
            //change this later
            final EduAddedRes eduAddedRes = EduAddedRes.fromJson(firstStepMap);
            return eduAddedRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(firstStepMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }
  Future<dynamic> addOtherEdu(SaveHighEduDto saveHighEduDto, String stdId) async {
    Map<String, String> queryParam = {
      "lang": "1",
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(saveHighEduUrl);
    uri = uri.replace(queryParameters: queryParam);
    String body = json.encode(saveHighEduDto);
   // print(uri.toString() + body.toString());

    final http.Response response = await httpClient.post(uri,
        body: body, headers: AffiliateHeaders.authHeaders(accessToken));

    //debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map firstStepMap = json.decode(response.body);
        print("STD APPLIED COURSE" + firstStepMap.toString());
        final status = firstStepMap["status"];
        switch (status) {
          case "success":
            //change this later
            final EduAddedRes eduAddedRes = EduAddedRes.fromJson(firstStepMap);
            return eduAddedRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(firstStepMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }
}

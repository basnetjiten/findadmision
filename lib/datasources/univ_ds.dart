import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:findadmissionaffiliate/models/institute/submit_success.dart';
import 'package:findadmissionaffiliate/models/saved_univ.dart';
import 'package:http_parser/http_parser.dart';

import 'package:findadmissionaffiliate/constants/api.dart';
import 'package:findadmissionaffiliate/dto/institutes/apply/work_exp_dto.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/institute/apply_step_one_res.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/institute/load_data_res.dart';
import 'package:findadmissionaffiliate/models/institute/preview_apply.dart';
import 'package:findadmissionaffiliate/models/institute/work_exp_res.dart';
import 'package:findadmissionaffiliate/models/login/error.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/utils/affiliate_headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:findadmissionaffiliate/dto/institutes/courses.dart';
import 'package:async/async.dart';
import 'package:mime/mime.dart';

class UnivFilterDS {
  final http.Client httpClient;

  UnivFilterDS({@required this.httpClient});

  final univFilterUrl = AffiliatesConst.univFilterUrl;
  final savedInstListUrl = AffiliatesConst.savedInstListUrl;
  final instituteDetailUrl = AffiliatesConst.instituteDetailUrl;
  final previewApplyUrl = AffiliatesConst.previewApplyUrl;
  final submitApplyUrl = AffiliatesConst.submitApplyUrl;
  final submitCourseUrl = AffiliatesConst.submitCourseUrl;
  final loadFileDataUrl = AffiliatesConst.loadFileDataUrl;
  final uploadFileUrl = AffiliatesConst.uploadFAFileUrl;
  final uploadSingleFileUrl = AffiliatesConst.uploadSingleFileUrl;
  final uploadOtherFileUrl = AffiliatesConst.uploadOtherFileUrl;
  final deleteDocUrl = AffiliatesConst.deleteFileUrl;
  final addWorkExpUrl = AffiliatesConst.addWorkExpUrl;

  Future<dynamic> fetchFilteredUniv() async {
    Map<String, String> queryParam = {"type": "partner"};

    Uri uri = Uri.parse(univFilterUrl);
    uri = uri.replace(queryParameters: queryParam);

    //print("UNIVERSITY LIST" + uri.toString());

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map univListMap = json.decode(response.body);
        // print("UNIV LIST MAP" + univListMap.toString());
        final status = univListMap["status"];
        switch (status) {
          case "success":
            final UnivFilterResponse univListResponse =
                UnivFilterResponse.fromJson(univListMap);

            // print(univListResponse.activecountry.length.toString());
            return univListResponse;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(univListMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> fetchFilteredFavUniv() async {
    Map<String, String> queryParam = {"type": "partner"};

    Uri uri = Uri.parse(savedInstListUrl);
    uri = uri.replace(queryParameters: queryParam);

    print("UNIVERSITY FAV LIST" + uri.toString());

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map univFavListMap = json.decode(response.body);
        print("UNIV FAV LIST MAP" + univFavListMap.toString());
        final status = univFavListMap["status"];
        switch (status) {
          case "success":
            final SavedUnivList univListResponse =
                SavedUnivList.fromJson(univFavListMap);

            // print(univListResponse.activecountry.length.toString());
            return univListResponse;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(univFavListMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> fetchInstituteDetail(String instituteId) async {
    Map<String, String> queryParam = {"instid": "$instituteId"};

    Uri uri = Uri.parse(instituteDetailUrl);
    uri = uri.replace(queryParameters: queryParam);

    print("UNIVERSITY DETAILS" + uri.toString());

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map instDetailMap = json.decode(response.body);
        // print(instDetailMap);
        final status = instDetailMap["status"];
        switch (status) {
          case "success":
            final InstituteDetailRes instituteDetailRes =
                InstituteDetailRes.fromJson(instDetailMap);

            return instituteDetailRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(instDetailMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> fetchPreviewApply(String stdId, String instituteId) async {
    Map<String, String> queryParam = {
      "id": "$instituteId",
      "fpro": "$stdId",
      "type": "partner"
    };

    Uri uri = Uri.parse(previewApplyUrl);
    uri = uri.replace(queryParameters: queryParam);

    print("PREVIEW APPLY" + uri.toString());

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map previewApplyMap = json.decode(response.body);
        print(previewApplyMap.toString());
        final status = previewApplyMap["status"];
        switch (status) {
          case "success":
            final PreviewApplyRes previewApplyRes =
                PreviewApplyRes.fromJson(previewApplyMap);

            return previewApplyRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(previewApplyMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> fetchSubmitApply(String stdId, String instituteId) async {
    Map<String, String> queryParam = {
      "inst": "$instituteId",
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(submitApplyUrl);
    uri = uri.replace(queryParameters: queryParam);

    print("SUBMIT APPLY" + uri.toString());

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map previewApplyMap = json.decode(response.body);
         print(previewApplyMap);
        final status = previewApplyMap["status"];
        switch (status) {
          case "success":
            final SubmitSuccess finalSubmitRes =
            SubmitSuccess.fromJson(previewApplyMap);

            return finalSubmitRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(previewApplyMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }

  }

  Future<dynamic> fetchAppliedCourse(String level, List<ApplyCourseDto> courses,
      String stdId, String instituteId) async {
    Map<String, String> queryParam = {
      "type": "partner",
      "fpro": "$stdId",
      "instid": "$instituteId",
      "level": level,
      "lang": "1"
    };

    Uri uri = Uri.parse(submitCourseUrl);
    uri = uri.replace(queryParameters: queryParam);
    /*String courseJson = '';
    print("COURSES URL" + uri.toString());

    courses.forEach((element) {
      courseJson += element.toJson().toString() +
          (courses.indexOf(element) == courses.length - 1 ? "" : ",");
    });
    print("COURSE JSON" + '[' + courseJson + ']');
    print("SUBMIT COURSE APPLY" + uri.toString());*/
    var jsonBody = jsonEncode(courses.map((e) => e.toJson()).toList());
    final http.Response response = await httpClient.post(uri,
        body: jsonBody,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map stepTwoApplyMap = json.decode(response.body);
       print("COURSE MAP"+stepTwoApplyMap.toString());
        final status = stepTwoApplyMap["status"];
        switch (status) {
          case "success":
            final StepOneApplyRes applyRes =
                StepOneApplyRes.fromJson(stepTwoApplyMap);

            return applyRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(stepTwoApplyMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> loadFileData(String stdId, String instituteId) async {
    Map<String, String> queryParam = {
      "type": "partner",
      "fpro": stdId,
      "id": instituteId,
    };

    Uri uri = Uri.parse(loadFileDataUrl);
    uri = uri.replace(queryParameters: queryParam);
    print("UPLOAD PAGE FILE LIST" + uri.toString());
    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map loadFileDataMap = json.decode(response.body);
        print(loadFileDataMap);
        final status = loadFileDataMap["status"];
        switch (status) {
          case "success":
            print("SUCCESS");
            final LoadFileDataRes loadFileData =
                LoadFileDataRes.fromJson(loadFileDataMap);

            return loadFileData;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(loadFileDataMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> uploadFile(File fileToUpload, String stdId,
      String instituteId, String docId, String fileName) async {
    Map<String, String> queryParam = {
      "id": "$instituteId",
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(uploadFileUrl);
    uri = uri.replace(queryParameters: queryParam);
    /*var stream = new http.ByteStream(fileToUpload.openRead());
    stream.cast();*/

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

  Future<dynamic> uploadSingleFile(File fileToUpload, String stdId, String instituteId, String docId, String fileName) async {
    Map<String, String> queryParam = {
      "id": "$instituteId",
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(uploadSingleFileUrl);
    uri = uri.replace(queryParameters: queryParam);
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
  Future<dynamic> uploadOtherFile(File fileToUpload, String stdId, String instituteId, String docId, String fileName) async {
    Map<String, String> queryParam = {
      "id": "$instituteId",
      "type": "partner",
      "fpro": "$stdId",
    };

    Uri uri = Uri.parse(uploadOtherFileUrl);
    uri = uri.replace(queryParameters: queryParam);
    // get file length
    var length = await fileToUpload.length();
    print("OTHER DOC UPLOAD " + uri.toString());
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

  Future<String> deleteDoc(String id, String stdId, String instituteId) async {
    Map<String, String> queryParam = {
      "id": id,
      "inst": instituteId,
      "type": "partner",
      "fpro": "$stdId",
    };
    Uri uri = Uri.parse(deleteDocUrl);
    print(deleteDocUrl);
    uri = uri.replace(queryParameters: queryParam);
    final http.Response response = await httpClient.post(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map deletedFileMap = json.decode(response.body);
        print(deletedFileMap);
        final status = deletedFileMap["status"];
        return status;
      } catch (_) {
        print(_.toString());
      }
    }
    return null;
  }

  Future<dynamic> storeWorkExp(String stdId, WorkExpDto workExpDto) async {
    Map<String, String> queryParam = {
      "type": "partner",
      "fpro": "$stdId",
    };
    final body = json.encode(workExpDto);
    Uri uri = Uri.parse(addWorkExpUrl);
    uri = uri.replace(queryParameters: queryParam);
    print("WORK EXP JSON" + body.toString() + uri.toString());
    final http.Response response = await httpClient.post(uri,
        body: body, headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map workExpMap = json.decode(response.body);
        // print(workExpMap);
        final status = workExpMap["status"];
        switch (status) {
          case "success":
            //change this later
            print(workExpMap);
            final WorkExpRes workExpRes = WorkExpRes.fromJson(workExpMap);

            print("WORKEXP API" + workExpRes.secor.length.toString());
            return workExpRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(workExpMap);
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

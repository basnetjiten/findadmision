import 'dart:async';
import 'dart:convert';
import 'package:findadmissionaffiliate/constants/api.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/institute/application_list_res.dart';
import 'package:findadmissionaffiliate/models/institute/apply_step_one_res.dart';
import 'package:findadmissionaffiliate/models/login/error.dart';
import 'package:findadmissionaffiliate/utils/affiliate_headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApplicationDS {
  final http.Client httpClient;

  ApplicationDS({@required this.httpClient});

  final applicationListUrl = AffiliatesConst.applicationList;
  final applyFirstUrl = AffiliatesConst.applyApplicationUrl;

  Future<dynamic> fetchApplList(String stdId) async {


    Map<String, String> queryParam = {
      "type": "partner",
      "fpro": stdId,

    };

    Uri uri = Uri.parse(applicationListUrl);
    uri = uri.replace(queryParameters: queryParam);

    print("APPLICATION URL" + uri.toString());

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    //debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map applicationListMap = json.decode(response.body);
        print("APPLICATIN MAP" + applicationListMap.toString());
        final status = applicationListMap["status"];

        switch (status) {
          case "success":
            final ApplicationListRes applicationListResponse =
                ApplicationListRes.fromJson(applicationListMap);
            return applicationListResponse;
            break;
          case "error":
            final LoginError loginError =
                LoginError.fromJSON(applicationListMap);
            return loginError;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
  }

  Future<dynamic> applyFirstStep(
    stepOneDto,
    String stdId,
    String instId,
    String studyLevel,
  ) async {
    Map<String, String> queryParam = {
      "type": "partner",
      "fpro": stdId,
      "instid": instId,
      "level": studyLevel,
      "lang": "1",
    };

    Uri uri = Uri.parse(applyFirstUrl);
    uri = uri.replace(queryParameters: queryParam);
    print("APPLICATION FIRST APPLY URL" + uri.toString() + accessToken.toString());
    String body = jsonEncode(stepOneDto);
    print("STEP ONE JSON"+body);

    final http.Response response = await httpClient.post(uri,
        body: body,
        headers: AffiliateHeaders.authHeaders(accessToken));

    //debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map applyStepOneMap = json.decode(response.body);
        print(applyStepOneMap);
        final status = applyStepOneMap["status"];
        switch (status) {
          case "success":
            final StepOneApplyRes stepOneApplyRes =
                StepOneApplyRes.fromJson(applyStepOneMap);

            return stepOneApplyRes;
            break;
          case "error":
            final dynamic errorResponse = LoginError.fromJSON(applyStepOneMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
  }
}

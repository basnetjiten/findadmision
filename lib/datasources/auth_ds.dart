import 'dart:async';
import 'dart:convert';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/constants/api.dart';
import 'package:findadmissionaffiliate/dto/fcm_token_post.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/auth/fcm_token_check.dart';
import 'package:findadmissionaffiliate/models/auth/token_check_res.dart';
import 'package:findadmissionaffiliate/models/login/error.dart';
import 'package:findadmissionaffiliate/utils/affiliate_headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthDS {
  final http.Client httpClient;

  AuthDS({@required this.httpClient});

  final tokenCheckUrl = AffiliatesConst.tokenCheckUrl;
  final firebaseTokenCheckUrl = AffiliatesConst.firebaseTokenCheckUrl;

  Future<dynamic> checkTokenInServer({String accessToken}) async {
    Uri uri = Uri.parse(tokenCheckUrl);

    print(uri);

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map tokenMap = json.decode(response.body);
        print(tokenMap);

        final status = tokenMap["status"];
        switch(status){
          case "success":
            final TokenCheckResponse officeListResponse =
            TokenCheckResponse.fromJson(tokenMap);
            return officeListResponse;
            break;
          case "error":
            final LoginError loginError =
            LoginError.fromJSON(tokenMap);
            return loginError;
            break;}
      } catch (_) {
        print(_.toString());
      }
    }
  }

  Future<dynamic> checkTokenUsingFCM(
      {FcmTokenPostData fcmTokenPost}) async {
    Map<String, String> queryParam = {"os": os};
    final body = json.encode(fcmTokenPost);
    Uri uri = Uri.parse(firebaseTokenCheckUrl);
    uri = uri.replace(queryParameters: queryParam);
    print(uri);

    final http.Response response = await httpClient.post(uri,
        body: body, headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map fcmTokenMap = json.decode(response.body);
        print("FCM TOKEN MAP"+fcmTokenMap.toString());
        final status = fcmTokenMap["status"];
        switch(status){
          case "success":
            final FcmTokenCheckResponse fcmTokenCheckResponse =
            FcmTokenCheckResponse.fromJson(fcmTokenMap);
            return fcmTokenCheckResponse;
            break;
          case "error":
            final LoginError loginError =
            LoginError.fromJSON(fcmTokenMap);
            return loginError;
            break;
        }

      } catch (_) {
        print(_.toString());
      }
    }
  }
}

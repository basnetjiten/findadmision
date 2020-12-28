import 'dart:async';
import 'dart:convert';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/constants/api.dart';
import 'package:findadmissionaffiliate/dto/loginpost.dart';
import 'package:findadmissionaffiliate/helpers/appService_helper.dart';
import 'package:findadmissionaffiliate/models/dashboard_data.dart';
import 'package:findadmissionaffiliate/models/home/setting.dart';
import 'package:findadmissionaffiliate/models/login/error.dart';
import 'package:findadmissionaffiliate/models/login/login_response.dart';
import 'package:findadmissionaffiliate/models/login/pending_approval.dart';
import 'package:findadmissionaffiliate/models/notification_list.dart';
import 'package:findadmissionaffiliate/models/signup_response.dart';
import 'package:findadmissionaffiliate/utils/affiliate_headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:findadmissionaffiliate/dto/signuppost.dart';
import 'package:findadmissionaffiliate/models/home/office_list.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class UserDataSource {
  final http.Client httpClient;

  UserDataSource({@required this.httpClient});

  final loginUrl = AffiliatesConst.loginUrl;
  final signUpUrl = AffiliatesConst.signUpUrl;
  final mailCheckUrl = AffiliatesConst.mailCheck;
  final pinVerifyUrl = AffiliatesConst.pinVerifyUrl;
  final resendPinUrl = AffiliatesConst.resendPinUrl;
  final resetPassUrl = AffiliatesConst.resetPassUrl;
  final officeListUrl = AffiliatesConst.officeListUrl;
  final String dashboardUrl = AffiliatesConst.dashboardUrl;
  final String notificationListUrl = AffiliatesConst.notificationListUrl;
  final String saveInstUrl = AffiliatesConst.saveInstUrl;
  final String deleteInstUrl = AffiliatesConst.deleteInstUrl;

  // ignore: missing_return
  Future<Map<String, dynamic>> fetchLoginResponse(
      {LoginPost loginPost, String uniqueCode}) async {
    Map<String, String> queryParam = AppServiceHelper.queryParam(uniqueCode);
    Uri uri = Uri.parse(loginUrl);
    String loginPostBody = json.encode(loginPost);

    uri = uri.replace(queryParameters: queryParam);
    print(uri);
    print(loginPostBody);
    final http.Response response =
        await httpClient.post(uri, body: loginPostBody);

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> loginResponseMap =
            json.decode(response.body);
        print("PIN LOGIN CHECK" + loginResponseMap.toString());
        //final message = loginResponseMap["message"];
        return loginResponseMap;
      } catch (_) {
        print(_.toString());
      }
    }
  }

  Future<dynamic> fetchSignUpResponse(
      {SignUpPost signUpPost, String uniqueCode}) async {
    Map<String, String> queryParam = AppServiceHelper.queryParam(uniqueCode);
    Uri uri = Uri.parse(signUpUrl);
    String loginPostBody = json.encode(signUpPost);

    uri = uri.replace(queryParameters: queryParam);
    print(uri);
    print(loginPostBody);
    final http.Response response =
        await httpClient.post(uri, body: loginPostBody);

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map signUpResponseMap = json.decode(response.body);
        final message = signUpResponseMap["status"];
        print(message);
        print(signUpResponseMap);
        switch (message) {
          case "success":
            SignUpResponse signUpResponse =
                SignUpResponse.fromJson(signUpResponseMap);
            return signUpResponse;
            break;
          case 'error':
            LoginError loginError = LoginError.fromJSON(signUpResponseMap);
            return loginError;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
  }

  Future<bool> checkEmailStatus({String email}) async {
    Map<String, String> queryParam = {
      "brandedurl": "affiliateapp",
      "email": email
    };
    Uri uri = Uri.parse(mailCheckUrl);

    uri = uri.replace(queryParameters: queryParam);
    print(uri);

    final http.Response response = await httpClient.post(uri);

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map signUpResponseMap = json.decode(response.body);
        print(signUpResponseMap);
        final bool valid = signUpResponseMap["valid"];
        if (valid) {
          return valid;
        }
        return valid;
      } catch (_) {
        print(_.toString());
      }
    }
    return false;
  }

  Future<bool> fetchVerificationResponse({String email, String pin}) async {
    Map<String, String> queryParam = {
      "brandedurl": "affiliateapp",
      "pin": pin,
      "email": email
    };
    Uri uri = Uri.parse(pinVerifyUrl);

    uri = uri.replace(queryParameters: queryParam);
    print(uri);

    final http.Response response = await httpClient.get(uri);

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map pinVerificationMap = json.decode(response.body);
        print(pinVerificationMap);
        final bool valid = pinVerificationMap["valid"];
        return valid;
      } catch (_) {
        print(_.toString());
      }
    }
    return false;
  }

  Future<String> getResendPinVerification({String email}) async {
    Map<String, String> queryParam = {
      "brandedurl": "affiliateapp",
      "uniquecode": uniqueCode,
      "email": email,
      "fromweb": "false",
    };
    Uri uri = Uri.parse(resendPinUrl);

    uri = uri.replace(queryParameters: queryParam);
    print(uri);

    final http.Response response = await httpClient.get(uri);

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map pinVerificationMap = json.decode(response.body);
        print(pinVerificationMap);
        final String status = pinVerificationMap["status"];
        return status;
      } catch (_) {
        print(_.toString());
      }
    }
    //return false;
  }

  Future<bool> getResetPasswordResponse({String email}) async {
    Map<String, String> queryParam = {
      "brandedurl": "affiliateapp",
      "email": email,
    };
    Uri uri = Uri.parse(resetPassUrl);

    uri = uri.replace(queryParameters: queryParam);
    print(uri);

    final http.Response response = await httpClient.get(uri);

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map resetPasswordMap = json.decode(response.body);
        print(resetPasswordMap);
        final bool valid = resetPasswordMap["valid"];
        return valid;
      } catch (_) {
        print(_.toString());
      }
    }
    return false;
  }

  Future<dynamic> fetchOfficeList({String accessToken}) async {
    Uri uri = Uri.parse(officeListUrl);

    print(uri);

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map resetPasswordMap = json.decode(response.body);
        print(resetPasswordMap);
        final OfficeListResponse officeListResponse =
            OfficeListResponse.fromJson(resetPasswordMap);
        return officeListResponse;
      } catch (_) {
        print(_.toString());
      }
    }
    return false;
  }

  Future<DashboardDataRes> fetchDashboardData() async {
    Uri uri = Uri.parse(dashboardUrl);

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));
    print("DAHSBOARD URL" + uri.toString());
    print("CODE HTTP" + response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final responseJson = json.decode(response.body);
        //print("DASHBOARD DATA" + responseJson);
        final DashboardDataRes dashboardDataRes =
            DashboardDataRes.fromJson(responseJson);

        return dashboardDataRes;
      } catch (error) {
        print("HANDLE ERROR HERE LATER" + error.toString());
      }
    } else {
      return null;
    }
  }

  Future<NotificationListRes> fetchNotificationList(int index) async {
    Map<String, String> queryParam = {
      "start": index.toString(),
    };

    Uri uri = Uri.parse(notificationListUrl);

    uri = uri.replace(queryParameters: queryParam);
    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));
    print("NOTIFICATION URL" + uri.toString());
    print("CODE HTTP" + response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final responseJson = json.decode(response.body);
        //print("NOTIFICATION DATA" + responseJson);
        final NotificationListRes notificationListRes =
            NotificationListRes.fromJson(responseJson);

        return notificationListRes;
      } catch (error) {
        print("HANDLE ERROR HERE LATER" + error.toString());
      }
    } else {
      return null;
    }
  }

  Future<String> saveInst(String instId) async {
    Map<String, String> queryParam = {
      "id": instId,
    };

    Uri uri = Uri.parse(saveInstUrl);

    uri = uri.replace(queryParameters: queryParam);
    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    if (response.statusCode == 200) {
      try {
        final responseJson = json.decode(response.body);
        return responseJson["status"];
      } catch (error) {
        print("HANDLE ERROR HERE LATER" + error.toString());
      }
    } else {
      return null;
    }
  }
  Future<String> deleteInst(String instId) async {
    Map<String, String> queryParam = {
      "id": instId,
    };

    Uri uri = Uri.parse(deleteInstUrl);

    uri = uri.replace(queryParameters: queryParam);
    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    if (response.statusCode == 200) {
      try {
        final responseJson = json.decode(response.body);
        return responseJson["status"];
      } catch (error) {
        print("HANDLE ERROR HERE LATER" + error.toString());
      }
    } else {
      return null;
    }
  }
}

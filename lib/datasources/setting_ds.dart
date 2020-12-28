import 'dart:async';
import 'dart:convert';
import 'package:findadmissionaffiliate/constants/api.dart';
import 'package:findadmissionaffiliate/dto/change_pw_dto.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/home/setting.dart';
import 'package:findadmissionaffiliate/models/institute/application_list_res.dart';
import 'package:findadmissionaffiliate/models/institute/apply_step_one_res.dart';
import 'package:findadmissionaffiliate/models/login/error.dart';
import 'package:findadmissionaffiliate/utils/affiliate_headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SettingDS {
  final http.Client httpClient;

  SettingDS({@required this.httpClient});

  final changePwUrl = AffiliatesConst.changePwUrl;
  final settingLoadUrl = AffiliatesConst.settingLoadUrl;
  final settingUpdateUrl = AffiliatesConst.settingUpdateUrl;

  Future<dynamic> changePassword(ChangePwDto passwordDto) async {
    Uri uri = Uri.parse(changePwUrl);
    print("APPLICATION APPLY URL" + uri.toString());
    final body = jsonEncode(passwordDto);
    final http.Response response = await httpClient.post(uri,
        body: body, headers: AffiliateHeaders.authHeaders(accessToken));

    //debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map passChangeMap = json.decode(response.body);
        print(passChangeMap);
        final status = passChangeMap["status"];
        switch (status) {
          case "success":
            final dynamic pwChangeResponse = LoginError.fromJSON(passChangeMap);

            return pwChangeResponse;
            break;
          case "showerror":
            final dynamic errorResponse = LoginError.fromJSON(passChangeMap);
            return errorResponse;
            break;
        }
      } catch (_) {
        print(_.toString());
      }
    }
  }

  Future<SettingLoadRes> fetchSettingData() async {
    Uri uri = Uri.parse(settingLoadUrl);
    final http.Response response = await httpClient.post(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));
    print("SETTING URL" + uri.toString());
    print("CODE HTTP" + response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final responseJson = json.decode(response.body);
        print("SETTING DATA" + responseJson.toString());
        final SettingLoadRes settingLoadRes =
            SettingLoadRes.fromJson(responseJson);

        return settingLoadRes;
      } catch (error) {
        print("HANDLE ERROR HERE LATER" + error.toString());
      }
    } else {
      return null;
    }
  }

  Future<bool> updateSettingData(formData) async {
    Uri uri = Uri.parse(settingUpdateUrl);
    final body = json.encode(formData);

    final http.Response response = await httpClient.post(uri,
        body: body, headers: AffiliateHeaders.authHeaders(accessToken));
    if (response.statusCode == 200) {
      try {
        final responseJson = json.decode(response.body);
        print("UPDATE SETTING" + responseJson.toString());
        return responseJson['message'];
      } catch (error) {
        print("HANDLE ERROR HERE LATER" + error.toString());
      }
    } else {
      return null;
    }
  }
}

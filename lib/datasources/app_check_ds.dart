import 'dart:async';
import 'dart:convert';
import 'package:findadmissionaffiliate/constants/api.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/models/dashboard_data.dart';
import 'package:findadmissionaffiliate/models/institute/loaddata_label.dart';
import 'package:findadmissionaffiliate/utils/affiliate_headers.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AppCheckDs {
  final http.Client httpClient;

  AppCheckDs({@required this.httpClient});

  final String appCheckUrl = AffiliatesConst.appCheck;
  final String loadDataUrl = AffiliatesConst.loadDataUrl;

  // ignore: missing_return
  Future<AppCheck> fetchAppCheckData({String version, String os}) async {
    Map<String, String> queryParam = {"version": version, "os": os};
    Uri uri = Uri.parse(appCheckUrl);

    uri = uri.replace(queryParameters: queryParam);
    print(uri);
    final http.Response response = await httpClient.get(uri);

    if (response.statusCode == 200) {
      try {
        final responseJson = json.decode(response.body);
        print("APP CHECK"+responseJson['budgetoptions'].toString());
        final AppCheck appCheck = AppCheck.fromJson(responseJson);

        return appCheck;
      } catch (error) {
        print("HANDLE ERROR HERE LATER" + error);
      }
    }
  }

  Future<LoadDataLabel> fetchPartnerFormLabel() async {
    Map<String, String> queryParam = {"type": "partner"};
    Uri uri = Uri.parse(loadDataUrl);

    uri = uri.replace(queryParameters: queryParam);
    print(uri);
    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    if (response.statusCode == 200) {
      try {
        final responseJson = json.decode(response.body);
        print(responseJson);
        final LoadDataLabel loadDataLabel =
            LoadDataLabel.fromJson(responseJson);

        return loadDataLabel;
      } catch (error) {
        print("HANDLE ERROR HERE LATER" + error);
      }
    }
  }

}

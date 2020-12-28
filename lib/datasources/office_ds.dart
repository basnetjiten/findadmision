import 'dart:async';
import 'dart:convert';
import 'package:findadmissionaffiliate/constants/api.dart';
import 'package:findadmissionaffiliate/dto/add_office.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'package:findadmissionaffiliate/models/home/office_list.dart';
import 'package:findadmissionaffiliate/utils/affiliate_headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OfficeDs {
  final http.Client httpClient;

  OfficeDs({@required this.httpClient});

  final officeListUrl = AffiliatesConst.officeListUrl;
  final addOfficeUrl = AffiliatesConst.addOfficeUrl;
  final removeOfficeUrl = AffiliatesConst.removeOfficeUrl;
  final updateOfficeUrl = AffiliatesConst.updateOfficeUrl;

  Future<OfficeListResponse> fetchOfficeList({String accessToken}) async {
    Uri uri = Uri.parse(officeListUrl);

    // print(uri);

    final http.Response response = await httpClient.get(uri,
        headers: AffiliateHeaders.authHeaders(accessToken));

    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      try {
        final Map officeListMap = json.decode(response.body);
        //print(officeListMap);
        final OfficeListResponse officeListResponse =
            OfficeListResponse.fromJson(officeListMap);
        return officeListResponse;
      } catch (_) {
        print(_.toString());
      }
    }
  }

  Future<dynamic> getAddedOffice(
      {String accessToken, AddOfficePostData officePostData}) async {
    Uri uri = Uri.parse(addOfficeUrl);
    String officeAddPostData = json.encode(officePostData);

    print(uri.toString() + officeAddPostData);

    final http.Response response = await httpClient.post(uri,
        body: officeAddPostData,
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

  Future<dynamic> getUpdatedOffice(
      {String accessToken,
      int officeId,
      AddOfficePostData officePostData}) async {
    Uri uri = Uri.parse(updateOfficeUrl);

    Map<String, String> queryParam = {
      "id": "$officeId",
    };
    uri = uri.replace(queryParameters: queryParam);

    String officeAddPostData = json.encode(officePostData);

    print(uri.toString() + officeAddPostData);

    final http.Response response = await httpClient.post(uri,
        body: officeAddPostData,
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

  Future<dynamic> deleteOffice({String officeId}) async {
    Map<String, String> queryParam = {"id": officeId};
    print(accessToken);
    Uri uri = Uri.parse(removeOfficeUrl);
    uri = uri.replace(queryParameters: queryParam);
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
    return null;
  }
}

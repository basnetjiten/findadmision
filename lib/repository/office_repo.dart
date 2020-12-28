import 'package:findadmissionaffiliate/datasources/office_ds.dart';
import 'package:findadmissionaffiliate/models/home/office_list.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OfficeRepository {
  final OfficeDs officeDS = OfficeDs(httpClient: http.Client());

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'token';
  }

  Future<OfficeListResponse> getOfficeList(String accessToken) async {
    return officeDS.fetchOfficeList(accessToken: accessToken);
  }

  Future<dynamic> addOffice(String accessToken,officePostData) async {
    return officeDS.getAddedOffice(accessToken: accessToken,officePostData: officePostData);
  }
  Future<dynamic> updateOffice(String accessToken,officePostData) async {
    return officeDS.getUpdatedOffice(accessToken: accessToken,officePostData: officePostData);
  }

  Future<dynamic> removeOffice(String officeId) async {
    return officeDS.deleteOffice(officeId:officeId);
  }
}

import 'package:findadmissionaffiliate/datasources/app_check_ds.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/models/institute/loaddata_label.dart';
import 'package:http/http.dart' as http;

class AppCheckRepo {
  final AppCheckDs _appCheckDs = AppCheckDs(httpClient: http.Client());

  //get the app check data
  Future<AppCheck> getAppCheckData({String version, String os}) {
    return _appCheckDs.fetchAppCheckData(os: os, version: version);
  }

  Future<LoadDataLabel> loadPartnerFormLabel() {return _appCheckDs.fetchPartnerFormLabel();}
}

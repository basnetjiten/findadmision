import 'package:findadmissionaffiliate/datasources/app_ds.dart';
import 'package:findadmissionaffiliate/datasources/setting_ds.dart';
import 'package:findadmissionaffiliate/models/home/setting.dart';
import 'package:http/http.dart' as http;

class SettingRepo {
  final SettingDS settingDS = SettingDS(httpClient: http.Client());

  Future<dynamic> changePw(passDto) async {
    return settingDS.changePassword(passDto);
  }

  Future<SettingLoadRes> fetchSettingData() {
    return settingDS.fetchSettingData();
  }

  Future<bool> updateSettingData(formData) {
    return settingDS.updateSettingData(formData);
  }
}

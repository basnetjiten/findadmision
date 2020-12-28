import 'dart:convert';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/login/login_response.dart';
import 'package:findadmissionaffiliate/repository/user/menu/local_repo.dart';

class DbManager {
  static Future<int> storeLoginResInLocalDB(
      LoginResponse loginResponse) async {
    //decode the response to String format
    String loginResponseString = jsonEncode(loginResponse);

    //convert the string to Map of <String,dynamic> format

    Map<String, dynamic> loginResponseMap = {
      "loginResponse": loginResponseString
    };

    //store this Map response in to local database
    int loginStored = await getIt<LocalLoginRepository>()
        .insertLoginResponseData(loginResponseMap);
   // print("LOGGIN STORED" + loginStored.toString());
    return loginStored;
  }

  static Future<int> refreshLocalDb() async {


    //store this Map response in to local database
    int refreshed = await getIt<LocalLoginRepository>()
        .deleteAllLoginResponse();
    return refreshed;
  }


/*  static Future<int> storeUserInfo(
      UserProfileResponse userProfileResponse) async {
    //decode the response to String format
    String userProfileResponseString = jsonEncode(userProfileResponse);

    //convert the string to Map of <String,dynamic> format

    Map<String, dynamic> userInfoResponse = {
      "userInfo": userProfileResponseString
    };

    //store this Map response in to local database
    int profileStored = await getIt<UserProfileResponseRepo>()
        .insertUserProfileResponseData(userInfoResponse);
    return profileStored;
  }*/
}

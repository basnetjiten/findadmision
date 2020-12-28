import 'package:findadmissionaffiliate/datasources/user_datasource.dart';
import 'package:findadmissionaffiliate/dto/loginpost.dart';
import 'package:findadmissionaffiliate/dto/signuppost.dart';
import 'package:findadmissionaffiliate/models/dashboard_data.dart';
import 'package:findadmissionaffiliate/models/home/setting.dart';
import 'package:findadmissionaffiliate/models/notification_list.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final UserDataSource userDataSource =
      UserDataSource(httpClient: http.Client());

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'token';
  }

  Future<Map<String,dynamic>> getLoginResponse(LoginPost userLoginPost,String uniqueCode) async {
    return userDataSource.fetchLoginResponse(loginPost: userLoginPost,uniqueCode: uniqueCode);
  }

  Future<dynamic> getSignUpResponse(SignUpPost userSignUpPost,String uniqueCode) async {
    return userDataSource.fetchSignUpResponse(signUpPost: userSignUpPost,uniqueCode: uniqueCode);
  }

  Future<dynamic> checkEmail(String email) async {
    return userDataSource.checkEmailStatus(email: email);
  }

  Future<bool> verifyPin(String email,String pin) async {
    return userDataSource.fetchVerificationResponse(email: email,pin: pin);
  }
  Future<String> resendPinVerification(String email) async {
    return userDataSource.getResendPinVerification(email: email);
  }

  Future<bool> resetPassword(String email) async {
    return userDataSource.getResetPasswordResponse(email: email);
  }


  Future<dynamic> getOfficeList(String accessToken) async {return userDataSource.fetchOfficeList(accessToken: accessToken);}

  Future<DashboardDataRes> fetchDashboardData() {return userDataSource.fetchDashboardData();}

  Future<NotificationListRes> fetchNotificationList(int index) {return userDataSource.fetchNotificationList(index);}
  Future<String> saveInst(String index) {return userDataSource.saveInst(index);}
  Future<String> deleteInst(String index) {return userDataSource.deleteInst(index);}



}

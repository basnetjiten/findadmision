import 'package:findadmissionaffiliate/datasources/auth_ds.dart';
import 'package:findadmissionaffiliate/models/auth/token_check_res.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final AuthDS authDS = AuthDS(httpClient: http.Client());

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'token';
  }

  Future<dynamic> checkToken(String accessToken) async {
    return authDS.checkTokenInServer(accessToken: accessToken);
  }

  Future<dynamic> firebaseTokeCheck(fcmTokenPostData) async {
    return authDS.checkTokenUsingFCM(fcmTokenPost: fcmTokenPostData);
  }
}

import 'dart:convert';

import 'package:findadmissionaffiliate/database/user/login/login_database.dart';
import 'package:findadmissionaffiliate/models/login/login_response.dart';

class UserLoggedInDao {
  final dbProvider = UserLoginDatabaseProvider.loginDbProvider;

  //Adds new NetworkResponse records
  Future<int> createLoginResponse(Map<String, dynamic> loginResponse) async {
    //print("STORE LOGIN RESPONSE"+jsonEncode(loginResponse));
    final db = await dbProvider.database;
    var result = db.insert(loginTable, loginResponse);

    return result;
  }

  //Get All NetworkResponse items
  //Searches if query string was passed
  Future<LoginResponse> getLoginResponse() async {
    String loginResponse;
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;

    result = await db.rawQuery('SELECT * FROM $loginTable');

    if (result.length > 0) {
      result[0].forEach((key, value) {
        if (key == "loginResponse") {
          loginResponse = value;
        }
      });
      return  LoginResponse.fromJson(jsonDecode(loginResponse));

    }
    return null;
  }

  //Delete NetworkResponse records
  Future<int> deleteLoginResponse(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(loginTable, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  //We are not going to use this in the demo
  Future<int> deleteAllLoginResponses() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      loginTable,
    );

    return result;
  }

  //Update LoginResponse record
  Future<int> updateUserProfile(Map<String, dynamic> loginResponse) async {
    final db = await dbProvider.database;
    // print("USER ID"+userProfileData.accessToken);
    var profileResult = await db.update(
      loginTable,
      loginResponse,
    );
    //print("LOGIN RESULT"+profileResult.toString());
    return profileResult;
  }
}

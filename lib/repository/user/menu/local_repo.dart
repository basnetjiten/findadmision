import 'package:findadmissionaffiliate/database/user/login/login_dao.dart';
import 'package:findadmissionaffiliate/models/login/login_response.dart';

class LocalLoginRepository {
  final UserLoggedInDao uerLoggedInDao = UserLoggedInDao();

  Future<LoginResponse> getLocalLoginResponse() => uerLoggedInDao.getLoginResponse();

  Future<int> insertLoginResponseData(Map<String, dynamic> loginResponse) =>
      uerLoggedInDao.createLoginResponse(loginResponse);

  //We are not going to use this in the project
  Future<int> deleteAllLoginResponse() =>
      uerLoggedInDao.deleteAllLoginResponses();

  Future<int> updateLoginResponse(Map<String, dynamic> loginResponse) =>
      uerLoggedInDao.updateUserProfile(loginResponse);
}

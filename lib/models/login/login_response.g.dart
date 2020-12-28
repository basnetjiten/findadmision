// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    json['access_token'] as String,
    json['message'] as String,
    json['status'] as String,
    json['token_info'] == null
        ? null
        : LoginTokenInfo.fromJson(json['token_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'message': instance.message,
      'status': instance.status,
      'token_info': instance.tokenInfo,
    };

LoginTokenInfo _$LoginTokenInfoFromJson(Map<String, dynamic> json) {
  return LoginTokenInfo(
    json['email'] as String,
    json['fname'] as String,
    json['fullname'] as String,
    json['lname'] as String,
    json['token'] as String,
    json['user'] as String,
  );
}

Map<String, dynamic> _$LoginTokenInfoToJson(LoginTokenInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fname': instance.firstName,
      'fullname': instance.fullName,
      'lname': instance.lastName,
      'token': instance.token,
      'user': instance.user,
    };

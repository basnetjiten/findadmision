// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_check_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenCheckResponse _$TokenCheckResponseFromJson(Map<String, dynamic> json) {
  return TokenCheckResponse(
    json['access_token'] as String,
    json['message'] as String,
    json['status'] as String,
    json['token_info'] == null
        ? null
        : TokenInfo.fromJson(json['token_info'] as Map<String, dynamic>),
    json['user_info'] == null
        ? null
        : UserInfo.fromJson(json['user_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TokenCheckResponseToJson(TokenCheckResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'message': instance.message,
      'status': instance.status,
      'token_info': instance.tokenInfo,
      'user_info': instance.userInfo,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    json['countrycode'] as String,
    json['email'] as String,
    json['fullname'] as String,
    json['jobtitle'] as String,
    json['parent'] as String,
    json['phone'] as String,
    json['pic'] as String,
    json['type'] as String,
    json['user'] as String,
  );
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'countrycode': instance.countryCode,
      'email': instance.email,
      'fullname': instance.fullName,
      'jobtitle': instance.jobTitle,
      'parent': instance.parent,
      'phone': instance.phone,
      'pic': instance.pic,
      'type': instance.type,
      'user': instance.user,
    };

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) {
  return TokenInfo(
    json['created_microtime'] as String,
    json['created_time'] as String,
    json['expire_microtime'] as String,
    json['expire_time'] as String,
    json['token'] as String,
    json['user'] as String,
  );
}

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance) => <String, dynamic>{
      'created_microtime': instance.createdMicrotime,
      'created_time': instance.createdTime,
      'expire_microtime': instance.expireMicrotime,
      'expire_time': instance.expireTime,
      'token': instance.token,
      'user': instance.user,
    };

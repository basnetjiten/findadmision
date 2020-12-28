// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmTokenPostData _$FcmTokenPostDataFromJson(Map<String, dynamic> json) {
  return FcmTokenPostData(
    firebasetoken: json['firebasetoken'] as String,
    appversion: json['appversion'] as String,
  );
}

Map<String, dynamic> _$FcmTokenPostDataToJson(FcmTokenPostData instance) =>
    <String, dynamic>{
      'firebasetoken': instance.firebasetoken,
      'appversion': instance.appversion,
    };

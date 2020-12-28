// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmTokenCheckResponse _$FcmTokenCheckResponseFromJson(
    Map<String, dynamic> json) {
  return FcmTokenCheckResponse(
    json['loadpremium'] as bool,
    json['message'] as String,
    json['noticount'] as int,
    json['notilist'] as List,
    json['pchatcount'] as int,
    json['runningev'] as List,
    json['status'] as String,
    json['tchatcount'] as int,
    json['tnoticount'] as int,
    json['waiting'] as bool,
  );
}

Map<String, dynamic> _$FcmTokenCheckResponseToJson(
        FcmTokenCheckResponse instance) =>
    <String, dynamic>{
      'loadpremium': instance.loadPremium,
      'message': instance.message,
      'noticount': instance.notiCount,
      'notilist': instance.notiList,
      'pchatcount': instance.pChatCount,
      'runningev': instance.runningEV,
      'status': instance.status,
      'tchatcount': instance.tChatCount,
      'tnoticount': instance.tNotiCount,
      'waiting': instance.waiting,
    };

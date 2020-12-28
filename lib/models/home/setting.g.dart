// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingLoadRes _$SettingLoadResFromJson(Map<String, dynamic> json) {
  return SettingLoadRes(
    json['status'] as String,
    (json['partnerdet'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$SettingLoadResToJson(SettingLoadRes instance) =>
    <String, dynamic>{
      'status': instance.status,
      'partnerdet': instance.partnerDet,
    };

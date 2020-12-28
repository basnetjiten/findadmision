// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) {
  return SignUpResponse(
    json['status'] as String,
    json['message'] as String,
    json['nextpage'] as String,
  );
}

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'nextpage': instance.nextpage,
    };

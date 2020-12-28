// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_approval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingApproval _$PendingApprovalFromJson(Map<String, dynamic> json) {
  return PendingApproval(
    json['email'] as String,
    json['message'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$PendingApprovalToJson(PendingApproval instance) =>
    <String, dynamic>{
      'email': instance.email,
      'message': instance.message,
      'status': instance.status,
    };

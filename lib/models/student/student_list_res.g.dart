// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_list_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentListResponse _$StudentListResponseFromJson(Map<String, dynamic> json) {
  return StudentListResponse(
    json['status'] as String,
    (json['studentlist'] as List)
        ?.map((e) =>
            e == null ? null : Studentlist.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['cdnf'] as String,
  );
}

Map<String, dynamic> _$StudentListResponseToJson(
        StudentListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'studentlist': instance.studentlist,
      'cdnf': instance.cdnf,
    };

Studentlist _$StudentlistFromJson(Map<String, dynamic> json) {
  return Studentlist(
    json['completedcount'] as int,
    json['incompletedcount'] as int,
    json['acceptedcount'] as int,
    json['rejectedcount'] as int,
    json['members_id'] as String,
    json['members_firstname'] as String,
    json['members_lastname'] as String,
    json['country_name'] as String,
    json['members_pickey'] as String,
  );
}

Map<String, dynamic> _$StudentlistToJson(Studentlist instance) =>
    <String, dynamic>{
      'completedcount': instance.completedCount,
      'incompletedcount': instance.inCompletedCount,
      'acceptedcount': instance.acceptedCount,
      'rejectedcount': instance.rejectedCount,
      'members_id': instance.membersId,
      'members_firstname': instance.membersFirstname,
      'members_lastname': instance.membersLastname,
      'country_name': instance.countryName,
      'members_pickey': instance.membersPickey,
    };

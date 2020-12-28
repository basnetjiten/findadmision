// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'added_std_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentAddedResponse _$StudentAddedResponseFromJson(Map<String, dynamic> json) {
  return StudentAddedResponse(
    status: json['status'] as String,
    lastaddedstudent: json['lastaddedstudent'] as int,
    studentlist: (json['studentlist'] as List)
        ?.map((e) => e == null
            ? null
            : AddedStudentList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StudentAddedResponseToJson(
        StudentAddedResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'lastaddedstudent': instance.lastaddedstudent,
      'studentlist': instance.studentlist,
    };

AddedStudentList _$AddedStudentListFromJson(Map<String, dynamic> json) {
  return AddedStudentList(
    json['completedcount'] as int,
    json['incompletedcount'] as int,
    json['acceptedcount'] as int,
    json['rejectedcount'] as int,
    json['members_firstname'] as String,
    json['members_lastname'] as String,
    json['country_name'] as String,
    json['members_pickey'] as String,
  );
}

Map<String, dynamic> _$AddedStudentListToJson(AddedStudentList instance) =>
    <String, dynamic>{
      'completedcount': instance.completedCount,
      'incompletedcount': instance.inCompletedCount,
      'acceptedcount': instance.acceptedCount,
      'rejectedcount': instance.rejectedCount,
      'members_firstname': instance.membersFirstname,
      'members_lastname': instance.membersLastname,
      'country_name': instance.countryName,
      'members_pickey': instance.membersPickey,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardDataRes _$DashboardDataResFromJson(Map<String, dynamic> json) {
  return DashboardDataRes(
    json['announcement'] as String,
    (json['applicationcount'] as List)
        ?.map((e) => e == null
            ? null
            : Applicationcount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['basic'] == null
        ? null
        : Basic.fromJson(json['basic'] as Map<String, dynamic>),
    (json['featureddegree'] as List)
        ?.map((e) => e == null
            ? null
            : Featureddegree.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['instcountryper'] as List)
        ?.map((e) => e == null
            ? null
            : Instcountryper.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['recentinst'] as List)
        ?.map((e) =>
            e == null ? null : Recentinst.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['status'] as String,
    (json['studentcount'] as List)
        ?.map((e) =>
            e == null ? null : Studentcount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DashboardDataResToJson(DashboardDataRes instance) =>
    <String, dynamic>{
      'announcement': instance.announcement,
      'applicationcount': instance.applicationcount,
      'basic': instance.basic,
      'featureddegree': instance.featureddegree,
      'instcountryper': instance.instcountryper,
      'recentinst': instance.recentinst,
      'status': instance.status,
      'studentcount': instance.studentcount,
    };

Applicationcount _$ApplicationcountFromJson(Map<String, dynamic> json) {
  return Applicationcount(
    json['count'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$ApplicationcountToJson(Applicationcount instance) =>
    <String, dynamic>{
      'count': instance.count,
      'name': instance.name,
    };

Basic _$BasicFromJson(Map<String, dynamic> json) {
  return Basic(
    json['fullname'] as String,
    json['id'] as String,
    json['name'] as String,
    json['secondline'] as String,
  );
}

Map<String, dynamic> _$BasicToJson(Basic instance) => <String, dynamic>{
      'fullname': instance.fullname,
      'id': instance.id,
      'name': instance.name,
      'secondline': instance.secondline,
    };

Featureddegree _$FeatureddegreeFromJson(Map<String, dynamic> json) {
  return Featureddegree(
    json['degree_id'] as String,
    json['degree_name'] as String,
    json['degree_title'] as String,
  );
}

Map<String, dynamic> _$FeatureddegreeToJson(Featureddegree instance) =>
    <String, dynamic>{
      'degree_id': instance.degreeId,
      'degree_name': instance.degreeName,
      'degree_title': instance.degreeTitle,
    };

Instcountryper _$InstcountryperFromJson(Map<String, dynamic> json) {
  return Instcountryper(
    json['country_id'] as String,
    json['country_name'] as String,
    (json['percentage'] as num)?.toDouble(),
    json['total'] as String,
  );
}

Map<String, dynamic> _$InstcountryperToJson(Instcountryper instance) =>
    <String, dynamic>{
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'percentage': instance.percentage,
      'total': instance.total,
    };

Recentinst _$RecentinstFromJson(Map<String, dynamic> json) {
  return Recentinst(
    json['country_name'] as String,
    json['institutes_id'] as String,
    json['institutes_istest'],
    json['institutes_name'] as String,
    json['institutes_nickname'] as String,
    json['saved'] as bool,
  );
}

Map<String, dynamic> _$RecentinstToJson(Recentinst instance) =>
    <String, dynamic>{
      'country_name': instance.countryName,
      'institutes_id': instance.institutesId,
      'institutes_istest': instance.institutesIstest,
      'institutes_name': instance.institutesName,
      'institutes_nickname': instance.institutesNickname,
      'saved': instance.saved,
    };

Studentcount _$StudentcountFromJson(Map<String, dynamic> json) {
  return Studentcount(
    json['count'] as int,
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$StudentcountToJson(Studentcount instance) =>
    <String, dynamic>{
      'count': instance.count,
      'id': instance.id,
      'name': instance.name,
    };

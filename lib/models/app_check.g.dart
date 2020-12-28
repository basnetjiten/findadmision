// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppCheck _$AppCheckFromJson(Map<String, dynamic> json) {
  return AppCheck(
    json['androidurl'] as String,
    json['androidver'] as int,
    (json['country'] as List)
        ?.map((e) =>
            e == null ? null : Country.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['countrycode'] as String,
    (json['countryids'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    (json['day'] as List)
        ?.map((e) => (e as List)?.map((e) => e as int)?.toList())
        ?.toList(),
    (json['dialingcodes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['ios'] as String,
    json['iosurl'] as String,
    json['iosver'] as int,
    (json['month'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
    json['uniquecode'] as String,
    json['uniqueurl'] as bool,
    json['valid'] as bool,
    json['weburl'] as String,
    json['webver'] as int,
    (json['year'] as List)
        ?.map((e) => (e as List)?.map((e) => e as int)?.toList())
        ?.toList(),
    (json['budgetoptions'] as List)
        ?.map((e) =>
            e == null ? null : Budgetoption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..studentstatus = (json['studentstatus'] as List)
      ?.map((e) =>
          e == null ? null : Studentstatus.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$AppCheckToJson(AppCheck instance) => <String, dynamic>{
      'androidurl': instance.androidurl,
      'androidver': instance.androidver,
      'country': instance.country,
      'countrycode': instance.countrycode,
      'countryids': instance.countryids,
      'day': instance.day,
      'dialingcodes': instance.dialingcodes,
      'ios': instance.ios,
      'iosurl': instance.iosurl,
      'iosver': instance.iosver,
      'month': instance.month,
      'uniquecode': instance.uniquecode,
      'uniqueurl': instance.uniqueurl,
      'valid': instance.valid,
      'weburl': instance.weburl,
      'webver': instance.webver,
      'year': instance.year,
      'studentstatus': instance.studentstatus,
      'budgetoptions': instance.budgetoptions,
    };

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    json['country_dialingcode'] as String,
    json['country_id'] as String,
    json['country_name'] as String,
    json['country_shortcode'] as String,
    json['dlkey'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'country_dialingcode': instance.countryDialingcode,
      'country_id': instance.countryId,
      'country_name': instance.countryName,
      'country_shortcode': instance.countryShortcode,
      'dlkey': instance.dlkey,
    };

Studentstatus _$StudentstatusFromJson(Map<String, dynamic> json) {
  return Studentstatus(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$StudentstatusToJson(Studentstatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Budgetoption _$BudgetoptionFromJson(Map<String, dynamic> json) {
  return Budgetoption(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$BudgetoptionToJson(Budgetoption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

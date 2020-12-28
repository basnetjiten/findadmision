// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOfficePostData _$AddOfficePostDataFromJson(Map<String, dynamic> json) {
  return AddOfficePostData()
    ..address = json['address'] as String
    ..contact = json['contact'] as String
    ..country = json['country'] as String
    ..city = json['city'] as String;
}

Map<String, dynamic> _$AddOfficePostDataToJson(AddOfficePostData instance) =>
    <String, dynamic>{
      'address': instance.address,
      'contact': instance.contact,
      'country': instance.country,
      'city': instance.city,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signuppost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpPost _$SignUpPostFromJson(Map<String, dynamic> json) {
  return SignUpPost()
    ..fname = json['fname'] as String
    ..lname = json['lname'] as String
    ..vpassword = json['vpassword'] as String
    ..uniquecode = json['uniquecode'] as String
    ..email = json['email'] as String
    ..password = json['password'] as String
    ..companyname = json['companyname'] as String
    ..gender = json['gender'] as String
    ..country = json['country'] as String
    ..dialingcode = json['dialingcode'] as String
    ..phone = json['phone'] as String
    ..wadialingcode = json['wadialingcode'] as String
    ..waphone = json['waphone'] as String;
}

Map<String, dynamic> _$SignUpPostToJson(SignUpPost instance) =>
    <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
      'vpassword': instance.vpassword,
      'uniquecode': instance.uniquecode,
      'email': instance.email,
      'password': instance.password,
      'companyname': instance.companyname,
      'gender': instance.gender,
      'country': instance.country,
      'dialingcode': instance.dialingcode,
      'phone': instance.phone,
      'wadialingcode': instance.wadialingcode,
      'waphone': instance.waphone,
    };

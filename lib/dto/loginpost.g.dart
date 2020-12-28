// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginpost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPost _$LoginPostFromJson(Map<String, dynamic> json) {
  return LoginPost()
    ..password = json['password'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic> _$LoginPostToJson(LoginPost instance) => <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
    };

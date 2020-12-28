import 'package:json_annotation/json_annotation.dart';
part 'loginpost.g.dart';

@JsonSerializable()
class LoginPost {
  String password;
  String email;

  LoginPost();

  /* factory LoginPost.fromJson(Map<String, dynamic> json) =>
      _$LoginPostFromJson(json);*/

  Map<String, dynamic> toJson() => _$LoginPostToJson(this);
}

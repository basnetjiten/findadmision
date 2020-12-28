import 'package:json_annotation/json_annotation.dart';
part 'signuppost.g.dart';

@JsonSerializable()
class SignUpPost {
  String fname,
      lname,
      vpassword,
      uniquecode,
      email,
      password,
      companyname,
      gender,
      country,
      dialingcode,
      phone,
      wadialingcode,
      waphone;

  SignUpPost();

  /* factory LoginPost.fromJson(Map<String, dynamic> json) =>
      _$LoginPostFromJson(json);*/

  Map<String, dynamic> toJson() => _$SignUpPostToJson(this);
}

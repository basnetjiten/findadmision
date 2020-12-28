import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'access_token')
  String accessToken;
  String message;
  String status;
  @JsonKey(name: 'token_info')
  LoginTokenInfo tokenInfo;

  LoginResponse(this.accessToken, this.message, this.status, this.tokenInfo);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginTokenInfo {

  String email;
  @JsonKey(name: "fname")
  String firstName;
  @JsonKey(name: "fullname")
  String fullName;
  @JsonKey(name: "lname")
  String lastName;
  String token;
  String user;

  LoginTokenInfo(this.email, this.firstName, this.fullName, this.lastName,
      this.token, this.user);

  factory LoginTokenInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginTokenInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginTokenInfoToJson(this);


}
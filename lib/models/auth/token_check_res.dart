import 'package:json_annotation/json_annotation.dart';
part 'token_check_res.g.dart';
@JsonSerializable()
class TokenCheckResponse {
  @JsonKey(name: 'access_token')
  String accessToken;
  String message;
  String status;
  @JsonKey(name: 'token_info')
  TokenInfo tokenInfo;
  @JsonKey(name: 'user_info')
  UserInfo userInfo;

  TokenCheckResponse(this.accessToken, this.message, this.status,
      this.tokenInfo, this.userInfo);

  factory TokenCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenCheckResponseFromJson(json);
}

@JsonSerializable()
class UserInfo {
  @JsonKey(name: 'countrycode')
  String countryCode;
  String email;
  @JsonKey(name: 'fullname')
  String fullName;
  @JsonKey(name: 'jobtitle')
  String jobTitle;
  String parent;
  String phone;
  String pic;
  String type;
  String user;

  UserInfo(this.countryCode, this.email, this.fullName, this.jobTitle,
      this.parent, this.phone, this.pic, this.type, this.user);

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@JsonSerializable()
class TokenInfo {
  @JsonKey(name: 'created_microtime')
  String createdMicrotime;
  @JsonKey(name: 'created_time')
  String createdTime;
  @JsonKey(name: 'expire_microtime')
  String expireMicrotime;
  @JsonKey(name: 'expire_time')
  String expireTime;
  String token;
  String user;

  TokenInfo(this.createdMicrotime, this.createdTime, this.expireMicrotime,
      this.expireTime, this.token, this.user);

  factory TokenInfo.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoFromJson(json);
}

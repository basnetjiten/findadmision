import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';
@JsonSerializable()
class SignUpResponse {
  String status;
  String message;
  String nextpage;

  SignUpResponse(this.status, this.message, this.nextpage);
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}

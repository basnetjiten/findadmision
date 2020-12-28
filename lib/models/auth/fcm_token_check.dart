import 'package:json_annotation/json_annotation.dart';
part 'fcm_token_check.g.dart';
@JsonSerializable()
class FcmTokenCheckResponse {
  @JsonKey(name: 'loadpremium')
  bool loadPremium;
  String message;
  @JsonKey(name: 'noticount')
  int notiCount;
  @JsonKey(name: 'notilist')
  List<dynamic> notiList;
  @JsonKey(name: 'pchatcount')
  int pChatCount;
  @JsonKey(name: 'runningev')
  List<dynamic> runningEV;
  String status;
  @JsonKey(name: 'tchatcount')
  int tChatCount;
  @JsonKey(name: 'tnoticount')
  int tNotiCount;
  bool waiting;

  FcmTokenCheckResponse(
      this.loadPremium,
      this.message,
      this.notiCount,
      this.notiList,
      this.pChatCount,
      this.runningEV,
      this.status,
      this.tChatCount,
      this.tNotiCount,
      this.waiting);

  factory FcmTokenCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenCheckResponseFromJson(json);

}
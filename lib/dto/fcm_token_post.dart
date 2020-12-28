import 'package:json_annotation/json_annotation.dart';
part 'fcm_token_post.g.dart';
@JsonSerializable()
class FcmTokenPostData{
String firebasetoken,appversion;
FcmTokenPostData({this.firebasetoken,this.appversion});

Map<String, dynamic> toJson() => _$FcmTokenPostDataToJson(this);
}
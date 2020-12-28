import 'package:json_annotation/json_annotation.dart';

part 'setting.g.dart';

@JsonSerializable()
class SettingLoadRes {
  String status;
  @JsonKey(name: 'partnerdet')
  Map<String, String> partnerDet;

  SettingLoadRes(this.status, this.partnerDet);

  factory SettingLoadRes.fromJson(Map<String, dynamic> json) =>
      _$SettingLoadResFromJson(json);

  Map<String, dynamic> toJson() => _$SettingLoadResToJson(this);
}

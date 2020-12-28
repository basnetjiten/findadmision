import 'dart:convert';

StepOneApplyRes stepOneApplyResFromJson(String str) => StepOneApplyRes.fromJson(json.decode(str));

String stepOneApplyResToJson(StepOneApplyRes data) => json.encode(data.toJson());

class StepOneApplyRes {
  StepOneApplyRes({
    this.gonext,
    this.msg,
  });

  bool gonext;
  String msg;

  factory StepOneApplyRes.fromJson(Map<String, dynamic> json) => StepOneApplyRes(
    gonext: json["gonext"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "gonext": gonext,
    "msg": msg,
  };
}
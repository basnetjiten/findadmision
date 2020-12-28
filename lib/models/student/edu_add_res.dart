import 'dart:convert';

EduAddedRes submitSuccessFromJson(String str) =>
    EduAddedRes.fromJson(json.decode(str));

String submitSuccessToJson(EduAddedRes data) => json.encode(data.toJson());

class EduAddedRes {
  EduAddedRes({
    this.havefund,
    this.status,
    this.message,
  });

  bool havefund;
  String status;
  String message;

  factory EduAddedRes.fromJson(Map<String, dynamic> json) => EduAddedRes(
    havefund: json["havefund"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "havefund": havefund,
        "status": status,
        "message": message,
      };
}

import 'dart:convert';

SubmitSuccess submitSuccessFromJson(String str) =>
    SubmitSuccess.fromJson(json.decode(str));

String submitSuccessToJson(SubmitSuccess data) => json.encode(data.toJson());

class SubmitSuccess {
  SubmitSuccess({
    this.haveprogramme,
    this.status,
    this.message,
  });

  bool haveprogramme;
  String status;
  String message;

  factory SubmitSuccess.fromJson(Map<String, dynamic> json) => SubmitSuccess(
        haveprogramme: json["haveprogramme"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "haveprogramme": haveprogramme,
        "status": status,
        "message": message,
      };
}

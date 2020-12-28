import 'dart:convert';

WorkExpRes workExpResFromJson(String str) =>
    WorkExpRes.fromJson(json.decode(str));

String workExpResToJson(WorkExpRes data) => json.encode(data.toJson());

class WorkExpRes {
  WorkExpRes({
    this.status,
    this.message,
    this.secor,
  });

  String status;
  String message;
  List<Secor> secor;

  factory WorkExpRes.fromJson(Map<String, dynamic> json) => WorkExpRes(
        status: json["status"],
        message: json["message"],
        secor: List<Secor>.from(json["secor"].map((x) => Secor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "secor": List<dynamic>.from(secor.map((x) => x.toJson())),
      };
}

class Secor {
  Secor({
    this.workexpId,
    this.workexpMember,
    this.workexpCompany,
    this.workexpPosition,
    this.workexpFrom,
    this.workexpTo,
  });

  String workexpId;
  String workexpMember;
  String workexpCompany;
  String workexpPosition;
  String workexpFrom;
  String workexpTo;

  factory Secor.fromJson(Map<String, dynamic> json) => Secor(
        workexpId: json["workexp_id"],
        workexpMember: json["workexp_member"],
        workexpCompany: json["workexp_company"],
        workexpPosition: json["workexp_position"],
        workexpFrom: json["workexp_from"],
        workexpTo: json["workexp_to"],
      );

  Map<String, dynamic> toJson() => {
        "workexp_id": workexpId,
        "workexp_member": workexpMember,
        "workexp_company": workexpCompany,
        "workexp_position": workexpPosition,
        "workexp_from": workexpFrom,
        "workexp_to": workexpTo,
      };
}

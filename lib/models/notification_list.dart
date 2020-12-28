
class NotificationListRes {
  NotificationListRes({
    this.status,
    this.totalresult,
    this.notilist,
  });

  String status;
  int totalresult;
  List<Notilist> notilist;

  factory NotificationListRes.fromJson(Map<String, dynamic> json) => NotificationListRes(
    status: json["status"],
    totalresult: json["totalresult"],
    notilist: List<Notilist>.from(json["notilist"].map((x) => Notilist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalresult": totalresult,
    "notilist": List<dynamic>.from(notilist.map((x) => x.toJson())),
  };
}

class Notilist {
  Notilist({
    this.partnernotificationId,
    this.partnernotificationText,
    this.partnernotificationUri,
    this.partnernotificationTime,
    this.partnernotificationPagetype,
    this.partnernotificationPageid,
    this.partnernotificationInstituteid,
    this.partnernotificationStudentid,
    this.partnernotificationSeen,
  });

  String partnernotificationId;
  String partnernotificationText;
  String partnernotificationUri;
  String partnernotificationTime;
  String partnernotificationPagetype;
  String partnernotificationPageid;
  String partnernotificationInstituteid;
  String partnernotificationStudentid;
  bool partnernotificationSeen;

  factory Notilist.fromJson(Map<String, dynamic> json) => Notilist(
    partnernotificationId: json["partnernotification_id"],
    partnernotificationText: json["partnernotification_text"],
    partnernotificationUri: json["partnernotification_uri"],
    partnernotificationTime: json["partnernotification_time"],
    partnernotificationPagetype: json["partnernotification_pagetype"],
    partnernotificationPageid: json["partnernotification_pageid"],
    partnernotificationInstituteid: json["partnernotification_instituteid"],
    partnernotificationStudentid: json["partnernotification_studentid"],
    partnernotificationSeen: json["partnernotification_seen"],
  );

  Map<String, dynamic> toJson() => {
    "partnernotification_id": partnernotificationId,
    "partnernotification_text": partnernotificationText,
    "partnernotification_uri": partnernotificationUri,
    "partnernotification_time": partnernotificationTime,
    "partnernotification_pagetype": partnernotificationPagetype,
    "partnernotification_pageid": partnernotificationPageid,
    "partnernotification_instituteid": partnernotificationInstituteid,
    "partnernotification_studentid": partnernotificationStudentid,
    "partnernotification_seen": partnernotificationSeen,
  };
}




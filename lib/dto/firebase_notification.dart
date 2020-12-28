class FirebaseNotification {
  FirebaseNotification({
    this.studentid,
    this.instituteid,
    this.pageid,
    this.pushtype,
  });

  String studentid;
  String instituteid;
  String pageid;
  String pushtype;

  factory FirebaseNotification.fromJson(Map<String, dynamic> json) =>
      FirebaseNotification(
        studentid: json["studentid"],
        instituteid: json["instituteid"],
        pageid: json["pageid"],
        pushtype: json["pushtype"],
      );

  Map<String, dynamic> toJson() => {
        "studentid": studentid,
        "instituteid": instituteid,
        "pageid": pageid,
        "pushtype": pushtype,
      };
}

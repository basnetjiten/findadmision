class StdCourseApplyRes {
  StdCourseApplyRes({
    this.havecourse,
    this.status,
    this.message,
  });

  bool havecourse;
  String status;
  String message;

  factory StdCourseApplyRes.fromJson(Map<String, dynamic> json) =>
      StdCourseApplyRes(
        havecourse: json["havecourse"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "havecourse": havecourse,
        "status": status,
        "message": message,
      };
}


import 'dart:convert';

FirstStepRes firstStepResFromJson(String str) => FirstStepRes.fromJson(json.decode(str));

String firstStepResToJson(FirstStepRes data) => json.encode(data.toJson());

class FirstStepRes {
  FirstStepRes({
    this.haveprogramme,
    this.status,
    this.message,
    this.dep,
  });

  bool haveprogramme;
  String status;
  String message;
  List<Dep> dep;

  factory FirstStepRes.fromJson(Map<String, dynamic> json) => FirstStepRes(
    haveprogramme: json["haveprogramme"],
    status: json["status"],
    message: json["message"],
    dep: List<Dep>.from(json["dep"].map((x) => Dep.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "haveprogramme": haveprogramme,
    "status": status,
    "message": message,
    "dep": List<dynamic>.from(dep.map((x) => x.toJson())),
  };
}

class Dep {
  Dep({
    this.id,
    this.name,
    this.course,
  });

  String id;
  String name;
  List<Course> course;

  factory Dep.fromJson(Map<String, dynamic> json) => Dep(
    id: json["id"],
    name: json["name"],
    course: List<Course>.from(json["course"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "course": List<dynamic>.from(course.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    this.id,
    this.name,
    this.selected,
  });

  String id;
  String name;
  bool selected;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    name: json["name"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "selected": selected,
  };
}

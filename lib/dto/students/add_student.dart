// To parse this JSON data, do
//
//     final addStudentDto = addStudentDtoFromJson(jsonString);

import 'dart:convert';

AddStudentDto addStudentDtoFromJson(String str) => AddStudentDto.fromJson(json.decode(str));

String addStudentDtoToJson(AddStudentDto data) => json.encode(data.toJson());

class AddStudentDto {
  AddStudentDto({
    this.fname,
    this.lname,
    this.studentcountry,
    this.studentgender,
    this.selecteddays,
    this.selectedmonths,
    this.selectedyears,
  });

  String fname;
  String lname;
  String studentcountry;
  String studentgender;
  String selecteddays;
  String selectedmonths;
  String selectedyears;

  factory AddStudentDto.fromJson(Map<String, dynamic> json) => AddStudentDto(
    fname: json["fname"],
    lname: json["lname"],
    studentcountry: json["studentcountry"],
    studentgender: json["studentgender"],
    selecteddays: json["selecteddays"],
    selectedmonths: json["selectedmonths"],
    selectedyears: json["selectedyears"],
  );

  Map<String, dynamic> toJson() => {
    "fname": fname,
    "lname": lname,
    "studentcountry": studentcountry,
    "studentgender": studentgender,
    "selecteddays": selecteddays,
    "selectedmonths": selectedmonths,
    "selectedyears": selectedyears,
  };
}

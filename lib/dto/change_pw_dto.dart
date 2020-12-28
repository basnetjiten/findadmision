import 'dart:convert';

class ChangePwDto {
  ChangePwDto({
    this.newpass,
    this.oldpass,
  });

  String newpass;
  String oldpass;

  factory ChangePwDto.fromJson(Map<String, dynamic> json) => ChangePwDto(
    newpass: json["newpass"],
    oldpass: json["oldpass"],
  );

  Map<String, dynamic> toJson() => {
    "newpass": newpass,
    "oldpass": oldpass,
  };
}
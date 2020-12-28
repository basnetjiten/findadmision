
import 'dart:convert';

import 'package:equatable/equatable.dart';


String applyCourseResToJson(ApplyCourseDto data) => json.encode(data.toJson());

class ApplyCourseDto extends Equatable{
  ApplyCourseDto({
    this.id,
    this.name,
    this.dep,}
  );

  final String id;
  final String name;
  final String dep;



  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "dep": dep,
  };

  factory ApplyCourseDto.fromJson(Map<String, dynamic> json) => ApplyCourseDto(
    id: json["id"],
    name: json["name"],
    dep: json["dep"],

  );


  @override

  List<Object> get props => [id,name,dep];
}

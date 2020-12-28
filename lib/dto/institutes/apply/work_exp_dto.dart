import 'dart:convert';

String workExpDtoToJson(WorkExpDto data) => json.encode(data.toJson());

class WorkExpDto {
  WorkExpDto();

  String companyname;
  int fromy;
  String position;
  int toy;
  String id;
  String studentId;

  Map<String, dynamic> toJson() => {
        "companyname": companyname,
        "fromy": fromy,
        "position": position,
        "toy": toy,
      };
}

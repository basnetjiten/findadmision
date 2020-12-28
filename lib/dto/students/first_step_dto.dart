import 'package:findadmissionaffiliate/models/student/std_load_data.dart';

class FirstStepDto {
  FirstStepDto({
    this.countryinsert,
    this.endbudgt,
    this.level,
    this.startbudgt,
    this.startdate,
  });

  List<StudentCountry> countryinsert;
  int endbudgt;
  String level;
  int startbudgt;
  String startdate;

  factory FirstStepDto.fromJson(Map<String, dynamic> json) => FirstStepDto(
        countryinsert: List<StudentCountry>.from(
            json["countryinsert"].map((x) => StudentCountry.fromJson(x))),
        endbudgt: json["endbudgt"],
        level: json["level"],
        startbudgt: json["startbudgt"],
        startdate: json["startdate"],
      );

  Map<String, dynamic> toJson() => {
        "countryinsert":
            List<dynamic>.from(countryinsert.map((x) => x.toJson())),
        "endbudgt": endbudgt,
        "level": level,
        "startbudgt": startbudgt,
        "startdate": startdate,
      };
}

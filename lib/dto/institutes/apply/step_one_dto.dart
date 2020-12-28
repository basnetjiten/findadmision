
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/institute/loaddata_label.dart';
class StepOneDto {
  StepOneDto({
    this.selected,
    this.sponcorfname,
    this.sponcorlname,
    this.sponcortelephone,
    this.sponcoremail,
    this.govtfundev,
    this.govtfundapplied,
    this.fundingdescription,
    this.surname,
    this.othername,
    this.selectedstartdate,
    this.homeaddress,
    this.passport,
  });

  String selected;
  String sponcorfname;
  String sponcorlname;
  String sponcortelephone;
  String sponcoremail;
  String govtfundev;
  String govtfundapplied;
  String fundingdescription;
  String surname;
  String othername;
  String selectedstartdate;
  String homeaddress;
  String passport;
  //non json data
  String levelDegreeId;
  Instapolicy instapolicy;
  Funding fund;
  InstDetailStartDate startDate;

  factory StepOneDto.fromJson(Map<String, dynamic> json) => StepOneDto(
    selected: json["selected"],
    sponcorfname: json["sponcorfname"],
    sponcorlname: json["sponcorlname"],
    sponcortelephone: json["sponcortelephone"],
    sponcoremail: json["sponcoremail"],
    govtfundev: json["govtfundev"],
    govtfundapplied: json["govtfundapplied"],
    fundingdescription: json["fundingdescription"],
    surname: json["surname"],
    othername: json["othername"],
    selectedstartdate: json["selectedstartdate"],
    homeaddress: json["homeaddress"],
    passport: json["passport"],
  );

  Map<String, dynamic> toJson() => {
    "selected": selected,
    "sponcorfname": sponcorfname,
    "sponcorlname": sponcorlname,
    "sponcortelephone": sponcortelephone,
    "sponcoremail": sponcoremail,
    "govtfundev": govtfundev,
    "govtfundapplied": govtfundapplied,
    "fundingdescription": fundingdescription,
    "surname": surname,
    "othername": othername,
    "selectedstartdate": selectedstartdate,
    "homeaddress": homeaddress,
    "passport": passport,
  };
}

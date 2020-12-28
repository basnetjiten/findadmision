
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';

class StepTwoFundingDto {
  StepTwoFundingDto({
    this.fundingdescription,
    this.govtfundapplied,
    this.govtfundev,
    this.homeaddress,
    this.needvisa,
    this.othername,
    this.passport,
    this.refusedvisa,
    this.scholammount,
    this.selected,
    this.sponcoremail,
    this.sponcorfname,
    this.sponcorlname,
    this.sponcortelephone,
    this.sponsorwho,
    this.surname,
  });

  String fundingdescription;
  String govtfundapplied;
  String govtfundev;
  String homeaddress;
  String needvisa;
  String othername;
  String passport;
  String refusedvisa;
  String scholammount;
  String selected;
  String sponcoremail;
  String sponcorfname;
  String sponcorlname;
  String sponcortelephone;
  String sponsorwho;
  String surname;

  Degree degree;
  Funding fund;
  Startdate startDate;
  factory StepTwoFundingDto.fromJson(Map<String, dynamic> json) => StepTwoFundingDto(
    fundingdescription: json["fundingdescription"],
    govtfundapplied: json["govtfundapplied"],
    govtfundev: json["govtfundev"],
    homeaddress: json["homeaddress"],
    needvisa: json["needvisa"],
    othername: json["othername"],
    passport: json["passport"],
    refusedvisa: json["refusedvisa"],
    scholammount: json["scholammount"],
    selected: json["selected"],
    sponcoremail: json["sponcoremail"],
    sponcorfname: json["sponcorfname"],
    sponcorlname: json["sponcorlname"],
    sponcortelephone: json["sponcortelephone"],
    sponsorwho: json["sponsorwho"],
    surname: json["surname"],
  );

  Map<String, dynamic> toJson() => {
    "fundingdescription": fundingdescription,
    "govtfundapplied": govtfundapplied,
    "govtfundev": govtfundev,
    "homeaddress": homeaddress,
    "needvisa": needvisa,
    "othername": othername,
    "passport": passport,
    "refusedvisa": refusedvisa,
    "scholammount": scholammount,
    "selected": selected,
    "sponcoremail": sponcoremail,
    "sponcorfname": sponcorfname,
    "sponcorlname": sponcorlname,
    "sponcortelephone": sponcortelephone,
    "sponsorwho": sponsorwho,
    "surname": surname,
  };
}

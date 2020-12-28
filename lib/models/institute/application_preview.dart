// To parse this JSON data, do
//
//     final applicationPreview = applicationPreviewFromJson(jsonString);

import 'dart:convert';

ApplicationPreview applicationPreviewFromJson(String str) => ApplicationPreview.fromJson(json.decode(str));

String applicationPreviewToJson(ApplicationPreview data) => json.encode(data.toJson());

class ApplicationPreview {
  ApplicationPreview({
    this.status,
    this.sellevel,
    this.applyfaze,
    this.fundingdata,
  });

  String status;
  String sellevel;
  String applyfaze;
  Fundingdata fundingdata;

  factory ApplicationPreview.fromJson(Map<String, dynamic> json) => ApplicationPreview(
    status: json["status"],
    sellevel: json["sellevel"],
    applyfaze: json["applyfaze"],
    fundingdata: Fundingdata.fromJson(json["fundingdata"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "sellevel": sellevel,
    "applyfaze": applyfaze,
    "fundingdata": fundingdata.toJson(),
  };
}

class Fundingdata {
  Fundingdata({
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
    this.currsign,
    this.budget,
    this.applicationfee,
    this.scholammount,
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
  String currsign;
  String budget;
  String applicationfee;
  String scholammount;
  String homeaddress;
  String passport;

  factory Fundingdata.fromJson(Map<String, dynamic> json) => Fundingdata(
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
    currsign: json["currsign"],
    budget: json["budget"],
    applicationfee: json["applicationfee"],
    scholammount: json["scholammount"],
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
    "currsign": currsign,
    "budget": budget,
    "applicationfee": applicationfee,
    "scholammount": scholammount,
    "homeaddress": homeaddress,
    "passport": passport,
  };
}

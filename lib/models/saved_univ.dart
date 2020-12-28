
import 'package:findadmissionaffiliate/models/univ.dart';

class SavedUnivList {
  SavedUnivList({
    this.status,
    this.instidarray,
    this.match,
  });

  String status;
  List<String> instidarray;
  List<Match> match;

  factory SavedUnivList.fromJson(Map<String, dynamic> json) => SavedUnivList(
    status: json["status"],
    instidarray: List<String>.from(json["instidarray"].map((x) => x)),
    match: List<Match>.from(json["match"].map((x) => Match.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "instidarray": List<dynamic>.from(instidarray.map((x) => x)),
    "match": List<dynamic>.from(match.map((x) => x.toJson())),
  };
}



class Allfee {
  Allfee({
    this.applicationfee,
    this.sellingpoint,
    this.name,
    this.budgetstart,
    this.budgetend,
    this.budget,
    this.budgetsel,
    this.budgetselarr,
  });

  String applicationfee;
  String sellingpoint;
  String name;
  int budgetstart;
  int budgetend;
  String budget;
  String budgetsel;
  Budgetselarr budgetselarr;

  factory Allfee.fromJson(Map<String, dynamic> json) => Allfee(
    applicationfee: json["applicationfee"],
    sellingpoint: json["sellingpoint"],
    name: json["name"],
    budgetstart: json["budgetstart"],
    budgetend: json["budgetend"],
    budget: json["budget"],
    budgetsel: json["budgetsel"],
    budgetselarr: Budgetselarr.fromJson(json["budgetselarr"]),
  );

  Map<String, dynamic> toJson() => {
    "applicationfee": applicationfee,
    "sellingpoint": sellingpoint,
    "name": name,
    "budgetstart": budgetstart,
    "budgetend": budgetend,
    "budget": budget,
    "budgetsel": budgetsel,
    "budgetselarr": budgetselarr.toJson(),
  };
}

class Budgetselarr {
  Budgetselarr({
    this.id,
    this.base,
    this.text,
  });

  String id;
  int base;
  String text;

  factory Budgetselarr.fromJson(Map<String, dynamic> json) => Budgetselarr(
    id: json["id"],
    base: json["base"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "base": base,
    "text": text,
  };
}

enum Dayremainingtype { DAYS }

final dayremainingtypeValues = EnumValues({
  "days": Dayremainingtype.DAYS
});

enum Degreeselected { NONE }

final degreeselectedValues = EnumValues({
  "none": Degreeselected.NONE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

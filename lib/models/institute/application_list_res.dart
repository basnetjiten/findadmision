
class ApplicationListRes {
  ApplicationListRes({
    this.status,
    this.match,
    this.studentname,
    this.countryname,
    this.pictureurl,
    this.degree,
    this.getlang,
  });

  String status;
  List<ApplicationMatch> match;
  String studentname;
  String countryname;
  String pictureurl;
  List<Degree> degree;
  Getlang getlang;

  factory ApplicationListRes.fromJson(Map<String, dynamic> json) => ApplicationListRes(
    status: json["status"],
    match: List<ApplicationMatch>.from(json["match"].map((x) => ApplicationMatch.fromJson(x))),
    studentname: json["studentname"],
    countryname: json["countryname"],
    pictureurl: json["pictureurl"],
    degree: List<Degree>.from(json["degree"].map((x) => Degree.fromJson(x))),
    getlang: Getlang.fromJson(json["getlang"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "match": List<dynamic>.from(match.map((x) => x.toJson())),
    "studentname": studentname,
    "countryname": countryname,
    "pictureurl": pictureurl,
    "degree": List<dynamic>.from(degree.map((x) => x.toJson())),
    "getlang": getlang.toJson(),
  };
}

class Degree {
  Degree({
    this.degreeId,
    this.degreeName,
    this.degreeTitle,
    this.degreeStatus,
  });

  String degreeId;
  String degreeName;
  String degreeTitle;
  String degreeStatus;

  factory Degree.fromJson(Map<String, dynamic> json) => Degree(
    degreeId: json["degree_id"],
    degreeName: json["degree_name"],
    degreeTitle: json["degree_title"],
    degreeStatus: json["degree_status"],
  );

  Map<String, dynamic> toJson() => {
    "degree_id": degreeId,
    "degree_name": degreeName,
    "degree_title": degreeTitle,
    "degree_status": degreeStatus,
  };
}

class Getlang {
  Getlang({
    this.name,
    this.moduletext,
  });

  String name;
  Map<String, Map<String, String>> moduletext;

  factory Getlang.fromJson(Map<String, dynamic> json) => Getlang(
    name: json["name"],
    moduletext: Map.from(json["moduletext"]).map((k, v) => MapEntry<String, Map<String, String>>(k, Map.from(v).map((k, v) => MapEntry<String, String>(k, v)))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "moduletext": Map.from(moduletext).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
  };
}

class ApplicationMatch {
  ApplicationMatch({
    this.id,
    this.name,
    this.pic,
    this.countryid,
    this.country,
    this.currname,
    this.appid,
    this.accepted,
    this.faze,
    this.paymenttype,
    this.offered,
    this.reqdatastatus,
    this.rejected,
    this.holded,
    this.comment,
    this.degreelist,
    this.intakelist,
    this.nextintake,
    this.secleft,
    this.seatleft,
    this.dayremainingtext,
    this.dayremainingtype,
    this.budgetstart,
    this.budgetend,
    this.applicationfee,
    this.applimmount,
    this.stateid,
    this.cityid,
    this.cityname,
    this.statename,
    this.wishlist,
    this.myapplicationfee,
    this.mydegreename,
    this.mybudget,
    this.degreeselected,
    this.allfees,
    this.checkingnow,
  });

  String id;
  String name;
  String pic;
  String countryid;
  String country;
  String currname;
  String appid;
  String accepted;
  String faze;
  Paymenttype paymenttype;
  String offered;
  String reqdatastatus;
  String rejected;
  String holded;
  String comment;
  List<dynamic> degreelist;
  List<dynamic> intakelist;
  int nextintake;
  int secleft;
  int seatleft;
  int dayremainingtext;
  Dayremainingtype dayremainingtype;
  int budgetstart;
  String budgetend;
  String applicationfee;
  String applimmount;
  String stateid;
  String cityid;
  String cityname;
  String statename;
  bool wishlist;
  String myapplicationfee;
  String mydegreename;
  String mybudget;
  Degreeselected degreeselected;
  List<Allfee> allfees;
  int checkingnow;

  factory ApplicationMatch.fromJson(Map<String, dynamic> json) => ApplicationMatch(
    id: json["id"],
    name: json["name"],
    pic: json["pic"],
    countryid: json["countryid"],
    country: json["country"],
    currname: json["currname"],
    appid: json["appid"],
    accepted: json["accepted"],
    faze: json["faze"],
    paymenttype: paymenttypeValues.map[json["paymenttype"]],
    offered: json["offered"],
    reqdatastatus: json["reqdatastatus"],
    rejected: json["rejected"],
    holded: json["holded"],
    comment: json["comment"],
    degreelist: json["degreelist"],
    intakelist: List<String>.from(json["intakelist"].map((x) => x)),
    nextintake: json["nextintake"],
    secleft: json["secleft"],
    seatleft: json["seatleft"],
    dayremainingtext: json["dayremainingtext"],
    dayremainingtype: dayremainingtypeValues.map[json["dayremainingtype"]],
    budgetstart: json["budgetstart"],
    budgetend: json["budgetend"],
    applicationfee: json["applicationfee"],
    applimmount: json["applimmount"],
    stateid: json["stateid"],
    cityid: json["cityid"],
    cityname: json["cityname"],
    statename: json["statename"],
    wishlist: json["wishlist"],
    myapplicationfee: json["myapplicationfee"],
    mydegreename:json["mydegreename"],
    mybudget: json["mybudget"],
    degreeselected: degreeselectedValues.map[json["degreeselected"]],
    allfees: List<Allfee>.from(json["allfees"].map((x) => Allfee.fromJson(x))),
    checkingnow: json["checkingnow"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "pic": pic,
    "countryid": countryid,
    "country": country,
    "currname": currname,
    "appid": appid,
    "accepted": accepted,
    "faze": faze,
    "paymenttype": paymenttypeValues.reverse[paymenttype],
    "offered": offered,
    "reqdatastatus": reqdatastatus,
    "rejected": rejected,
    "holded": holded,
    "comment": comment,
    "degreelist":degreelist,
    "intakelist":intakelist,
    "nextintake": nextintake,
    "secleft": secleft,
    "seatleft": seatleft,
    "dayremainingtext": dayremainingtext,
    "dayremainingtype": dayremainingtypeValues.reverse[dayremainingtype],
    "budgetstart": budgetstart,
    "budgetend": budgetend,
    "applicationfee": applicationfee,
    "applimmount": applimmount,
    "stateid": stateid,
    "cityid": cityid,
    "cityname": cityname,
    "statename": statename,
    "wishlist": wishlist,
    "myapplicationfee": myapplicationfee,
    "mydegreename": mydegreename,
    "mybudget": mybudget,
    "degreeselected": degreeselectedValues.reverse[degreeselected],
    "allfees": List<dynamic>.from(allfees.map((x) => x.toJson())),
    "checkingnow": checkingnow,
  };
}

class Allfee {
  Allfee({
    this.applicationfee,
    this.name,
    this.budget,
  });

  String applicationfee;
  String name;
  String budget;

  factory Allfee.fromJson(Map<String, dynamic> json) => Allfee(
    applicationfee: json["applicationfee"],
    name: json["name"],
    budget: json["budget"],
  );

  Map<String, dynamic> toJson() => {
    "applicationfee": applicationfee,
    "name":name,
    "budget": budget,
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

enum Paymenttype { FREE, EMPTY }

final paymenttypeValues = EnumValues({
  "": Paymenttype.EMPTY,
  "free": Paymenttype.FREE
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

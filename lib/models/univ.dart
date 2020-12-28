// To parse this JSON data, do
//
//     final univFilterResponse = univFilterResponseFromJson(jsonString);

import 'dart:convert';

UnivFilterResponse univFilterResponseFromJson(String str) => UnivFilterResponse.fromJson(json.decode(str));

String univFilterResponseToJson(UnivFilterResponse data) => json.encode(data.toJson());

class UnivFilterResponse {
  UnivFilterResponse({
    this.status,
    this.startdates,
    this.activecountry,
    this.month,
    this.citylist,
    this.statelist,
    this.gender,
    this.year,
    this.day,
    this.budgetlist,
    this.budgetlistarr,
    this.country,
    this.programmeid,
    this.selectedcountry,
    this.degree,
    this.match,
    this.allinstitutesname,
    this.getlang,
  });

  String status;
  List<Startdate> startdates;
  List<Activecountry> activecountry;
  List<List<String>> month;
  List<CitylistElement> citylist;
  List<CitylistElement> statelist;
  List<List<String>> gender;
  List<List<int>> year;
  List<List<int>> day;
  List<String> budgetlist;
  List<Budgetarr> budgetlistarr;
  List<Country> country;
  String programmeid;
  List<dynamic> selectedcountry;
  List<Degree> degree;
  List<Match> match;
  List<dynamic> allinstitutesname;
  Getlang getlang;

  factory UnivFilterResponse.fromJson(Map<String, dynamic> json) => UnivFilterResponse(
    status: json["status"],
    startdates: List<Startdate>.from(json["startdates"].map((x) => Startdate.fromJson(x))),
    activecountry: List<Activecountry>.from(json["activecountry"].map((x) => Activecountry.fromJson(x))),
    month: List<List<String>>.from(json["month"].map((x) => List<String>.from(x.map((x) => x)))),
    citylist: List<CitylistElement>.from(json["citylist"].map((x) => CitylistElement.fromJson(x))),
    statelist: List<CitylistElement>.from(json["statelist"].map((x) => CitylistElement.fromJson(x))),
    gender: List<List<String>>.from(json["gender"].map((x) => List<String>.from(x.map((x) => x)))),
    year: List<List<int>>.from(json["year"].map((x) => List<int>.from(x.map((x) => x)))),
    day: List<List<int>>.from(json["day"].map((x) => List<int>.from(x.map((x) => x)))),
    budgetlist: List<String>.from(json["budgetlist"].map((x) => x)),
    budgetlistarr: List<Budgetarr>.from(json["budgetlistarr"].map((x) => Budgetarr.fromJson(x))),
    country: List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
    programmeid: json["programmeid"],
    selectedcountry: List<dynamic>.from(json["selectedcountry"].map((x) => x)),
    degree: List<Degree>.from(json["degree"].map((x) => Degree.fromJson(x))),
    match: List<Match>.from(json["match"].map((x) => Match.fromJson(x))),
    allinstitutesname: List<dynamic>.from(json["allinstitutesname"].map((x) => x)),
    getlang: Getlang.fromJson(json["getlang"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "startdates": List<dynamic>.from(startdates.map((x) => x.toJson())),
    "activecountry": List<dynamic>.from(activecountry.map((x) => x.toJson())),
    "month": List<dynamic>.from(month.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "citylist": List<dynamic>.from(citylist.map((x) => x.toJson())),
    "statelist": List<dynamic>.from(statelist.map((x) => x.toJson())),
    "gender": List<dynamic>.from(gender.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "year": List<dynamic>.from(year.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "day": List<dynamic>.from(day.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "budgetlist": List<dynamic>.from(budgetlist.map((x) => x)),
    "budgetlistarr": List<dynamic>.from(budgetlistarr.map((x) => x.toJson())),
    "country": List<dynamic>.from(country.map((x) => x.toJson())),
    "programmeid": programmeid,
    "selectedcountry": List<dynamic>.from(selectedcountry.map((x) => x)),
    "degree": List<dynamic>.from(degree.map((x) => x.toJson())),
    "match": List<dynamic>.from(match.map((x) => x.toJson())),
    "allinstitutesname": List<dynamic>.from(allinstitutesname.map((x) => x)),
    "getlang": getlang.toJson(),
  };
}

class Activecountry {
  Activecountry({
    this.countryId,
    this.countryName,
    this.countryShortcode,
    this.countryDialingcode,
  });

  String countryId;
  String countryName;
  String countryShortcode;
  String countryDialingcode;

  factory Activecountry.fromJson(Map<String, dynamic> json) => Activecountry(
    countryId: json["country_id"],
    countryName: json["country_name"],
    countryShortcode: json["country_shortcode"],
    countryDialingcode: json["country_dialingcode"],
  );

  Map<String, dynamic> toJson() => {
    "country_id": countryId,
    "country_name": countryName,
    "country_shortcode": countryShortcode,
    "country_dialingcode": countryDialingcode,
  };
}

class Budgetarr {
  Budgetarr({
    this.id,
    this.base,
    this.text,
  });

  String id;
  int base;
  String text;

  factory Budgetarr.fromJson(Map<String, dynamic> json) => Budgetarr(
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

class CitylistElement {
  CitylistElement({
    this.id,
    this.name,
    this.country,
    this.state,
  });

  String id;
  String name;
  String country;
  String state;

  factory CitylistElement.fromJson(Map<String, dynamic> json) => CitylistElement(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    state: json["state"] == null ? null : json["state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country,
    "state": state == null ? null : state,
  };
}

class Country {
  Country({
    this.id,
    this.name,
    this.ex,
    this.currencycode,
    this.currname,
  });

  String id;
  String name;
  String ex;
  String currencycode;
  CountryCurrname currname;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    ex: json["ex"],
    currencycode: json["currencycode"],
    currname: countryCurrnameValues.map[json["currname"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "ex": ex,
    "currencycode": currencycode,
    "currname": countryCurrnameValues.reverse[currname],
  };
}

enum CountryCurrname { CANADIAN_DOLLAR, EUROPEAN_EURO, POUND_STERLING, UNITED_STATES_DOLLAR }

final countryCurrnameValues = EnumValues({
  "Canadian Dollar (\u0024)": CountryCurrname.CANADIAN_DOLLAR,
  "European Euro (€)": CountryCurrname.EUROPEAN_EURO,
  "Pound Sterling (£)": CountryCurrname.POUND_STERLING,
  "United States Dollar (\u0024)": CountryCurrname.UNITED_STATES_DOLLAR
});

class Degree {
  Degree({
    this.degreeId,
    this.degreeName,
    this.degreeTitle,
    this.degreeStatus,
  });

  String degreeId;
  String degreeName;
  DegreeTitle degreeTitle;
  String degreeStatus;

  factory Degree.fromJson(Map<String, dynamic> json) => Degree(
    degreeId: json["degree_id"],
    degreeName: json["degree_name"],
    degreeTitle: degreeTitleValues.map[json["degree_title"]],
    degreeStatus: json["degree_status"],
  );

  Map<String, dynamic> toJson() => {
    "degree_id": degreeId,
    "degree_name": degreeName,
    "degree_title": degreeTitleValues.reverse[degreeTitle],
    "degree_status": degreeStatus,
  };
}

enum DegreeTitle { UNDERGRADUATE, GRADUATE, SHORT_COURSES, LANGUAGE_PROGRAMS, POST_SECONDARY_DIPLOMA_OR_CERTIFICATE_PROGRAM, GRADUATE_CERTIFICATE_PROGRAM, ONLINE_UNDERGRADUATE, FOUNDATION_HIGH_SCHOOL_PROGRAMS, ONLINE_POSTGRADUATE, VOCATIONAL_CAREER }

final degreeTitleValues = EnumValues({
  "Foundation / High School Programs": DegreeTitle.FOUNDATION_HIGH_SCHOOL_PROGRAMS,
  "Graduate ": DegreeTitle.GRADUATE,
  "Graduate Certificate Program": DegreeTitle.GRADUATE_CERTIFICATE_PROGRAM,
  "Language Programs ": DegreeTitle.LANGUAGE_PROGRAMS,
  "Online Postgraduate": DegreeTitle.ONLINE_POSTGRADUATE,
  "Online Undergraduate": DegreeTitle.ONLINE_UNDERGRADUATE,
  "Post-Secondary Diploma or Certificate Program": DegreeTitle.POST_SECONDARY_DIPLOMA_OR_CERTIFICATE_PROGRAM,
  "Short Courses": DegreeTitle.SHORT_COURSES,
  "Undergraduate": DegreeTitle.UNDERGRADUATE,
  "Vocational, Career": DegreeTitle.VOCATIONAL_CAREER
});

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

class Match {
  Match({
    this.id,
    this.name,
    this.saved,
    this.pic,
    this.stateid,
    this.cityid,
    this.cityname,
    this.statename,
    this.showing,
    this.countryid,
    this.country,
    this.currname,
    this.degreelist,
    this.degreelistids,
    this.intakelist,
    this.startlist,
    this.startmonlist,
    this.startmonliststr,
    this.nextintake,
    this.secleft,
    this.seatleft,
    this.dayremainingtext,
    this.dayremainingtype,
    this.budgetstart,
    this.budgetend,
    this.applicationfee,
    this.applimmount,
    this.wishlist,
    this.checkingnow,
    this.power,
    this.myapplicationfee,
    this.mydegreename,
    this.mybudget,
    this.degreeselected,
    this.allfees,
  });

  String id;
  String name;
  bool saved;
  String pic;
  String stateid;
  String cityid;
  String cityname;
  String statename;
  bool showing;
  String countryid;
  String country;
  String currname;
  List<String> degreelist;
  List<String> degreelistids;
  List<String> intakelist;
  List<String> startlist;
  List<Startmonlist> startmonlist;
  String startmonliststr;
  int nextintake;
  int secleft;
  int seatleft;
  int dayremainingtext;
  Dayremainingtype dayremainingtype;
  int budgetstart;
  String budgetend;
  String applicationfee;
  String applimmount;
  bool wishlist;
  int checkingnow;
  int power;
  String myapplicationfee;
  DegreeTitle mydegreename;
  String mybudget;
  Degreeselected degreeselected;
  List<Allfee> allfees;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    id: json["id"],
    name: json["name"],
    saved: json["saved"],
    pic: json["pic"],
    stateid: json["stateid"],
    cityid: json["cityid"],
    cityname: json["cityname"],
    statename: json["statename"],
    showing: json["showing"],
    countryid: json["countryid"],
    country: json["country"],
    currname: json["currname"],
    degreelist: List<String>.from(json["degreelist"]),
    degreelistids: List<String>.from(json["degreelistids"].map((x) => x)),
    intakelist: List<String>.from(json["intakelist"].map((x) => x)),
    startlist: List<String>.from(json["startlist"].map((x) => x)),
    startmonlist: List<Startmonlist>.from(json["startmonlist"].map((x) => startmonlistValues.map[x])),
    startmonliststr: json["startmonliststr"],
    nextintake: json["nextintake"],
    secleft: json["secleft"],
    seatleft: json["seatleft"],
    dayremainingtext: json["dayremainingtext"],
    dayremainingtype: dayremainingtypeValues.map[json["dayremainingtype"]],
    budgetstart: json["budgetstart"],
    budgetend: json["budgetend"],
    applicationfee: json["applicationfee"],
    applimmount: json["applimmount"],
    wishlist: json["wishlist"],
    checkingnow: json["checkingnow"],
    power: json["power"],
    myapplicationfee: json["myapplicationfee"],
    mydegreename: degreeTitleValues.map[json["mydegreename"]],
    mybudget: json["mybudget"],
    degreeselected: degreeselectedValues.map[json["degreeselected"]],
    allfees: List<Allfee>.from(json["allfees"].map((x) => Allfee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "saved":saved,
    "pic": pic,
    "stateid": stateid,
    "cityid": cityid,
    "cityname": cityname,
    "statename": statename,
    "showing": showing,
    "countryid": countryid,
    "country": country,
    "currname": currname,
    "degreelist": List<dynamic>.from(degreelist.map((x) => degreeTitleValues.reverse[x])),
    "degreelistids": List<dynamic>.from(degreelistids.map((x) => x)),
    "intakelist": List<dynamic>.from(intakelist.map((x) => x)),
    "startlist": List<dynamic>.from(startlist.map((x) => x)),
    "startmonlist": List<dynamic>.from(startmonlist.map((x) => startmonlistValues.reverse[x])),
    "startmonliststr": startmonliststr,
    "nextintake": nextintake,
    "secleft": secleft,
    "seatleft": seatleft,
    "dayremainingtext": dayremainingtext,
    "dayremainingtype": dayremainingtypeValues.reverse[dayremainingtype],
    "budgetstart": budgetstart,
    "budgetend": budgetend,
    "applicationfee": applicationfee,
    "applimmount": applimmount,
    "wishlist": wishlist,
    "checkingnow": checkingnow,
    "power": power,
    "myapplicationfee": myapplicationfee,
    "mydegreename": degreeTitleValues.reverse[mydegreename],
    "mybudget": mybudget,
    "degreeselected": degreeselectedValues.reverse[degreeselected],
    "allfees": List<dynamic>.from(allfees.map((x) => x.toJson())),
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
  Budgetarr budgetselarr;

  factory Allfee.fromJson(Map<String, dynamic> json) => Allfee(
    applicationfee: json["applicationfee"],
    sellingpoint: json["sellingpoint"],
    name: json["name"],
    budgetstart: json["budgetstart"],
    budgetend: json["budgetend"],
    budget: json["budget"],
    budgetsel: json["budgetsel"],
    budgetselarr: Budgetarr.fromJson(json["budgetselarr"]),
  );

  Map<String, dynamic> toJson() => {
    "applicationfee": applicationfee,
    "sellingpoint": sellingpoint,
    "name": degreeTitleValues.reverse[name],
    "budgetstart": budgetstart,
    "budgetend": budgetend,
    "budget": budget,
    "budgetsel": budgetsel,
    "budgetselarr": budgetselarr.toJson(),
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

enum Startmonlist { FEB, JUN, SEP, JAN, MAY, MAR, OCT, APR, JUL, AUG, NOV, DEC }

final startmonlistValues = EnumValues({
  "Apr": Startmonlist.APR,
  "Aug": Startmonlist.AUG,
  "Dec": Startmonlist.DEC,
  "Feb": Startmonlist.FEB,
  "Jan": Startmonlist.JAN,
  "Jul ": Startmonlist.JUL,
  "Jun": Startmonlist.JUN,
  "Mar": Startmonlist.MAR,
  "May": Startmonlist.MAY,
  "Nov": Startmonlist.NOV,
  "Oct": Startmonlist.OCT,
  "Sep": Startmonlist.SEP
});

class Startdate {
  Startdate({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Startdate.fromJson(Map<String, dynamic> json) => Startdate(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

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

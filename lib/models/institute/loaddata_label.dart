
import 'dart:convert';

LoadDataLabel loadDataLabelFromJson(String str) => LoadDataLabel.fromJson(json.decode(str));

String loadDataLabelToJson(LoadDataLabel data) => json.encode(data.toJson());

class LoadDataLabel {
  LoadDataLabel({
    this.status,
    this.message,
    this.holded,
    this.rejected,
    this.commentolor,
    this.budgetstart,
    this.budgetend,
    this.showcomment,
    this.folders,
    this.apply,
    this.getlang,
    this.picurlfinal,
    this.fullname,
    this.myid,
    this.user,
    this.startdates,
    this.funding,
    this.degree,
    this.dep,
    this.country,
    this.sellevel,
    this.applied,
    this.newapproved,
    this.tempreview,
    this.rejectedreason,
    this.selstartdate,
    this.haveprogramme,
    this.highdet,
    this.havefund,
    this.havecourse,
    this.foundingdata,
    this.personal,
    this.selectedcoursearr,
    this.year,
    this.award,
    this.reference,
    this.wexp,
    this.grade,
    this.highdetd,
    this.transcript,
    this.secaward,
    this.secor,
    this.corlist,
    this.engpro,
    this.potlist,
    this.secdet,
  });

  String status;
  String message;
  int holded;
  int rejected;
  String commentolor;
  String budgetstart;
  String budgetend;
  String showcomment;
  List<dynamic> folders;
  String apply;
  Getlang getlang;
  String picurlfinal;
  String fullname;
  dynamic myid;
  User user;
  List<StartDate> startdates;
  List<Funding> funding;
  List<LoadDataDegree> degree;
  List<Dep> dep;
  List<Country> country;
  String sellevel;
  String applied;
  String newapproved;
  String tempreview;
  String rejectedreason;
  String selstartdate;
  bool haveprogramme;
  List<dynamic> highdet;
  bool havefund;
  bool havecourse;
  Foundingdata foundingdata;
  Personal personal;
  List<dynamic> selectedcoursearr;
  List<int> year;
  List<Award> award;
  List<Reference> reference;
  List<dynamic> wexp;
  List<Grade> grade;
  List<dynamic> highdetd;
  List<Transcript> transcript;
  List<dynamic> secaward;
  List<dynamic> secor;
  List<dynamic> corlist;
  List<Engpro> engpro;
  List<Potlist> potlist;
  List<dynamic> secdet;

  factory LoadDataLabel.fromJson(Map<String, dynamic> json) => LoadDataLabel(
    status: json["status"],
    message: json["message"],
    holded: json["holded"],
    rejected: json["rejected"],
    commentolor: json["commentolor"],
    budgetstart: json["budgetstart"],
    budgetend: json["budgetend"],
    showcomment: json["showcomment"],
    folders: List<dynamic>.from(json["folders"].map((x) => x)),
    apply: json["apply"],
    getlang: Getlang.fromJson(json["getlang"]),
    picurlfinal: json["picurlfinal"],
    fullname: json["fullname"],
    myid: json["myid"],
    user: User.fromJson(json["user"]),
    startdates: List<StartDate>.from(json["startdates"].map((x) => StartDate.fromJson(x))),
    funding: List<Funding>.from(json["funding"].map((x) => Funding.fromJson(x))),
    degree: List<LoadDataDegree>.from(json["degree"].map((x) => LoadDataDegree.fromJson(x))),
    dep: List<Dep>.from(json["dep"].map((x) => Dep.fromJson(x))),
    country: List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
    sellevel: json["sellevel"],
    applied: json["applied"],
    newapproved: json["newapproved"],
    tempreview: json["tempreview"],
    rejectedreason: json["rejectedreason"],
    selstartdate: json["selstartdate"],
    haveprogramme: json["haveprogramme"],
    highdet: List<dynamic>.from(json["highdet"].map((x) => x)),
    havefund: json["havefund"],
    havecourse: json["havecourse"],
    foundingdata: Foundingdata.fromJson(json["foundingdata"]),
    personal: Personal.fromJson(json["personal"]),
    selectedcoursearr: List<dynamic>.from(json["selectedcoursearr"].map((x) => x)),
    year: List<int>.from(json["year"].map((x) => x)),
    award: List<Award>.from(json["award"].map((x) => Award.fromJson(x))),
    reference: List<Reference>.from(json["reference"].map((x) => Reference.fromJson(x))),
    wexp: List<dynamic>.from(json["wexp"].map((x) => x)),
    grade: List<Grade>.from(json["grade"].map((x) => Grade.fromJson(x))),
    highdetd: List<dynamic>.from(json["highdetd"].map((x) => x)),
    transcript: List<Transcript>.from(json["transcript"].map((x) => Transcript.fromJson(x))),
    secaward: List<dynamic>.from(json["secaward"].map((x) => x)),
    secor: List<dynamic>.from(json["secor"].map((x) => x)),
    corlist: List<dynamic>.from(json["corlist"].map((x) => x)),
    engpro: List<Engpro>.from(json["engpro"].map((x) => Engpro.fromJson(x))),
    potlist: List<Potlist>.from(json["potlist"].map((x) => Potlist.fromJson(x))),
    secdet: List<dynamic>.from(json["secdet"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "holded": holded,
    "rejected": rejected,
    "commentolor": commentolor,
    "budgetstart": budgetstart,
    "budgetend": budgetend,
    "showcomment": showcomment,
    "folders": List<dynamic>.from(folders.map((x) => x)),
    "apply": apply,
    "getlang": getlang.toJson(),
    "picurlfinal": picurlfinal,
    "fullname": fullname,
    "myid": myid,
    "user": user.toJson(),
    "startdates": List<dynamic>.from(startdates.map((x) => x.toJson())),
    "funding": List<dynamic>.from(funding.map((x) => x.toJson())),
    "degree": List<dynamic>.from(degree.map((x) => x.toJson())),
    "dep": List<dynamic>.from(dep.map((x) => x.toJson())),
    "country": List<dynamic>.from(country.map((x) => x.toJson())),
    "sellevel": sellevel,
    "applied": applied,
    "newapproved": newapproved,
    "tempreview": tempreview,
    "rejectedreason": rejectedreason,
    "selstartdate": selstartdate,
    "haveprogramme": haveprogramme,
    "highdet": List<dynamic>.from(highdet.map((x) => x)),
    "havefund": havefund,
    "havecourse": havecourse,
    "foundingdata": foundingdata.toJson(),
    "personal": personal.toJson(),
    "selectedcoursearr": List<dynamic>.from(selectedcoursearr.map((x) => x)),
    "year": List<dynamic>.from(year.map((x) => x)),
    "award": List<dynamic>.from(award.map((x) => x.toJson())),
    "reference": List<dynamic>.from(reference.map((x) => x.toJson())),
    "wexp": List<dynamic>.from(wexp.map((x) => x)),
    "grade": List<dynamic>.from(grade.map((x) => x.toJson())),
    "highdetd": List<dynamic>.from(highdetd.map((x) => x)),
    "transcript": List<dynamic>.from(transcript.map((x) => x.toJson())),
    "secaward": List<dynamic>.from(secaward.map((x) => x)),
    "secor": List<dynamic>.from(secor.map((x) => x)),
    "corlist": List<dynamic>.from(corlist.map((x) => x)),
    "engpro": List<dynamic>.from(engpro.map((x) => x.toJson())),
    "potlist": List<dynamic>.from(potlist.map((x) => x.toJson())),
    "secdet": List<dynamic>.from(secdet.map((x) => x)),
  };
}

class Award {
  Award({
    this.highawardId,
    this.highawardName,
  });

  String highawardId;
  String highawardName;

  factory Award.fromJson(Map<String, dynamic> json) => Award(
    highawardId: json["highaward_id"],
    highawardName: json["highaward_name"],
  );

  Map<String, dynamic> toJson() => {
    "highaward_id": highawardId,
    "highaward_name": highawardName,
  };
}

class Country {
  Country({
    this.budget,
    this.id,
    this.name,
    this.selected,
    this.budgetselected,
    this.ex,
    this.currname,
  });

  List<Budget> budget;
  String id;
  String name;
  bool selected;
  String budgetselected;
  String ex;
  Currname currname;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    budget: List<Budget>.from(json["budget"].map((x) => Budget.fromJson(x))),
    id: json["id"],
    name: json["name"],
    selected: json["selected"],
    budgetselected: json["budgetselected"],
    ex: json["ex"],
    currname: currnameValues.map[json["currname"]],
  );

  Map<String, dynamic> toJson() => {
    "budget": List<dynamic>.from(budget.map((x) => x.toJson())),
    "id": id,
    "name": name,
    "selected": selected,
    "budgetselected": budgetselected,
    "ex": ex,
    "currname": currnameValues.reverse[currname],
  };
}

class Budget {
  Budget({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Budget.fromJson(Map<String, dynamic> json) => Budget(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

enum Currname { CANADIAN_DOLLAR, EUROPEAN_EURO, POUND_STERLING, UNITED_STATES_DOLLAR }

final currnameValues = EnumValues({
  "Canadian Dollar (\u0024)": Currname.CANADIAN_DOLLAR,
  "European Euro (€)": Currname.EUROPEAN_EURO,
  "Pound Sterling (£)": Currname.POUND_STERLING,
  "United States Dollar (\u0024)": Currname.UNITED_STATES_DOLLAR
});

class LoadDataDegree {
  LoadDataDegree({
    this.degreeId,
    this.degreeName,
    this.degreeTitle,
    this.degreeSelecttext,
    this.degreeAa,
    this.degreeBb,
    this.degreeCc,
    this.degreeSubmittedstudents,
    this.degreeApprovedstudents,
    this.degreeActivestudents,
    this.degreeInvitedstudents,
    this.degreeAppliedstudents,
    this.degreeOfferedstudents,
    this.degreeAcceptedstudents,
    this.degreeStatus,
    this.degreeIndex,
    this.degreeFair,
  });

  String degreeId;
  String degreeName;
  String degreeTitle;
  String degreeSelecttext;
  String degreeAa;
  String degreeBb;
  String degreeCc;
  String degreeSubmittedstudents;
  String degreeApprovedstudents;
  String degreeActivestudents;
  String degreeInvitedstudents;
  String degreeAppliedstudents;
  String degreeOfferedstudents;
  String degreeAcceptedstudents;
  String degreeStatus;
  String degreeIndex;
  String degreeFair;

  factory LoadDataDegree.fromJson(Map<String, dynamic> json) => LoadDataDegree(
    degreeId: json["degree_id"],
    degreeName: json["degree_name"],
    degreeTitle: json["degree_title"],
    degreeSelecttext: json["degree_selecttext"],
    degreeAa: json["degree_aa"],
    degreeBb: json["degree_bb"],
    degreeCc: json["degree_cc"],
    degreeSubmittedstudents: json["degree_submittedstudents"],
    degreeApprovedstudents: json["degree_approvedstudents"],
    degreeActivestudents: json["degree_activestudents"],
    degreeInvitedstudents: json["degree_invitedstudents"],
    degreeAppliedstudents: json["degree_appliedstudents"],
    degreeOfferedstudents: json["degree_offeredstudents"],
    degreeAcceptedstudents: json["degree_acceptedstudents"],
    degreeStatus: json["degree_status"],
    degreeIndex: json["degree_index"],
    degreeFair: json["degree_fair"],
  );

  Map<String, dynamic> toJson() => {
    "degree_id": degreeId,
    "degree_name": degreeName,
    "degree_title": degreeTitle,
    "degree_selecttext": degreeSelecttext,
    "degree_aa": degreeAa,
    "degree_bb": degreeBb,
    "degree_cc": degreeCc,
    "degree_submittedstudents": degreeSubmittedstudents,
    "degree_approvedstudents": degreeApprovedstudents,
    "degree_activestudents": degreeActivestudents,
    "degree_invitedstudents": degreeInvitedstudents,
    "degree_appliedstudents": degreeAppliedstudents,
    "degree_offeredstudents": degreeOfferedstudents,
    "degree_acceptedstudents": degreeAcceptedstudents,
    "degree_status": degreeStatus,
    "degree_index": degreeIndex,
    "degree_fair": degreeFair,
  };
}

class Dep {
  Dep({
    this.id,
    this.name,
    this.course,
  });

  String id;
  String name;
  List<Course> course;

  factory Dep.fromJson(Map<String, dynamic> json) => Dep(
    id: json["id"],
    name: json["name"],
    course: List<Course>.from(json["course"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "course": List<dynamic>.from(course.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    this.id,
    this.name,
    this.selected,
  });

  String id;
  String name;
  bool selected;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    name: json["name"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "selected": selected,
  };
}

class Engpro {
  Engpro({
    this.engproId,
    this.engproName,
  });

  String engproId;
  String engproName;

  factory Engpro.fromJson(Map<String, dynamic> json) => Engpro(
    engproId: json["engpro_id"],
    engproName: json["engpro_name"],
  );

  Map<String, dynamic> toJson() => {
    "engpro_id": engproId,
    "engpro_name": engproName,
  };
}

class Foundingdata {
  Foundingdata({
    this.selected,
    this.sponcorfname,
    this.sponcorlname,
    this.sponcortelephone,
    this.sponcoremail,
    this.govtfundev,
    this.govtfundapplied,
    this.fundingdescription,
    this.passport,
    this.surname,
    this.othername,
    this.homeaddress,
    this.scholammount,
    this.refusedvisa,
    this.needvisa,
    this.sponsorwho,
  });

  String selected;
  String sponcorfname;
  String sponcorlname;
  String sponcortelephone;
  String sponcoremail;
  String govtfundev;
  String govtfundapplied;
  String fundingdescription;
  String passport;
  String surname;
  String othername;
  String homeaddress;
  String scholammount;
  String refusedvisa;
  String needvisa;
  String sponsorwho;

  factory Foundingdata.fromJson(Map<String, dynamic> json) => Foundingdata(
    selected: json["selected"],
    sponcorfname: json["sponcorfname"],
    sponcorlname: json["sponcorlname"],
    sponcortelephone: json["sponcortelephone"],
    sponcoremail: json["sponcoremail"],
    govtfundev: json["govtfundev"],
    govtfundapplied: json["govtfundapplied"],
    fundingdescription: json["fundingdescription"],
    passport: json["passport"],
    surname: json["surname"],
    othername: json["othername"],
    homeaddress: json["homeaddress"],
    scholammount: json["scholammount"],
    refusedvisa: json["refusedvisa"],
    needvisa: json["needvisa"],
    sponsorwho: json["sponsorwho"],
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
    "passport": passport,
    "surname": surname,
    "othername": othername,
    "homeaddress": homeaddress,
    "scholammount": scholammount,
    "refusedvisa": refusedvisa,
    "needvisa": needvisa,
    "sponsorwho": sponsorwho,
  };
}

class Funding {
  Funding({
    this.fundingId,
    this.fundingName,
    this.fundingStatus,
    this.fundingIndex,
  });

  String fundingId;
  String fundingName;
  String fundingStatus;
  String fundingIndex;

  factory Funding.fromJson(Map<String, dynamic> json) => Funding(
    fundingId: json["funding_id"],
    fundingName: json["funding_name"],
    fundingStatus: json["funding_status"],
    fundingIndex: json["funding_index"],
  );

  Map<String, dynamic> toJson() => {
    "funding_id": fundingId,
    "funding_name": fundingName,
    "funding_status": fundingStatus,
    "funding_index": fundingIndex,
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

class Grade {
  Grade({
    this.requirementId,
    this.requirementName,
  });

  String requirementId;
  String requirementName;

  factory Grade.fromJson(Map<String, dynamic> json) => Grade(
    requirementId: json["requirement_id"],
    requirementName: json["requirement_name"],
  );

  Map<String, dynamic> toJson() => {
    "requirement_id": requirementId,
    "requirement_name": requirementName,
  };
}

class Personal {
  Personal({
    this.homeaddress,
    this.homecity,
    this.refname,
    this.refpostal,
    this.refrelation,
    this.reftel,
    this.refemail,
    this.refnameb,
    this.refpostalb,
    this.refrelationb,
    this.reftelb,
    this.refemailb,
    this.passportsno,
    this.refusedvisa,
    this.needvisa,
    this.sponsore,
  });

  String homeaddress;
  String homecity;
  String refname;
  String refpostal;
  String refrelation;
  String reftel;
  String refemail;
  String refnameb;
  String refpostalb;
  String refrelationb;
  String reftelb;
  String refemailb;
  String passportsno;
  String refusedvisa;
  String needvisa;
  String sponsore;

  factory Personal.fromJson(Map<String, dynamic> json) => Personal(
    homeaddress: json["homeaddress"],
    homecity: json["homecity"],
    refname: json["refname"],
    refpostal: json["refpostal"],
    refrelation: json["refrelation"],
    reftel: json["reftel"],
    refemail: json["refemail"],
    refnameb: json["refnameb"],
    refpostalb: json["refpostalb"],
    refrelationb: json["refrelationb"],
    reftelb: json["reftelb"],
    refemailb: json["refemailb"],
    passportsno: json["passportsno"],
    refusedvisa: json["refusedvisa"],
    needvisa: json["needvisa"],
    sponsore: json["sponsore"],
  );

  Map<String, dynamic> toJson() => {
    "homeaddress": homeaddress,
    "homecity": homecity,
    "refname": refname,
    "refpostal": refpostal,
    "refrelation": refrelation,
    "reftel": reftel,
    "refemail": refemail,
    "refnameb": refnameb,
    "refpostalb": refpostalb,
    "refrelationb": refrelationb,
    "reftelb": reftelb,
    "refemailb": refemailb,
    "passportsno": passportsno,
    "refusedvisa": refusedvisa,
    "needvisa": needvisa,
    "sponsore": sponsore,
  };
}

class Potlist {
  Potlist({
    this.gradeId,
    this.gradeName,
  });

  String gradeId;
  String gradeName;

  factory Potlist.fromJson(Map<String, dynamic> json) => Potlist(
    gradeId: json["grade_id"],
    gradeName: json["grade_name"],
  );

  Map<String, dynamic> toJson() => {
    "grade_id": gradeId,
    "grade_name": gradeName,
  };
}

class Reference {
  Reference({
    this.referenceId,
    this.referenceName,
  });

  String referenceId;
  String referenceName;

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
    referenceId: json["reference_id"],
    referenceName: json["reference_name"],
  );

  Map<String, dynamic> toJson() => {
    "reference_id": referenceId,
    "reference_name": referenceName,
  };
}

class StartDate {
  StartDate({
    this.value,
    this.text,
  });

  String value;
  String text;

  factory StartDate.fromJson(Map<String, dynamic> json) => StartDate(
    value: json["value"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
  };
}

class Transcript {
  Transcript({
    this.transcriptId,
    this.transcriptName,
  });

  String transcriptId;
  String transcriptName;

  factory Transcript.fromJson(Map<String, dynamic> json) => Transcript(
    transcriptId: json["transcript_id"],
    transcriptName: json["transcript_name"],
  );

  Map<String, dynamic> toJson() => {
    "transcript_id": transcriptId,
    "transcript_name": transcriptName,
  };
}

class User {
  User({
    this.user,
    this.parent,
    this.fullname,
    this.email,
    this.pic,
    this.jobtitle,
    this.type,
    this.deactivated,
  });

  dynamic user;
  dynamic parent;
  dynamic fullname;
  dynamic email;
  dynamic pic;
  dynamic jobtitle;
  dynamic type;
  dynamic deactivated;

  factory User.fromJson(Map<String, dynamic> json) => User(
    user: json["user"],
    parent: json["parent"],
    fullname: json["fullname"],
    email: json["email"],
    pic: json["pic"],
    jobtitle: json["jobtitle"],
    type: json["type"],
    deactivated: json["deactivated"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "parent": parent,
    "fullname": fullname,
    "email": email,
    "pic": pic,
    "jobtitle": jobtitle,
    "type": type,
    "deactivated": deactivated,
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

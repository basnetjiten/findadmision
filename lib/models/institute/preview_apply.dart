
class PreviewApplyRes {
  PreviewApplyRes({
    this.status,
    this.sellevel,
    this.applyfaze,
    this.fundingdata,
    this.sellevelreadonly,
    this.applied,
    this.newapproved,
    this.tempreview,
    this.rejected,
    this.rejectedreason,
    this.applysellevel,
    this.applyapplied,
    this.applyapproved,
    this.applytempreview,
    this.applyrejected,
    this.applyrejectedreason,
    this.applystartdate,
    this.selectedcoursearr,
    this.allcourses,
    this.message,
    this.instid,
    this.processingfee,
    this.applythrough,
    this.details,
    this.premium,
    this.myid,
    this.offered,
    this.wishlist,
    this.curr,
    this.countryidget,
    this.currsign,
    this.instapolicy,
    this.requested,
    this.approved,
  });

  String status;
  String sellevel;
  String applyfaze;
  Fundingdata fundingdata;
  String sellevelreadonly;
  String applied;
  String newapproved;
  String tempreview;
  String rejected;
  String rejectedreason;
  String applysellevel;
  String applyapplied;
  String applyapproved;
  String applytempreview;
  String applyrejected;
  String applyrejectedreason;
  String applystartdate;
  List<dynamic> selectedcoursearr;
  List<dynamic> allcourses;
  String message;
  String instid;
  String processingfee;
  bool applythrough;
  Details details;
  String premium;
  String myid;
  bool offered;
  bool wishlist;
  String curr;
  String countryidget;
  String currsign;
  List<Instapolicy> instapolicy;
  bool requested;
  String approved;

  factory PreviewApplyRes.fromJson(Map<String, dynamic> json) => PreviewApplyRes(
    status: json["status"],
    sellevel: json["sellevel"],
    applyfaze: json["applyfaze"],
    fundingdata: Fundingdata.fromJson(json["fundingdata"]),
    sellevelreadonly: json["sellevelreadonly"],
    applied: json["applied"],
    newapproved: json["newapproved"],
    tempreview: json["tempreview"],
    rejected: json["rejected"],
    rejectedreason: json["rejectedreason"],
    applysellevel: json["applysellevel"],
    applyapplied: json["applyapplied"],
    applyapproved: json["applyapproved"],
    applytempreview: json["applytempreview"],
    applyrejected: json["applyrejected"],
    applyrejectedreason: json["applyrejectedreason"],
    applystartdate: json["applystartdate"],
    selectedcoursearr: List<dynamic>.from(json["selectedcoursearr"].map((x) => x)),
    allcourses: List<dynamic>.from(json["allcourses"].map((x) => x)),
    message: json["message"],
    instid: json["instid"],
    processingfee: json["processingfee"],
    applythrough: json["applythrough"],
    details: Details.fromJson(json["details"]),
    premium: json["premium"],
    myid: json["myid"],
    offered: json["offered"],
    wishlist: json["wishlist"],
    curr: json["curr"],
    countryidget: json["countryidget"],
    currsign: json["currsign"],
    instapolicy: List<Instapolicy>.from(json["instapolicy"].map((x) => Instapolicy.fromJson(x))),
    requested: json["requested"],
    approved: json["approved"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "sellevel": sellevel,
    "applyfaze": applyfaze,
    "fundingdata": fundingdata.toJson(),
    "sellevelreadonly": sellevelreadonly,
    "applied": applied,
    "newapproved": newapproved,
    "tempreview": tempreview,
    "rejected": rejected,
    "rejectedreason": rejectedreason,
    "applysellevel": applysellevel,
    "applyapplied": applyapplied,
    "applyapproved": applyapproved,
    "applytempreview": applytempreview,
    "applyrejected": applyrejected,
    "applyrejectedreason": applyrejectedreason,
    "applystartdate": applystartdate,
    "selectedcoursearr": List<dynamic>.from(selectedcoursearr.map((x) => x)),
    "allcourses": List<dynamic>.from(allcourses.map((x) => x)),
    "message": message,
    "instid": instid,
    "processingfee": processingfee,
    "applythrough": applythrough,
    "details": details.toJson(),
    "premium": premium,
    "myid": myid,
    "offered": offered,
    "wishlist": wishlist,
    "curr": curr,
    "countryidget": countryidget,
    "currsign": currsign,
    "instapolicy": List<dynamic>.from(instapolicy.map((x) => x.toJson())),
    "requested": requested,
    "approved": approved,
  };
}

class Details {
  Details({
    this.id,
    this.name,
    this.nickname,
    this.address,
    this.statecity,
    this.website,
    this.country,
    this.institutesCover,
    this.institutesCoverurl,
    this.institutesPropic,
    this.institutesPropicurl,
    this.countryname,
    this.firstname,
    this.lastname,
    this.fullname,
    this.contactemail,
    this.jobtitle,
    this.about,
    this.email,
    this.logo,
    this.package,
    this.status,
    this.wishlist,
  });

  String id;
  String name;
  String nickname;
  String address;
  String statecity;
  String website;
  String country;
  String institutesCover;
  String institutesCoverurl;
  String institutesPropic;
  String institutesPropicurl;
  String countryname;
  String firstname;
  String lastname;
  String fullname;
  String contactemail;
  String jobtitle;
  String about;
  String email;
  String logo;
  String package;
  String status;
  bool wishlist;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    id: json["id"],
    name: json["name"],
    nickname: json["nickname"],
    address: json["address"],
    statecity: json["statecity"],
    website: json["website"],
    country: json["country"],
    institutesCover: json["institutes_cover"],
    institutesCoverurl: json["institutes_coverurl"],
    institutesPropic: json["institutes_propic"],
    institutesPropicurl: json["institutes_propicurl"],
    countryname: json["countryname"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    fullname: json["fullname"],
    contactemail: json["contactemail"],
    jobtitle: json["jobtitle"],
    about: json["about"],
    email: json["email"],
    logo: json["logo"],
    package: json["package"],
    status: json["status"],
    wishlist: json["wishlist"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "nickname": nickname,
    "address": address,
    "statecity": statecity,
    "website": website,
    "country": country,
    "institutes_cover": institutesCover,
    "institutes_coverurl": institutesCoverurl,
    "institutes_propic": institutesPropic,
    "institutes_propicurl": institutesPropicurl,
    "countryname": countryname,
    "firstname": firstname,
    "lastname": lastname,
    "fullname": fullname,
    "contactemail": contactemail,
    "jobtitle": jobtitle,
    "about": about,
    "email": email,
    "logo": logo,
    "package": package,
    "status": status,
    "wishlist": wishlist,
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

class Instapolicy {
  Instapolicy({
    this.degreeId,
    this.degreeName,
    this.degreeTitle,
    this.selectedstartdate,
    this.instpolicyScholarship,
    this.instpolicyScholammount,
    this.instpolicyApplicationfee,
    this.instpolicyApplimmount,
    this.instpolicyScholcondition,
    this.instpolicyPaymentplan,
    this.instpolicyFormbuilder,
    this.budgetstart,
    this.budgetend,
    this.budgetid,
    this.startdates,
    this.courseoffered,
    this.course,
  });

  String degreeId;
  String degreeName;
  String degreeTitle;
  String selectedstartdate;
  String instpolicyScholarship;
  String instpolicyScholammount;
  String instpolicyApplicationfee;
  String instpolicyApplimmount;
  String instpolicyScholcondition;
  String instpolicyPaymentplan;
  List<dynamic> instpolicyFormbuilder;
  int budgetstart;
  String budgetend;
  String budgetid;
  List<Startdate> startdates;
  List<String> courseoffered;
  List<InstapolicyCourse> course;

  factory Instapolicy.fromJson(Map<String, dynamic> json) => Instapolicy(
    degreeId: json["degree_id"],
    degreeName: json["degree_name"],
    degreeTitle: json["degree_title"],
    selectedstartdate: json["selectedstartdate"],
    instpolicyScholarship: json["instpolicy_scholarship"],
    instpolicyScholammount: json["instpolicy_scholammount"],
    instpolicyApplicationfee: json["instpolicy_applicationfee"],
    instpolicyApplimmount: json["instpolicy_applimmount"],
    instpolicyScholcondition: json["instpolicy_scholcondition"],
    instpolicyPaymentplan: json["instpolicy_paymentplan"],
    instpolicyFormbuilder: List<dynamic>.from(json["instpolicy_formbuilder"].map((x) => x)),
    budgetstart: json["budgetstart"],
    budgetend: json["budgetend"],
    budgetid: json["budgetid"],
    startdates: List<Startdate>.from(json["startdates"].map((x) => Startdate.fromJson(x))),
    courseoffered: List<String>.from(json["courseoffered"].map((x) => x)),
    course: List<InstapolicyCourse>.from(json["course"].map((x) => InstapolicyCourse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "degree_id": degreeId,
    "degree_name": degreeName,
    "degree_title": degreeTitle,
    "selectedstartdate": selectedstartdate,
    "instpolicy_scholarship": instpolicyScholarship,
    "instpolicy_scholammount": instpolicyScholammount,
    "instpolicy_applicationfee": instpolicyApplicationfee,
    "instpolicy_applimmount": instpolicyApplimmount,
    "instpolicy_scholcondition": instpolicyScholcondition,
    "instpolicy_paymentplan": instpolicyPaymentplan,
    "instpolicy_formbuilder": List<dynamic>.from(instpolicyFormbuilder.map((x) => x)),
    "budgetstart": budgetstart,
    "budgetend": budgetend,
    "budgetid": budgetid,
    "startdates": List<dynamic>.from(startdates.map((x) => x.toJson())),
    "courseoffered": List<dynamic>.from(courseoffered.map((x) => x)),
    "course": List<dynamic>.from(course.map((x) => x.toJson())),
  };
}

class InstapolicyCourse {
  InstapolicyCourse({
    this.id,
    this.name,
    this.course,
  });

  String id;
  String name;
  List<CourseCourse> course;

  factory InstapolicyCourse.fromJson(Map<String, dynamic> json) => InstapolicyCourse(
    id: json["id"],
    name: json["name"],
    course: List<CourseCourse>.from(json["course"].map((x) => CourseCourse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "course": List<dynamic>.from(course.map((x) => x.toJson())),
  };
}

class CourseCourse {
  CourseCourse({
    this.id,
    this.name,
    this.selected,
  });

  String id;
  String name;
  bool selected;

  factory CourseCourse.fromJson(Map<String, dynamic> json) => CourseCourse(
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

class Startdate {
  Startdate({
    this.value,
    this.text,
    this.selected,
  });

  String value;
  String text;
  bool selected;

  factory Startdate.fromJson(Map<String, dynamic> json) => Startdate(
    value: json["value"],
    text: json["text"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
    "selected": selected,
  };
}

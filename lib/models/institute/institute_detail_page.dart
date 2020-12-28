import 'dart:convert';

InstituteDetailRes instituteDetailResFromJson(String str) => InstituteDetailRes.fromJson(json.decode(str));

String instituteDetailResToJson(InstituteDetailRes data) => json.encode(data.toJson());

class InstituteDetailRes {
  InstituteDetailRes({
    this.status,
    this.sellevel,
    this.country,
    this.month,
    this.year,
    this.day,
    this.sellevelreadonly,
    this.applied,
    this.newapproved,
    this.tempreview,
    this.countryids,
    this.dialingcodes,
    this.uniquecode,
    this.rejected,
    this.folders,
    this.rejectedreason,
    this.applysellevel,
    this.applyapplied,
    this.applyapproved,
    this.applytempreview,
    this.applyrejected,
    this.applyrejectedreason,
    this.applystartdate,
    this.applycourse,
    this.selectedcoursearr,
    this.allcourses,
    this.message,
    this.instid,
    this.processingfee,
    this.applythrough,
    this.details,
    this.offered,
    this.instdoc,
    this.wishlist,
    this.countrypages,
    this.curr,
    this.countryidget,
    this.currsign,
    this.instapolicy,
    this.requested,
    this.approved,
    this.invited,
    this.videos,
    this.photos,
    this.introvideo,
    this.intro,
  });

  String status;
  String sellevel;
  List<Country> country;
  List<List<String>> month;
  List<List<int>> year;
  List<List<int>> day;
  String sellevelreadonly;
  String applied;
  String newapproved;
  String tempreview;
  Map<String, String> countryids;
  Map<String, String> dialingcodes;
  String uniquecode;
  String rejected;
  Map<String, List<Folder>> folders;
  String rejectedreason;
  String applysellevel;
  String applyapplied;
  String applyapproved;
  String applytempreview;
  String applyrejected;
  String applyrejectedreason;
  String applystartdate;
  List<dynamic> applycourse;
  List<dynamic> selectedcoursearr;
  List<dynamic> allcourses;
  String message;
  String instid;
  String processingfee;
  bool applythrough;
  Details details;
  bool offered;
  List<dynamic> instdoc;
  bool wishlist;
  List<Countrypage> countrypages;
  String curr;
  String countryidget;
  String currsign;
  List<Instapolicy> instapolicy;
  bool requested;
  String approved;
  bool invited;
  List<Video> videos;
  List<Photo> photos;
  bool introvideo;
  List<dynamic> intro;

  factory InstituteDetailRes.fromJson(Map<String, dynamic> json) => InstituteDetailRes(
    status: json["status"],
    sellevel: json["sellevel"],
    country: List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
    month: List<List<String>>.from(json["month"].map((x) => List<String>.from(x.map((x) => x)))),
    year: List<List<int>>.from(json["year"].map((x) => List<int>.from(x.map((x) => x)))),
    day: List<List<int>>.from(json["day"].map((x) => List<int>.from(x.map((x) => x)))),
    sellevelreadonly: json["sellevelreadonly"],
    applied: json["applied"],
    newapproved: json["newapproved"],
    tempreview: json["tempreview"],
    countryids: Map.from(json["countryids"]).map((k, v) => MapEntry<String, String>(k, v)),
    dialingcodes: Map.from(json["dialingcodes"]).map((k, v) => MapEntry<String, String>(k, v)),
    uniquecode: json["uniquecode"],
    rejected: json["rejected"],
    folders: Map.from(json["folders"]).map((k, v) => MapEntry<String, List<Folder>>(k, List<Folder>.from(v.map((x) => Folder.fromJson(x))))),
    rejectedreason: json["rejectedreason"],
    applysellevel: json["applysellevel"],
    applyapplied: json["applyapplied"],
    applyapproved: json["applyapproved"],
    applytempreview: json["applytempreview"],
    applyrejected: json["applyrejected"],
    applyrejectedreason: json["applyrejectedreason"],
    applystartdate: json["applystartdate"],
    applycourse: List<dynamic>.from(json["applycourse"].map((x) => x)),
    selectedcoursearr: List<dynamic>.from(json["selectedcoursearr"].map((x) => x)),
    allcourses: List<dynamic>.from(json["allcourses"].map((x) => x)),
    message: json["message"],
    instid: json["instid"],
    processingfee: json["processingfee"],
    applythrough: json["applythrough"],
    details: Details.fromJson(json["details"]),
    offered: json["offered"],
    instdoc: List<dynamic>.from(json["instdoc"].map((x) => x)),
    wishlist: json["wishlist"],
    countrypages: List<Countrypage>.from(json["countrypages"].map((x) => Countrypage.fromJson(x))),
    curr: json["curr"],
    countryidget: json["countryidget"],
    currsign: json["currsign"],
    instapolicy: List<Instapolicy>.from(json["instapolicy"].map((x) => Instapolicy.fromJson(x))),
    requested: json["requested"],
    approved: json["approved"],
    invited: json["invited"],
    videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    introvideo: json["introvideo"],
    intro: List<dynamic>.from(json["intro"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "sellevel": sellevel,
    "country": List<dynamic>.from(country.map((x) => x.toJson())),
    "month": List<dynamic>.from(month.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "year": List<dynamic>.from(year.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "day": List<dynamic>.from(day.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "sellevelreadonly": sellevelreadonly,
    "applied": applied,
    "newapproved": newapproved,
    "tempreview": tempreview,
    "countryids": Map.from(countryids).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "dialingcodes": Map.from(dialingcodes).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "uniquecode": uniquecode,
    "rejected": rejected,
    "folders": Map.from(folders).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
    "rejectedreason": rejectedreason,
    "applysellevel": applysellevel,
    "applyapplied": applyapplied,
    "applyapproved": applyapproved,
    "applytempreview": applytempreview,
    "applyrejected": applyrejected,
    "applyrejectedreason": applyrejectedreason,
    "applystartdate": applystartdate,
    "applycourse": List<dynamic>.from(applycourse.map((x) => x)),
    "selectedcoursearr": List<dynamic>.from(selectedcoursearr.map((x) => x)),
    "allcourses": List<dynamic>.from(allcourses.map((x) => x)),
    "message": message,
    "instid": instid,
    "processingfee": processingfee,
    "applythrough": applythrough,
    "details": details.toJson(),
    "offered": offered,
    "instdoc": List<dynamic>.from(instdoc.map((x) => x)),
    "wishlist": wishlist,
    "countrypages": List<dynamic>.from(countrypages.map((x) => x.toJson())),
    "curr": curr,
    "countryidget": countryidget,
    "currsign": currsign,
    "instapolicy": List<dynamic>.from(instapolicy.map((x) => x.toJson())),
    "requested": requested,
    "approved": approved,
    "invited": invited,
    "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "introvideo": introvideo,
    "intro": List<dynamic>.from(intro.map((x) => x)),
  };
}

class Country {
  Country({
    this.countryId,
    this.countryName,
    this.countryShortcode,
    this.countryDialingcode,
    this.dlkey,
  });

  String countryId;
  String countryName;
  String countryShortcode;
  String countryDialingcode;
  String dlkey;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    countryId: json["country_id"],
    countryName: json["country_name"],
    countryShortcode: json["country_shortcode"],
    countryDialingcode: json["country_dialingcode"],
    dlkey: json["dlkey"],
  );

  Map<String, dynamic> toJson() => {
    "country_id": countryId,
    "country_name": countryName,
    "country_shortcode": countryShortcode,
    "country_dialingcode": countryDialingcode,
    "dlkey": dlkey,
  };
}

class Countrypage {
  Countrypage({
    this.countrypagesId,
    this.countrypagesTitle,
    this.countrypagesBody,
    this.countrypagesSmalldescription,
    this.countrypagesTags,
    this.countrypagesIndex,
    this.countrypagesCountry,
    this.countrypagesStatus,
    this.countrypagesViews,
    this.countrypagesFor,
    this.countrypagesTime,
  });

  String countrypagesId;
  String countrypagesTitle;
  String countrypagesBody;
  String countrypagesSmalldescription;
  String countrypagesTags;
  String countrypagesIndex;
  String countrypagesCountry;
  String countrypagesStatus;
  String countrypagesViews;
  String countrypagesFor;
  String countrypagesTime;

  factory Countrypage.fromJson(Map<String, dynamic> json) => Countrypage(
    countrypagesId: json["countrypages_id"],
    countrypagesTitle: json["countrypages_title"],
    countrypagesBody: json["countrypages_body"],
    countrypagesSmalldescription: json["countrypages_smalldescription"],
    countrypagesTags: json["countrypages_tags"],
    countrypagesIndex: json["countrypages_index"],
    countrypagesCountry: json["countrypages_country"],
    countrypagesStatus: json["countrypages_status"],
    countrypagesViews: json["countrypages_views"],
    countrypagesFor: json["countrypages_for"],
    countrypagesTime: json["countrypages_time"],
  );

  Map<String, dynamic> toJson() => {
    "countrypages_id": countrypagesId,
    "countrypages_title": countrypagesTitle,
    "countrypages_body": countrypagesBody,
    "countrypages_smalldescription": countrypagesSmalldescription,
    "countrypages_tags": countrypagesTags,
    "countrypages_index": countrypagesIndex,
    "countrypages_country": countrypagesCountry,
    "countrypages_status": countrypagesStatus,
    "countrypages_views": countrypagesViews,
    "countrypages_for": countrypagesFor,
    "countrypages_time": countrypagesTime,
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

class Folder {
  Folder({
    this.institutereqlistId,
    this.institutereqlistInst,
    this.institutereqlistLevel,
    this.institutereqlistDocument,
    this.institutereqlistOdocument,
    this.institutereqlistCountry,
    this.institutereqlistMandatory,
    this.subfilesId,
    this.subfilesDocumentfolders,
    this.subfilesName,
    this.subfilesReq,
    this.subfilesDescription,
    this.subfilesStatus,
  });

  String institutereqlistId;
  String institutereqlistInst;
  String institutereqlistLevel;
  String institutereqlistDocument;
  InstitutereqlistOdocument institutereqlistOdocument;
  String institutereqlistCountry;
  String institutereqlistMandatory;
  String subfilesId;
  String subfilesDocumentfolders;
  String subfilesName;
  String subfilesReq;
  String subfilesDescription;
  String subfilesStatus;

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
    institutereqlistId: json["institutereqlist_id"],
    institutereqlistInst: json["institutereqlist_inst"],
    institutereqlistLevel: json["institutereqlist_level"],
    institutereqlistDocument: json["institutereqlist_document"],
    institutereqlistOdocument: institutereqlistOdocumentValues.map[json["institutereqlist_odocument"]],
    institutereqlistCountry: json["institutereqlist_country"],
    institutereqlistMandatory: json["institutereqlist_mandatory"],
    subfilesId: json["subfiles_id"],
    subfilesDocumentfolders: json["subfiles_documentfolders"],
    subfilesName: json["subfiles_name"],
    subfilesReq: json["subfiles_req"],
    subfilesDescription: json["subfiles_description"],
    subfilesStatus: json["subfiles_status"],
  );

  Map<String, dynamic> toJson() => {
    "institutereqlist_id": institutereqlistId,
    "institutereqlist_inst": institutereqlistInst,
    "institutereqlist_level": institutereqlistLevel,
    "institutereqlist_document": institutereqlistDocument,
    "institutereqlist_odocument": institutereqlistOdocumentValues.reverse[institutereqlistOdocument],
    "institutereqlist_country": institutereqlistCountry,
    "institutereqlist_mandatory": institutereqlistMandatory,
    "subfiles_id": subfilesId,
    "subfiles_documentfolders": subfilesDocumentfolders,
    "subfiles_name": subfilesName,
    "subfiles_req": subfilesReq,
    "subfiles_description": subfilesDescription,
    "subfiles_status": subfilesStatus,
  };
}

enum InstitutereqlistOdocument { EMPTY, UNDEFINED }

final institutereqlistOdocumentValues = EnumValues({
  "": InstitutereqlistOdocument.EMPTY,
  "undefined": InstitutereqlistOdocument.UNDEFINED
});

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
  List<InstDetailStartDate> startdates;
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
    startdates: List<InstDetailStartDate>.from(json["startdates"].map((x) => InstDetailStartDate.fromJson(x))),
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

class InstDetailStartDate {
  InstDetailStartDate({
    this.value,
    this.text,
    this.selected,
  });

  String value;
  String text;
  bool selected;

  factory InstDetailStartDate.fromJson(Map<String, dynamic> json) => InstDetailStartDate(
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



class Photo {
  Photo({
    this.instphotoId,
    this.instphotoInst,
    this.instphotoAwskey,
    this.instphotoAdmin,
    this.instphotoUrl,
    this.instphotoThumb,
  });

  String instphotoId;
  String instphotoInst;
  String instphotoAwskey;
  String instphotoAdmin;
  String instphotoUrl;
  String instphotoThumb;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    instphotoId: json["instphoto_id"],
    instphotoInst: json["instphoto_inst"],
    instphotoAwskey: json["instphoto_awskey"],
    instphotoAdmin: json["instphoto_admin"],
    instphotoUrl: json["instphoto_url"],
    instphotoThumb: json["instphoto_thumb"],
  );

  Map<String, dynamic> toJson() => {
    "instphoto_id": instphotoId,
    "instphoto_inst": instphotoInst,
    "instphoto_awskey": instphotoAwskey,
    "instphoto_admin": instphotoAdmin,
    "instphoto_url": instphotoUrl,
    "instphoto_thumb": instphotoThumb,
  };
}

class Video {
  Video({
    this.instvideoId,
    this.instvideoInst,
    this.instvideoNetwork,
    this.instvideoType,
    this.instvideoName,
    this.instvideoDescription,
    this.instvideoIntro,
    this.instvideoVideoid,
  });

  String instvideoId;
  String instvideoInst;
  String instvideoNetwork;
  String instvideoType;
  String instvideoName;
  String instvideoDescription;
  String instvideoIntro;
  String instvideoVideoid;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    instvideoId: json["instvideo_id"],
    instvideoInst: json["instvideo_inst"],
    instvideoNetwork: json["instvideo_network"],
    instvideoType: json["instvideo_type"],
    instvideoName: json["instvideo_name"],
    instvideoDescription: json["instvideo_description"],
    instvideoIntro: json["instvideo_intro"],
    instvideoVideoid: json["instvideo_videoid"],
  );

  Map<String, dynamic> toJson() => {
    "instvideo_id": instvideoId,
    "instvideo_inst": instvideoInst,
    "instvideo_network": instvideoNetwork,
    "instvideo_type": instvideoType,
    "instvideo_name": instvideoName,
    "instvideo_description": instvideoDescription,
    "instvideo_intro": instvideoIntro,
    "instvideo_videoid": instvideoVideoid,
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

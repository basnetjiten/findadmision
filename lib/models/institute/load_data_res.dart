

class LoadFileDataRes {
  LoadFileDataRes({
    this.status,
    this.message,
    this.admincommentidsr,
    this.totalapplied,
    this.premiumuser,
    this.apply,
    this.applied,
    this.studentname,
    this.countryname,
    this.pictureurl,
    this.comment,
    this.applysellevel,
    this.applyselleveltxt,
    this.applystartdate,
    this.folders,
    this.singlefolders,
    this.details,
    this.user,
    this.sellevel,
    this.startdatetxt,
    this.haveprogramme,
    this.selectedcoursearr,
  });

  String status;
  String message;
  List<dynamic> admincommentidsr;
  int totalapplied;
  bool premiumuser;
  bool apply;
  bool applied;
  String studentname;
  String countryname;
  String pictureurl;
  String comment;
  String applysellevel;
  String applyselleveltxt;
  String applystartdate;
  List<Folder> folders;
  List<Filesx> singlefolders;
  Details details;
  User user;
  String sellevel;
  String startdatetxt;
  bool haveprogramme;
  dynamic selectedcoursearr;

  factory LoadFileDataRes.fromJson(Map<String, dynamic> json) => LoadFileDataRes(
    status: json["status"],
    message: json["message"],
    admincommentidsr: List<dynamic>.from(json["admincommentidsr"].map((x) => x)),
    totalapplied: json["totalapplied"],
    premiumuser: json["premiumuser"],
    apply: json["apply"],
    applied: json["applied"],
    studentname: json["studentname"],
    countryname: json["countryname"],
    pictureurl: json["pictureurl"],
    comment: json["comment"],
    applysellevel: json["applysellevel"],
    applyselleveltxt: json["applyselleveltxt"],
    applystartdate: json["applystartdate"],
    folders: List<Folder>.from(json["folders"].map((x) => Folder.fromJson(x))),
    singlefolders: List<Filesx>.from(json["singlefolders"].map((x) => Filesx.fromJson(x))),
    details: Details.fromJson(json["details"]),
    user: User.fromJson(json["user"]),
    sellevel: json["sellevel"],
    startdatetxt: json["startdatetxt"],
    haveprogramme: json["haveprogramme"],
    selectedcoursearr:json["selectedcoursearr"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "admincommentidsr": List<dynamic>.from(admincommentidsr.map((x) => x)),
    "totalapplied": totalapplied,
    "premiumuser": premiumuser,
    "apply": apply,
    "applied": applied,
    "studentname": studentname,
    "countryname": countryname,
    "pictureurl": pictureurl,
    "comment": comment,
    "applysellevel": applysellevel,
    "applyselleveltxt": applyselleveltxt,
    "applystartdate": applystartdate,
    "folders": List<dynamic>.from(folders.map((x) => x.toJson())),
    "singlefolders": List<dynamic>.from(singlefolders.map((x) => x.toJson())),
    "details": details.toJson(),
    "user": user.toJson(),
    "sellevel": sellevel,
    "startdatetxt": startdatetxt,
    "haveprogramme": haveprogramme,
    "selectedcoursearr": List<dynamic>.from(selectedcoursearr.map((x) => x.toJson())),
  };
}

class Details {
  Details({
    this.name,
    this.nickname,
    this.address,
    this.statecity,
    this.website,
    this.country,
    this.institutesCover,
    this.institutesCoverurl,
    this.institutesPropicurl,
    this.countryname,
    this.package,
    this.status,
  });

  String name;
  String nickname;
  String address;
  String statecity;
  String website;
  String country;
  String institutesCover;
  String institutesCoverurl;
  String institutesPropicurl;
  String countryname;
  String package;
  String status;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    name: json["name"],
    nickname: json["nickname"],
    address: json["address"],
    statecity: json["statecity"],
    website: json["website"],
    country: json["country"],
    institutesCover: json["institutes_cover"],
    institutesCoverurl: json["institutes_coverurl"],
    institutesPropicurl: json["institutes_propicurl"],
    countryname: json["countryname"],
    package: json["package"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "nickname": nickname,
    "address": address,
    "statecity": statecity,
    "website": website,
    "country": country,
    "institutes_cover": institutesCover,
    "institutes_coverurl": institutesCoverurl,
    "institutes_propicurl": institutesPropicurl,
    "countryname": countryname,
    "package": package,
    "status": status,
  };
}

class Folder {
  Folder({
    this.documentfoldersId,
    this.documentfoldersName,
    this.documentfoldersFilename,
    this.documentfoldersDetail,
    this.documentfoldersRequired,
    this.documentfoldersFilecount,
    this.documentfoldersMissingdoc,
    this.documentfoldersFileuploaded,
    this.documentfoldersMakeopen,
    this.documentfoldersFiles,
    this.documentfoldersReqfiles,
  });

  String documentfoldersId;
  String documentfoldersName;
  String documentfoldersFilename;
  String documentfoldersDetail;
  String documentfoldersRequired;
  int documentfoldersFilecount;
  int documentfoldersMissingdoc;
  int documentfoldersFileuploaded;
  bool documentfoldersMakeopen;
  List<dynamic> documentfoldersFiles;
  List<DocumentfoldersReqfile> documentfoldersReqfiles;

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
    documentfoldersId: json["documentfolders_id"],
    documentfoldersName: json["documentfolders_name"],
    documentfoldersFilename: json["documentfolders_filename"],
    documentfoldersDetail: json["documentfolders_detail"],
    documentfoldersRequired: json["documentfolders_required"],
    documentfoldersFilecount: json["documentfolders_filecount"],
    documentfoldersMissingdoc: json["documentfolders_missingdoc"],
    documentfoldersFileuploaded: json["documentfolders_fileuploaded"],
    documentfoldersMakeopen: json["documentfolders_makeopen"],
    documentfoldersFiles: List<dynamic>.from(json["documentfolders_files"].map((x) => x)),
    documentfoldersReqfiles: List<DocumentfoldersReqfile>.from(json["documentfolders_reqfiles"].map((x) => DocumentfoldersReqfile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "documentfolders_id": documentfoldersId,
    "documentfolders_name": documentfoldersName,
    "documentfolders_filename": documentfoldersFilename,
    "documentfolders_detail": documentfoldersDetail,
    "documentfolders_required": documentfoldersRequired,
    "documentfolders_filecount": documentfoldersFilecount,
    "documentfolders_missingdoc": documentfoldersMissingdoc,
    "documentfolders_fileuploaded": documentfoldersFileuploaded,
    "documentfolders_makeopen": documentfoldersMakeopen,
    "documentfolders_files": List<dynamic>.from(documentfoldersFiles.map((x) => x)),
    "documentfolders_reqfiles": List<dynamic>.from(documentfoldersReqfiles.map((x) => x.toJson())),
  };
}

class DocumentfoldersReqfile {
  DocumentfoldersReqfile({
    this.id,
    this.customid,
    this.admincomment,
    this.name,
    this.description,
    this.req,
    this.filesx,
  });

  String id;
  String customid;
  String admincomment;
  String name;
  String description;
  String req;
  List<Filesx> filesx;

  factory DocumentfoldersReqfile.fromJson(Map<String, dynamic> json) => DocumentfoldersReqfile(
    id: json["id"],
    customid: json["customid"],
    admincomment: json["admincomment"],
    name: json["name"],
    description: json["description"],
    req: json["req"],
    filesx: List<Filesx>.from(json["filesx"].map((x) => Filesx.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customid": customid,
    "admincomment": admincomment,
    "name": name,
    "description": description,
    "req": req,
    "filesx": List<dynamic>.from(filesx.map((x) => x.toJson())),
  };
}

class Filesx {
  Filesx({
    this.studentfilesId,
    this.studentfilesMember,
    this.studentfilesDoc,
    this.studentfilesOdoc,
    this.studentfilesFilename,
    this.studentfilesAws,
    this.studentfilesFilepath,
    this.studentfilesSize,
    this.studentfilesAdminstatus,
    this.studentfilesAdmin,
    this.studentfilesRevtime,
  });

  String studentfilesId;
  String studentfilesMember;
  String studentfilesDoc;
  String studentfilesOdoc;
  String studentfilesFilename;
  String studentfilesAws;
  String studentfilesFilepath;
  String studentfilesSize;
  String studentfilesAdminstatus;
  String studentfilesAdmin;
  String studentfilesRevtime;

  factory Filesx.fromJson(Map<String, dynamic> json) => Filesx(
    studentfilesId: json["studentfiles_id"],
    studentfilesMember: json["studentfiles_member"],
    studentfilesDoc: json["studentfiles_doc"],
    studentfilesOdoc: json["studentfiles_odoc"],
    studentfilesFilename: json["studentfiles_filename"],
    studentfilesAws: json["studentfiles_aws"],
    studentfilesFilepath: json["studentfiles_filepath"],
    studentfilesSize: json["studentfiles_size"],
    studentfilesAdminstatus: json["studentfiles_adminstatus"],
    studentfilesAdmin: json["studentfiles_admin"],
    studentfilesRevtime: json["studentfiles_revtime"],
  );

  Map<String, dynamic> toJson() => {
    "studentfiles_id": studentfilesId,
    "studentfiles_member": studentfilesMember,
    "studentfiles_doc": studentfilesDoc,
    "studentfiles_odoc": studentfilesOdoc,
    "studentfiles_filename": studentfilesFilename,
    "studentfiles_aws": studentfilesAws,
    "studentfiles_filepath": studentfilesFilepath,
    "studentfiles_size": studentfilesSize,
    "studentfiles_adminstatus": studentfilesAdminstatus,
    "studentfiles_admin": studentfilesAdmin,
    "studentfiles_revtime": studentfilesRevtime,
  };
}



class Selectedcoursearr {
  Selectedcoursearr({
    this.id,
    this.name,
    this.dep,
  });

  String id;
  String name;
  String dep;

  factory Selectedcoursearr.fromJson(Map<String, dynamic> json) => Selectedcoursearr(
    id: json["id"],
    name: json["name"],
    dep: json["dep"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "dep": dep,
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

  String user;
  String parent;
  String fullname;
  String email;
  String pic;
  String jobtitle;
  String type;
  String deactivated;

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

import 'package:json_annotation/json_annotation.dart';

part 'dashboard_data.g.dart';

@JsonSerializable(includeIfNull: true)
class DashboardDataRes {
  String announcement;
  List<Applicationcount> applicationcount;
  Basic basic;
  List<Featureddegree> featureddegree;
  List<Instcountryper> instcountryper;
  List<Recentinst> recentinst;
  String status;
  List<Studentcount> studentcount;

  DashboardDataRes(
      this.announcement,
      this.applicationcount,
      this.basic,
      this.featureddegree,
      this.instcountryper,
      this.recentinst,
      this.status,
      this.studentcount);

  factory DashboardDataRes.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataResFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataResToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Applicationcount {
  int count;
  String name;

  Applicationcount(this.count, this.name);

  factory Applicationcount.fromJson(Map<String, dynamic> json) =>
      _$ApplicationcountFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationcountToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Basic {
  String fullname;
  String id;
  String name;
  String secondline;

  Basic(this.fullname, this.id, this.name, this.secondline);

  factory Basic.fromJson(Map<String, dynamic> json) => _$BasicFromJson(json);

  Map<String, dynamic> toJson() => _$BasicToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Featureddegree {
  @JsonKey(name: "degree_id")
  String degreeId;
  @JsonKey(name: "degree_name")
  String degreeName;
  @JsonKey(name: "degree_title")
  String degreeTitle;

  Featureddegree(this.degreeId, this.degreeName, this.degreeTitle);

  factory Featureddegree.fromJson(Map<String, dynamic> json) =>
      _$FeatureddegreeFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureddegreeToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Instcountryper {
  @JsonKey(name: "country_id")
  String countryId;
  @JsonKey(name: "country_name")
  String countryName;
  @JsonKey(name: "percentage")
  double percentage;
  String total;

  Instcountryper(this.countryId, this.countryName, this.percentage, this.total);

  factory Instcountryper.fromJson(Map<String, dynamic> json) =>
      _$InstcountryperFromJson(json);

  Map<String, dynamic> toJson() => _$InstcountryperToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Recentinst {
  @JsonKey(name: "country_name")
  String countryName;
  @JsonKey(name: "institutes_id")
  String institutesId;
  @JsonKey(name: "institutes_istest")
  dynamic institutesIstest;
  @JsonKey(name: "institutes_name")
  String institutesName;
  @JsonKey(name: "institutes_nickname")
  String institutesNickname;
  bool saved;

  Recentinst(this.countryName, this.institutesId, this.institutesIstest,
      this.institutesName, this.institutesNickname, this.saved);

  factory Recentinst.fromJson(Map<String, dynamic> json) =>
      _$RecentinstFromJson(json);

  Map<String, dynamic> toJson() => _$RecentinstToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Studentcount {
  int count;
  int id;
  String name;

  Studentcount(this.count, this.id, this.name);

  factory Studentcount.fromJson(Map<String, dynamic> json) =>
      _$StudentcountFromJson(json);

  Map<String, dynamic> toJson() => _$StudentcountToJson(this);
}

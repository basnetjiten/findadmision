import 'package:json_annotation/json_annotation.dart';
part 'app_check.g.dart';
@JsonSerializable()
class AppCheck {
  String androidurl;
  int androidver;
  List<Country> country;
  String countrycode;
  Map<String,String> countryids;
  List<List<int>> day;
  Map<String,String> dialingcodes;
  String ios;
  String iosurl;
  int iosver;
  List<List<String>> month;
  String uniquecode;
  bool uniqueurl;
  bool valid;
  String weburl;
  int webver;
  List<List<int>> year;
  List<Studentstatus> studentstatus;
  List<Budgetoption> budgetoptions;


  AppCheck(this.androidurl, this.androidver, this.country, this.countrycode,
      this.countryids, this.day, this.dialingcodes, this.ios, this.iosurl,
      this.iosver, this.month, this.uniquecode, this.uniqueurl, this.valid,
      this.weburl, this.webver, this.year,this.budgetoptions);

   factory AppCheck.fromJson(Map<String, dynamic> json) =>
      _$AppCheckFromJson(json);

  Map<String, dynamic> toJson() => _$AppCheckToJson(this);

  /*AppCheck.fromJSON(Map<String, dynamic> parsedJson) {
    this.androidurl = parsedJson['androidurl'];
    this.androidver = parsedJson['androidver'];
    this.country = parsedJson['country'];
    this.countrycode = parsedJson['countrycode'];
    this.countryids = parsedJson['countryids'];
    this.day = parsedJson['day'];
    this.dialingcodes = parsedJson['dialingcodes'];
    this.ios = parsedJson['ios'];
    this.iosurl = parsedJson['iosurl'];
    this.iosver = parsedJson['iosver'];
    this.month = parsedJson['month'];
    this.uniquecode = parsedJson['uniquecode'];
    this.uniqueurl = parsedJson['uniqueurl'];
    this.valid = parsedJson['valid'];
    this.weburl = parsedJson['weburl'];
    this.webver = parsedJson['webver'];
    this.year = parsedJson['year'];
  }*/
}



@JsonSerializable()
class Country {
  @JsonKey(name: "country_dialingcode")
  String countryDialingcode;
  @JsonKey(name: "country_id")
  String countryId;
  @JsonKey(name: "country_name")
  String countryName;
  @JsonKey(name: "country_shortcode")
  String countryShortcode;
  String dlkey;

  Country(this.countryDialingcode, this.countryId, this.countryName,
      this.countryShortcode, this.dlkey);

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);


}
@JsonSerializable()
class Studentstatus {
  int id;
  String name;

  Studentstatus(this.id, this.name);

  factory Studentstatus.fromJson(Map<String, dynamic> json) =>
      _$StudentstatusFromJson(json);

  Map<String, dynamic> toJson() => _$StudentstatusToJson(this);
}
@JsonSerializable()
class Budgetoption {
  int id;
  String name;
  Budgetoption(
    this.id,
    this.name,
  );

  factory Budgetoption.fromJson(Map<String, dynamic> json) =>
      _$BudgetoptionFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetoptionToJson(this);


}
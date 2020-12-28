import 'package:json_annotation/json_annotation.dart';
part 'office_list.g.dart';
@JsonSerializable()
class OfficeListResponse {
  @JsonKey(name: 'officelist')
  List<OfficeList> officeList;
  String status;

  OfficeListResponse(this.officeList, this.status);

  factory OfficeListResponse.fromJson(Map<String, dynamic> json) =>
      _$OfficeListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeListResponseToJson(this);
}
@JsonSerializable()
class OfficeList {
  @JsonKey(name: 'country_name')
  String countryName;
  @JsonKey(name: 'partneroffice_address')
  String partnerOfficeAddress;
  @JsonKey(name: 'partneroffice_city')
  String partnerOfficeCity;
  @JsonKey(name: 'partneroffice_contact')
  String partnerOfficeContact;
  @JsonKey(name: 'partneroffice_country')
  String partnerOfficeCountry;
  @JsonKey(name: 'partneroffice_id')
  String partnerOfficeId;

  OfficeList(
      this.countryName,
      this.partnerOfficeAddress,
      this.partnerOfficeCity,
      this.partnerOfficeContact,
      this.partnerOfficeCountry,
      this.partnerOfficeId);

  factory OfficeList.fromJson(Map<String, dynamic> json) =>
      _$OfficeListFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeListToJson(this);
}

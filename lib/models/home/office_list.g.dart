// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficeListResponse _$OfficeListResponseFromJson(Map<String, dynamic> json) {
  return OfficeListResponse(
    (json['officelist'] as List)
        ?.map((e) =>
            e == null ? null : OfficeList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['status'] as String,
  );
}

Map<String, dynamic> _$OfficeListResponseToJson(OfficeListResponse instance) =>
    <String, dynamic>{
      'officelist': instance.officeList,
      'status': instance.status,
    };

OfficeList _$OfficeListFromJson(Map<String, dynamic> json) {
  return OfficeList(
    json['country_name'] as String,
    json['partneroffice_address'] as String,
    json['partneroffice_city'] as String,
    json['partneroffice_contact'] as String,
    json['partneroffice_country'] as String,
    json['partneroffice_id'] as String,
  );
}

Map<String, dynamic> _$OfficeListToJson(OfficeList instance) =>
    <String, dynamic>{
      'country_name': instance.countryName,
      'partneroffice_address': instance.partnerOfficeAddress,
      'partneroffice_city': instance.partnerOfficeCity,
      'partneroffice_contact': instance.partnerOfficeContact,
      'partneroffice_country': instance.partnerOfficeCountry,
      'partneroffice_id': instance.partnerOfficeId,
    };

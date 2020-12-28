import 'package:json_annotation/json_annotation.dart';
part 'add_office.g.dart';
@JsonSerializable()
class AddOfficePostData {
  String address, contact, country, city;

  AddOfficePostData();

  Map<String, dynamic> toJson() => _$AddOfficePostDataToJson(this);
}

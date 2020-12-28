import 'package:json_annotation/json_annotation.dart';
part 'added_std_res.g.dart';
@JsonSerializable()
class StudentAddedResponse {
  StudentAddedResponse({
    this.status,
    this.lastaddedstudent,
    this.studentlist,
  });

  String status;
  int lastaddedstudent;
  List<AddedStudentList> studentlist;
  factory StudentAddedResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentAddedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentAddedResponseToJson(this);

}
@JsonSerializable()
class AddedStudentList {
  @JsonKey(name: 'completedcount')
  int completedCount;
  @JsonKey(name: 'incompletedcount')
  int inCompletedCount;
  @JsonKey(name: 'acceptedcount')
  int acceptedCount;
  @JsonKey(name: 'rejectedcount')
  int rejectedCount;
@JsonKey(name: 'members_firstname')
  String membersFirstname;
@JsonKey(name: 'members_lastname')
  String membersLastname;
@JsonKey(name: 'country_name')
  String countryName;
@JsonKey(name: 'members_pickey')
  String membersPickey;
  AddedStudentList(
      this.completedCount,
      this.inCompletedCount,
      this.acceptedCount,
      this.rejectedCount,
    this.membersFirstname,
    this.membersLastname,
    this.countryName,
    this.membersPickey,
  );


factory AddedStudentList.fromJson(Map<String, dynamic> json) =>
    _$AddedStudentListFromJson(json);

Map<String, dynamic> toJson() => _$AddedStudentListToJson(this);

}



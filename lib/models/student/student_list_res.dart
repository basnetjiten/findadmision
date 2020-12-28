import 'package:json_annotation/json_annotation.dart';

part 'student_list_res.g.dart';

@JsonSerializable()
class StudentListResponse {
  String status;
  List<Studentlist> studentlist;
  String cdnf;

  StudentListResponse(
    this.status,
    this.studentlist,
    this.cdnf,
  );

  factory StudentListResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentListResponseToJson(this);
}

@JsonSerializable()
class Studentlist {
  @JsonKey(name: 'completedcount')
  int completedCount;
  @JsonKey(name: 'incompletedcount')
  int inCompletedCount;
  @JsonKey(name: 'acceptedcount')
  int acceptedCount;
  @JsonKey(name: 'rejectedcount')
  int rejectedCount;
  @JsonKey(name: 'members_id')
  String membersId;
  @JsonKey(name: 'members_firstname')
  String membersFirstname;
  @JsonKey(name: 'members_lastname')
  String membersLastname;
  @JsonKey(name: 'country_name')
  String countryName;
  @JsonKey(name: 'members_pickey')
  String membersPickey;

  Studentlist(
      this.completedCount,
    this.inCompletedCount,
    this.acceptedCount,
    this.rejectedCount,
    this.membersId,
    this.membersFirstname,
    this.membersLastname,
    this.countryName,
    this.membersPickey,
  );

  factory Studentlist.fromJson(Map<String, dynamic> json) =>
      _$StudentlistFromJson(json);

  Map<String, dynamic> toJson() => _$StudentlistToJson(this);
}

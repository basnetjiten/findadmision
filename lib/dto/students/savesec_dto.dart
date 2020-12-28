
class SaveSecEduDto {
  SaveSecEduDto();

  String secawardCountry;
  String secawardId;
  String secawardIndex;
  String secawardName;
  String secawardStatus;
  String secdetAward;
  DateTime secdetEngdt;
  String secdetEngproid;
  String secdetEngpropt;
  String secdetEngprosid;
  String secdetEngprox;
  String secdetGradepoint;
  String secdetId;
  String secdetMember;
  String secdetOaward;
  String secdetSchool;
  int secdetYear;


  Map<String, dynamic> toJson() => {
    "secaward_country": secawardCountry ?? "",
    "secaward_id": secawardId ?? "",
    "secaward_index": secawardIndex ?? "",
    "secaward_name": secawardName ?? "",
    "secaward_status": secawardStatus ?? "",
    "secdet_award": secdetAward ?? "",
    "secdet_engdt": secdetEngdt.toIso8601String() ?? "",
    "secdet_engproid": secdetEngproid ?? "",
    "secdet_engpropt": secdetEngpropt ?? "",
    "secdet_engprosid": secdetEngprosid ?? "",
    "secdet_engprox": secdetEngprox ?? "",
    "secdet_gradepoint": secdetGradepoint ?? "",
    "secdet_id": secdetId ?? "",
    "secdet_member": secdetMember ?? "",
    "secdet_oaward": secdetOaward ?? "",
    "secdet_school": secdetSchool ?? "",
    "secdet_year": secdetYear ?? "",
  };
}

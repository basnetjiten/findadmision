class SaveHighEduDto {
  SaveHighEduDto();

  String highdetAward;
  String highdetCertificate;
  String highdetCor;
  String highdetGrade;
  String highdetGradepoint;
  String highdetId;
  String highdetMember;
  String highdetOaward;
  String highdetOcertificate;
  String highdetOcor;
  String highdetOgrade;
  String highdetReference;
  String highdetSchool;
  String highdetTranscript;
  int highdetYear;

  Map<String, dynamic> toJson() => {
        "highdet_award": highdetAward ?? "",
        "highdet_certificate": highdetCertificate ?? "",
        "highdet_cor": highdetCor ?? "",
        "highdet_grade": highdetGrade ?? "",
        "highdet_gradepoint": highdetGradepoint ?? "",
        "highdet_id": highdetId ?? "",
        "highdet_member": highdetMember ?? "",
        "highdet_oaward": highdetOaward ?? "",
        "highdet_ocertificate": highdetOcertificate ?? "",
        "highdet_ocor": highdetOcor ?? "",
        "highdet_ograde": highdetOgrade ?? "",
        "highdet_reference": highdetReference ?? "",
        "highdet_school": highdetSchool ?? "",
        "highdet_transcript": highdetTranscript,
        "highdet_year": highdetYear ?? "",
      };
}

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/students/course/course_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/education/high/std_high_educ_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/education/other/std_other_edu_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/education/sec/std_sec_edu_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/first_step/finish_first_step_bloc.dart';
import 'package:findadmissionaffiliate/dto/students/first_step_dto.dart';
import 'package:findadmissionaffiliate/dto/students/std_selected_course.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/year_grad_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/pte_dropdowm.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/grade_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/transcript_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/degree_receive_dd.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/reference_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/profile/profile.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

int otherStartDate;
Degree otherStudyLevel;

Reference otherReference;
Transcript otherTranscript;
Engpro otherEngPro;
Award otherAward;
int otherYear;
Grade otherGrade;

final greyTextStyle = AppTheme.termsInfoText
    .copyWith(color: AppTheme.locationTxtColor, fontWeight: FontWeight.w400);
final heading = AppTheme.studentLabelStyle
    .copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800);
final subHeading = AppTheme.studentLabelStyle
    .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700);
SizedBox gap20box = const SizedBox(
  height: 20,
);

class StepThreeEdu extends StatefulWidget {
  final ValueChanged<int> onFormFilled;
  final String stdId;
  final StdLoadDataRes stdLoadData;
  final String countryCode;

  StepThreeEdu(
      {this.stdId, this.onFormFilled, this.stdLoadData, this.countryCode});

  @override
  _StepThreeEduState createState() => _StepThreeEduState();
}

class _StepThreeEduState extends State<StepThreeEdu> {
  final GlobalKey<FormBuilderState> stepThreeEduFormKey =
      GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> stepOtherEduFormKey =
      GlobalKey<FormBuilderState>();
  List<StudentCountry> _initialSelectedCountry = [];
  StdCourseBloc _stdCourseBloc;
  FinishFirstStepBloc _finishFirstStepBloc;
  bool addAnotherEducation = false;
  StdHighEducBloc stdHigEducBloc;
  StdSecEduBloc stdSecEduBloc;
  StdOtherEduBloc stdOtherEduBloc;

  //List<String> selectedCourses = [];
  StdSelectedCourse _stdSelectedCourse;
  FirstStepDto _firstStepDto;
  int startDate;
  Degree studyLevel;
  int startBudget, endBudget;
  Reference reference;
  Transcript transcript;
  Engpro engPro;
  Award award;
  int secYear;
  int highYear;
  Grade grade;

  @override
  void initState() {
    stdOtherEduBloc= StdOtherEduBloc();
    stdHigEducBloc = StdHighEducBloc();
    stdSecEduBloc = StdSecEduBloc();
    reference = widget.stdLoadData.reference[0];
    transcript = widget.stdLoadData.transcript[0];
    engPro = widget.stdLoadData.engpro[0];
    award = widget.stdLoadData.award[0];
    int secYear;
    int highYear;
    grade = widget.stdLoadData.grade[0];

    _stdCourseBloc = StdCourseBloc();
    _finishFirstStepBloc = FinishFirstStepBloc();
    _stdSelectedCourse = getIt<StdSelectedCourse>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FormBuilder(
        key: stepThreeEduFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "STEP3: EDUCATION",
              style: heading,
            ),
            gap20box,
            Text(
              "Secondary Education",
              style: AppTheme.profileInfoStyle.copyWith(
                  color: AppTheme.cardTitleTxtColor,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "High School / College Attended",
              style: AppTheme.studentLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              initialValue: saveSecDto.secdetSchool != null
                  ? saveSecDto.secdetSchool
                  : '',
              autofocus: false,
              autovalidateMode: AutovalidateMode.disabled,
              attribute: "seccollege",
              autocorrect: false,
              validators: [FormBuilderValidators.required()],
              decoration: AppWidgetHelper.buildInputDecoration(),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
            ),
            gap20box,
            Text(
              "Year of Graduation",
              style: AppTheme.studentLabelStyle
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            gap20box,
            Container(
              width: sizeConfig.screenWidth,
              child: GraduationYearDD(
                year: widget.stdLoadData.year,
                onYearChange: onSecGradChange,
              ),
            ),
            gap20box,
            Text(
              "Grade Achieved",
              style: AppTheme.studentLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              initialValue: saveSecDto.secdetGradepoint != null
                  ? saveSecDto.secdetGradepoint
                  : '',
              autofocus: false,
              autovalidateMode: AutovalidateMode.disabled,
              attribute: "secgrade",
              autocorrect: false,
              validators: [FormBuilderValidators.required()],
              decoration: AppWidgetHelper.buildInputDecoration(),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
            ),
            gap20box,

            Text(
              "English Language Qualification (Optional)",
              style: AppTheme.studentLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: sizeConfig.screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PteDropDown(
                  engPro: widget.stdLoadData.engpro,
                  onPteChanged: onEngProChanged,
                ),
              ),
            ),
            Text(
              "(It may be required for students in non-English-speaking countries)",
              style: AppTheme.studentLabelStyle,
            ),
            gap20box,
            AppWidgetHelper.divider(),
            gap20box,
            Text(
              "Higher Education",
              style: AppTheme.profileInfoStyle.copyWith(
                  color: AppTheme.cardTitleTxtColor,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "College / University Attended",
              style: AppTheme.studentLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              /*initialValue: stepTwoFundingDto.passport != null
                  ? stepTwoFundingDto.passport
                  : '',*/
              autofocus: false,
              autovalidateMode: AutovalidateMode.disabled,
              attribute: "highcollege",
              autocorrect: false,
              validators: [FormBuilderValidators.required()],
              decoration: AppWidgetHelper.buildInputDecoration(),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
            ),
            gap20box,
            Text(
              "Degree Received",
              style: AppTheme.studentLabelStyle
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            gap20box,
            Container(
              width: sizeConfig.screenWidth,
              child: DegreeReceiveDropDown(
                award: widget.stdLoadData.award,
                onAwardChange: onAwardChange,
              ),
            ),
            gap20box,
            Text(
              "Course Title (Area of Study)",
              style: AppTheme.studentLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              /*initialValue: stepTwoFundingDto.passport != null
                  ? stepTwoFundingDto.passport
                  : '',*/
              autofocus: false,
              autovalidateMode: AutovalidateMode.disabled,
              attribute: "courseTitle",
              autocorrect: false,
              validators: [FormBuilderValidators.required()],
              decoration: AppWidgetHelper.buildInputDecoration(),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
            ),
            gap20box,
            Text(
              "Year of Graduation",
              style: AppTheme.studentLabelStyle
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            gap20box,
            Container(
              width: sizeConfig.screenWidth,
              child: GraduationYearDD(
                year: widget.stdLoadData.year,
                onYearChange: onHighGradChange,
              ),
            ),
            gap20box,
            Text(
              "Grade Achieved",
              style: AppTheme.studentLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: sizeConfig.screenWidth,
              child: GradeDropDown(
                grade: widget.stdLoadData.grade,
                onGradeChange: onGradeChange,
              ),
            ),
            gap20box,
            Text(
              "GPA (Optional)",
              style: AppTheme.studentLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              /*initialValue: stepTwoFundingDto.passport != null
                  ? stepTwoFundingDto.passport
                  : '',*/
              autofocus: false,
              autovalidateMode: AutovalidateMode.disabled,
              attribute: "passport",
              autocorrect: false,
              validators: [FormBuilderValidators.required()],
              decoration: AppWidgetHelper.buildInputDecoration(),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
            ),
            gap20box,
            Text(
              "Is Your Transcript Available?",
              style: AppTheme.studentLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: sizeConfig.screenWidth,
              child: TranscriptDropDown(
                tranacript: widget.stdLoadData.transcript,
                onTranscriptChange: (value) {},
              ),
            ),
            gap20box,
            Text(
              "Reference Letter Status",
              style: AppTheme.studentLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: sizeConfig.screenWidth,
              child: ReferenceDropDown(
                reference: widget.stdLoadData.reference,
                onReferenceChange: onReferenceChange,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "You will need 2 reference letters",
              style: AppTheme.studentLabelStyle,
            ),
            gap20box,
            Visibility(
                visible: addAnotherEducation,
                child: OtherEducation(
                  formKey: stepOtherEduFormKey,
                  stdLoadData: widget.stdLoadData,
                )),
            Offstage(
              offstage: addAnotherEducation,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        addAnotherEducation = true;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppTheme.checkBoxCheckedColor,
                        border:
                            Border.all(color: AppTheme.checkBoxCheckedColor),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    "Add Other Education",
                    style: AppTheme.studentLabelStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.checkBoxCheckedColor),
                  )
                ],
              ),
            ),
            gap20box,
            Column(
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                          width: 0.5, color: AppTheme.btnBorderColor)),
                  // color: Colors.white,
                  minWidth: 340,
                  height: 50,
                  textColor: Colors.white,
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (stepThreeEduFormKey.currentState.saveAndValidate()) {
                      setSecDtoValue();
                      setHighDtoValue();
                    }

                    if (stepOtherEduFormKey.currentState != null) {
                      if (stepOtherEduFormKey.currentState.saveAndValidate()) {
                        setOtherDtoValue();
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: AppTheme.instituteTextColor,
                  minWidth: 340,
                  height: 50,
                  textColor: Colors.white,
                  child: Text(
                    "Save and Next",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (stepThreeEduFormKey.currentState.saveAndValidate()) {
                      setSecDtoValue();
                      setHighDtoValue();
                    }

                    if (stepOtherEduFormKey.currentState != null) {
                      if (stepOtherEduFormKey.currentState.saveAndValidate()) {
                        setOtherDtoValue();
                      }
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedCourseChip(List<Selectedcoursearr> selectedCourses) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 8.0,
      // gap between adjacent chips
      //runSpacing: 4.0, // gap between lines
      children: <Widget>[
        for (int i = 0; i < selectedCourses.length; i++)
          if (selectedCourses[i].id != null)
            Row(
              children: [
                Chip(
                  deleteIcon: Icon(
                    CupertinoIcons.delete,
                    color: Colors.white,
                  ),
                  onDeleted: () {
                    setState(() {
                      selectedCourses.removeAt(i);
                    });
                  },
                  label: Text(
                    selectedCourses[i].name,
                    style: AppTheme.chipStyle.copyWith(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(
                        width: 0.5,
                        color: AppTheme.instituteTextColor,
                      )),
                  backgroundColor: AppTheme.instituteTextColor,
                ),
              ],
            ),
      ],
    );
  }

  void onDegreeSelected(Degree value) {
    setState(() {
      studyLevel = value;
    });
  }

  void onSecGradChange(int value) {
    setState(() {
      startDate = value;
    });
  }

  void onBudgetEndChanged(String value) {
    setState(() {
      endBudget = int.parse(value);
    });
  }

  void onBudgetStartChange(String value) {
    setState(() {
      startBudget = int.parse(value);
    });
  }

  void onReferenceChange(Reference value) {
    setState(() {
      reference = value;
    });
  }

  void onHighGradChange(int value) {
    setState(() {
      highYear = value;
    });
  }

  void onEngProChanged(Engpro value) {
    setState(() {
      engPro = value;
    });
  }

  void onAwardChange(Award value) {
    setState(() {
      award = value;
    });
  }

  void onGradeChange(Grade value) {
    setState(() {
      grade = value;
    });
  }

  void setSecDtoValue() {
    saveSecDto.secawardName = award.highawardName;
    saveSecDto.secawardId = "";
    saveSecDto.secawardCountry = widget.countryCode;
    saveSecDto.secawardName = "";
    saveSecDto.secawardStatus = "";
    saveSecDto.secawardIndex = "";
    saveSecDto.secdetSchool = stepThreeEduFormKey
        .currentState.fields["seccollege"].currentState.value;
    //saveSecDto.secdetAward=widget.stdLoadData.secdet["secdet_award"];
    // saveSecDto.secdetEngdt=widget.stdLoadData.secdet["secdet_engdt"];
    saveSecDto.secdetEngproid = engPro.engproId;
    saveSecDto.secdetEngprox = "";
    saveSecDto.secdetGradepoint = grade.requirementId;
    saveSecDto.secdetId = "";
    saveSecDto.secdetMember = widget.stdLoadData.myid;

    /*secdet_id: ""
    secdet_member: ""
    secdet_oaward: "Awarding Body"
    secdet_school: "High School / College Attended"*/
    // secdet_year: sec;
    saveSecDto.secdetYear = secYear;

    stdSecEduBloc
        .add(AddSecEdu(saveSecEduDto: saveSecDto, stdId: widget.stdId));
  }

  void setHighDtoValue() {
    saveHighDto.highdetTranscript = transcript.transcriptId;
    saveHighDto.highdetYear = highYear;
    saveHighDto.highdetSchool = stepThreeEduFormKey
        .currentState.fields["highcollege"].currentState.value;
    saveHighDto.highdetReference = reference.referenceId;
    saveHighDto.highdetOaward = award.highawardId;
    saveHighDto.highdetGrade = grade.requirementId;
    saveHighDto.highdetOcor = stepThreeEduFormKey
        .currentState.fields["courseTitle"].currentState.value;
    saveHighDto.highdetMember = widget.stdLoadData.myid;
    print(saveHighDto.toJson().toString());
    stdHigEducBloc
        .add(AddHighEdu(saveHighEduDto: saveHighDto, stdId: widget.stdId));
  }

  void setOtherDtoValue() {
    saveOtherEduDto.highdetTranscript = transcript.transcriptId;
    saveOtherEduDto.highdetYear = highYear;
    saveOtherEduDto.highdetSchool = stepThreeEduFormKey
        .currentState.fields["other_college"].currentState.value;
    saveOtherEduDto.highdetReference = reference.referenceId;
    saveOtherEduDto.highdetOaward = award.highawardId;
    saveOtherEduDto.highdetGrade = grade.requirementId;
    saveOtherEduDto.highdetOcor = stepThreeEduFormKey
        .currentState.fields["other_courseTitle"].currentState.value;
    saveOtherEduDto.highdetMember = widget.stdLoadData.myid;
    print(saveOtherEduDto.toJson().toString());
    stdOtherEduBloc.add(AddOtherEdu(stdId: widget.stdId,saveOtherEduDto: saveOtherEduDto));
  }
}

class OtherEducation extends StatefulWidget {
  final StdLoadDataRes stdLoadData;
  final formKey;

  OtherEducation({this.stdLoadData, this.formKey});

  @override
  _OtherEducationState createState() => _OtherEducationState();
}

class _OtherEducationState extends State<OtherEducation> {
  @override
  void initState() {
    otherStudyLevel = widget.stdLoadData.degree[0];
    otherReference = widget.stdLoadData.reference[0];
    otherTranscript = widget.stdLoadData.transcript[0];
    otherEngPro = widget.stdLoadData.engpro[0];
    otherAward = widget.stdLoadData.award[0];
    otherYear = widget.stdLoadData.year[0];
    otherGrade = widget.stdLoadData.grade[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Other Education",
            style: AppTheme.profileInfoStyle.copyWith(
                color: AppTheme.cardTitleTxtColor, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "College / University Attended",
            style: AppTheme.studentLabelStyle,
          ),
          SizedBox(
            height: 10,
          ),
          FormBuilderTextField(
            /*initialValue: stepTwoFundingDto.passport != null
                    ? stepTwoFundingDto.passport
                    : '',*/
            autofocus: false,
            autovalidateMode: AutovalidateMode.disabled,
            attribute: "other_college",
            autocorrect: false,
            validators: [FormBuilderValidators.required()],
            decoration: AppWidgetHelper.buildInputDecoration(),
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
          ),
          gap20box,
          Text(
            "Degree Received",
            style: AppTheme.studentLabelStyle
                .copyWith(fontWeight: FontWeight.w400),
          ),
          gap20box,
          Container(
            width: sizeConfig.screenWidth,
            child: DegreeReceiveDropDown(
              award: widget.stdLoadData.award,
              onAwardChange: onAwardChange,
            ),
          ),
          gap20box,
          Text(
            "Course Title (Area of Study)",
            style: AppTheme.studentLabelStyle,
          ),
          SizedBox(
            height: 10,
          ),
          FormBuilderTextField(
            /*initialValue: stepTwoFundingDto.passport != null
                    ? stepTwoFundingDto.passport
                    : '',*/
            autofocus: false,
            autovalidateMode: AutovalidateMode.disabled,
            attribute: "other_courseTitle",
            autocorrect: false,
            validators: [FormBuilderValidators.required()],
            decoration: AppWidgetHelper.buildInputDecoration(),
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
          ),
          gap20box,
          Text(
            "Year of Graduation",
            style: AppTheme.studentLabelStyle
                .copyWith(fontWeight: FontWeight.w400),
          ),
          gap20box,
          Container(
            width: sizeConfig.screenWidth,
            child: GraduationYearDD(
              year: widget.stdLoadData.year,
              onYearChange: onHighGradChange,
            ),
          ),
          gap20box,
          Text(
            "Grade Achieved",
            style: AppTheme.studentLabelStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: sizeConfig.screenWidth,
            child: GradeDropDown(
              grade: widget.stdLoadData.grade,
              onGradeChange: onGradeChange,
            ),
          ),
          gap20box,
          Text(
            "GPA (Optional)",
            style: AppTheme.studentLabelStyle,
          ),
          SizedBox(
            height: 10,
          ),
          FormBuilderTextField(
            /* initialValue: saveOtherEduDto.g != null
                    ? stepTwoFundingDto.gpa
                    : '',*/
            autofocus: false,
            autovalidateMode: AutovalidateMode.disabled,
            attribute: "other_gpa",
            autocorrect: false,
            validators: [FormBuilderValidators.required()],
            decoration: AppWidgetHelper.buildInputDecoration(),
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
          ),
          gap20box,
          Text(
            "Is Your Transcript Available?",
            style: AppTheme.studentLabelStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: sizeConfig.screenWidth,
            child: TranscriptDropDown(
              tranacript: widget.stdLoadData.transcript,
              onTranscriptChange: (value) {},
            ),
          ),
          gap20box,
          Text(
            "Reference Letter Status",
            style: AppTheme.studentLabelStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: sizeConfig.screenWidth,
            child: ReferenceDropDown(
              reference: widget.stdLoadData.reference,
              onReferenceChange: onReferenceChange,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "You will need 2 reference letters",
            style: AppTheme.studentLabelStyle,
          ),
          gap20box,
        ],
      ),
    );
  }

  void onReferenceChange(Reference value) {
    setState(() {
      otherReference = value;
    });
  }

  void onHighGradChange(int value) {
    setState(() {
      otherYear = value;
    });
  }

  void onEngProChanged(Engpro value) {
    setState(() {
      otherEngPro = value;
    });
  }

  void onAwardChange(Award value) {
    setState(() {
      otherAward = value;
    });
  }

  void onGradeChange(Grade value) {
    setState(() {
      otherGrade = value;
    });
  }
}

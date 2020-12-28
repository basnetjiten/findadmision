import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/students/student_load_data/std_load_data_bloc.dart';
import 'package:findadmissionaffiliate/dto/stepper_btn_cmd.dart';
import 'package:findadmissionaffiliate/dto/students/funding_dto.dart';
import 'package:findadmissionaffiliate/dto/students/savehigh_dto.dart';
import 'package:findadmissionaffiliate/dto/students/savesec_dto.dart';
import 'package:findadmissionaffiliate/dto/students/saveother_edu_dto.dart';
import 'package:findadmissionaffiliate/dto/students/std_selected_course.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/custom_stepper_two.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/application_step_two.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/doc_upload_form.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/work_experience_form.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/profile/review_page.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/steps/std_file_upload.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/steps/step_one_my_plan.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/steps/std_work_exp_step.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/steps/step_three_edu.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/steps/step_two_funding_info.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
SaveSecEduDto saveSecDto;
SaveHighEduDto saveHighDto;
SaveOtherEduDto saveOtherEduDto;
StepTwoFundingDto stepTwoFundingDto;
class StudentProfile extends StatefulWidget {
  final String stdId, country;

  StudentProfile({this.stdId, this.country});

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  StdSelectedCourse _stdSelectedCourse;
  int _currentStep = 0;
  final greyTextStyle = AppTheme.termsInfoText
      .copyWith(color: AppTheme.locationTxtColor, fontWeight: FontWeight.w400);
  final heading = AppTheme.studentLabelStyle
      .copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800);
  final subHeading = AppTheme.studentLabelStyle
      .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700);
  StepperCommand stepperCommand =
      StepperCommand(pageIndex: 1, cancelOrContinue: false);
  SizedBox gap20box = const SizedBox(
    height: 20,
  );

  Widget profilePage;
  List<Widget> stepperPages = [];
  StdLoadDataBloc stdLoadDataBloc;

  @override
  void initState() {
    stepTwoFundingDto = StepTwoFundingDto();
    saveSecDto = SaveSecEduDto();
    saveHighDto = SaveHighEduDto();
    saveOtherEduDto = SaveOtherEduDto();
    _stdSelectedCourse = getIt<StdSelectedCourse>();

    stdLoadDataBloc = StdLoadDataBloc()
      ..add(FetchStdLoadData(stdId: widget.stdId));

    super.initState();
  }

  List<NextStep> _firstTwoSteps() {
    print("STEPSS NOW" + _currentStep.toString());
    List<NextStep> steps = [
      NextStep(
        stepNumber: 1,
        isActive: _currentStep >= 0,
        title: "STEP1",
        subtitle: "MY PLAN",
      ),
      NextStep(
        stepNumber: 2,
        isActive: _currentStep >= 1,
        title: "STEP2",
        subtitle: "FUNDING INFORMATION",
      ),
      NextStep(
        stepNumber: 3,
        isActive: _currentStep >= 2,
        title: "STEP3",
        subtitle: "EDUCATION",
      )
    ];
    return steps;
  }

  List<NextStep> _lasTwoTwoSteps() {
    List<NextStep> steps = [
      NextStep(
        stepNumber: 4,
        isActive: _currentStep >= 3,
        title: "STEP4",
        subtitle: "WORK EXPERIENCE",
      ),
      NextStep(
        isActive: _currentStep >= 4,
        stepNumber: 5,
        title: "STEP5",
        subtitle: "REQUIRED DOCUMENTS",
      ),
      NextStep(
        isActive: _currentStep >= 5,
        stepNumber: 6,
        title: "",
        subtitle: "REVIEW",
      )
    ];
    return steps;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        top: false,
        child: BlocBuilder<StdLoadDataBloc, StdLoadDataState>(
            cubit: stdLoadDataBloc,
            // ignore: missing_return
            builder: (context, state) {
              if (state is StdLoadDataInitial) {
                return AppWidgetHelper.loadingIndicator();
              }
              if (state is StdDataLoaded) {
                final stdLoadData = state.stdLoadDataRes;
                stepperPages = [
                  StepOneMyPlanPage(stdLoadData: stdLoadData,onFormFilled: onSaveAndNextContinue,),
                  StepTwoFundingForm(
                    stdLoadDataRes: stdLoadData,
                    showCheckBox: false,
                    onFormFilled:onSaveAndNextContinue ,
                    adjustablePadding: 0,
                  ),
                  StepThreeEdu(
                    stdId:widget.stdId,
                    stdLoadData: stdLoadData,
                    countryCode: widget.country,

                  ),
                  StdWorkExperienceForm(
                    stdId: stdLoadData.myid,
                    adjustableHeight: 0,
                  ),
                  StdDocUploadForm(
                    adjustableHeight: 0,
                  ),
                  PreviewPage(
                    backToStepper: onFirstFormFilled,
                  ),
                ];
                return Container(
                    color: AppTheme.greyBackground,
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: sizeConfig.screenHeight * 0.15,
                                left: 15,
                                right: 15,
                                bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ProfileCard(
                                    stdLoadData: stdLoadData,
                                    country: widget.country),
                                SizedBox(
                                  height: 20,
                                ),
                                Material(
                                  borderOnForeground: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0)),
                                  elevation: 1,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        color: Colors.white,
                                        height: 250,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 4,
                                            ),
                                            NextStepper(
                                              onStepTapped: onStepContinue,
                                              currentStep: this._currentStep,
                                              steps: _firstTwoSteps(),
                                              // onStepContinue: onStepContinue,
                                            ),
                                            NextStepper(
                                              onStepTapped: onThirdStepContinue,
                                              currentStep: _currentStep,
                                              steps: _lasTwoTwoSteps(),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 35),
                                        child: AppWidgetHelper.divider(),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      stepperPages[_currentStep],
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
              }
            }));
  }


  void onStepContinue(int value) {
    print("TEST STEP NUMBER" + value.toString());
    switch (value) {
      case 1:
        setState(() {
          _currentStep = 0;
        });
        break;
      case 2:
        setState(() {
          _currentStep = 1;
        });
        break;
      case 3:
        setState(() {
          _currentStep = 2;
        });
        break;
    }
  }
  void onSaveAndNextContinue(int value) {
    print("TEST STEP NUMBER" + value.toString());
    switch (value) {
      case 1:
        setState(() {
          _currentStep = 1;
        });
        break;
      case 2:
        setState(() {
          _currentStep = 2;
        });
        break;
      case 3:
        setState(() {
          _currentStep =3;
        });
        break;
      case 4:
        setState(() {
          _currentStep = 4;
        });
        break;
      case 5:
        setState(() {
          _currentStep = 5;
        });
        break;
    }
  }

  void onThirdStepContinue(int value) {
    switch (value) {
      case 4:
        setState(() {
          _currentStep = 3;
        });
        break;
      case 5:
        setState(() {
          _currentStep = 4;
        });
        break;
      case 6:
        setState(() {
          _currentStep = 5;
        });
        break;
    }
  }

  void onFirstFormFilled(int value) {
    setState(() {
      _currentStep = 4;
    });
  }

  void permissionToUseProfileData(bool value) {}

  void onCourseStatusChanged(StepperCommand value) {}
}

class ProfileCard extends StatelessWidget {
  final StdLoadDataRes stdLoadData;
  final String country;

  ProfileCard({this.stdLoadData, this.country});

  final heading = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w800);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 121,
        width: sizeConfig.screenWidth,
        child: Material(
          borderOnForeground: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(CupertinoIcons.back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text("Profile", style: heading),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: RichText(
                      text: new TextSpan(children: [
                    TextSpan(
                        text: stdLoadData.fullname,
                        style: AppTheme.instituteStyle.copyWith(
                            fontSize: 16,
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.w800)),
                    TextSpan(
                        text: "  " + country + " | " + stdLoadData.myid,
                        style: AppTheme.instituteStyle.copyWith(
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.w400)),
                  ])), /*Text("Viktoria Meza  Algeria | 59693 ")*/
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ));
  }
}



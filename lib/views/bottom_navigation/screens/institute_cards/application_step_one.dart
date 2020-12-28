import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/apply_application/apply_application_bloc.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/institutes/work_exp/work_exp_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/student_bloc/add_students_bloc.dart';
import 'package:findadmissionaffiliate/dto/institutes/apply/step_one_dto.dart';
import 'package:findadmissionaffiliate/dto/stepper_btn_cmd.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/custom_stepper.dart';
import 'package:findadmissionaffiliate/helpers/loading_indicator_dialog.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/institute/loaddata_label.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:findadmissionaffiliate/utils/affiliate_methods.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/application_step_two.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/doc_upload_form.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/dropdowns/degree_program.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/dropdowns/funding_source.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/step_one/family_friend_form.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/step_one/gov_org_form.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/preview_page.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/work_experience_form.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

StepOneDto stepOneDto;

class ApplicationStepOne extends StatefulWidget {
  final InstituteDetailRes institute;
  final String univ;
  final bool fromStudentApply;
  final Studentlist student;

  ApplicationStepOne(
      {this.institute, this.univ, this.fromStudentApply, this.student});

  @override
  _ApplicationStepOneState createState() => _ApplicationStepOneState();
}

class _ApplicationStepOneState extends State<ApplicationStepOne> {
  final GlobalKey stepOneKey = GlobalKey();
  final GlobalKey checkBoxKey = GlobalKey();
  bool userProfileDataSet = false;
  bool checkBoxChecked = false;
  Studentlist selectedStudent;
  bool useProfileData = false;
  Widget instituteDetailPage;
  int stepperPageIndex = 0;
  int _currentStep = 0;
  bool stepperThree = false;
  bool stepperFour = false;
  List<Widget> stepperPages;
  PageController _controller = new PageController();
  double adjustableHeight = sizeConfig.screenHeight * 0.27;
  double fixedHeight = sizeConfig.screenHeight * 0.14;
  String fundingDropDownSelectedId = loadDataLabel.funding[0].fundingId;

  String selectedStartDate;
  Map<String, dynamic> pageData = {};

  @override
  void initState() {
    if (widget.student != null) {
      selectedStudent = widget.student;
    }
    workExpSubmittedRes = null;
    stepOneDto = StepOneDto();
    stepperPages = [stepOneInformationFormPage()];
    super.initState();
  }

  StepOneInformationForm stepOneInformationFormPage() {
    return StepOneInformationForm(
      fromStudentApply:
          widget.fromStudentApply,
      userProfileDataSet: userProfileDataSet,
       univ: widget.univ,
      instDetail: widget.institute,
      checkBoxKey: checkBoxKey,
      selectedStudent: selectedStudent,
      selectedFundingId: fundingDropDownSelectedId,
      onFormFilled: onFirstFormFilled,
      showCheckBox: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    instituteDetailPage = Material(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: AppTheme.greyBackground,
      body: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          // height: sizeConfig.screenHeight,
          width: sizeConfig.screenWidth,
          child: SingleChildScrollView(
              child: Stack(fit: StackFit.loose, children: [
            Column(
              children: [
                SizedBox(
                  height: sizeConfig.screenHeight * 0.4,
                ),
                /* Container(
                          height: sizeConfig.screenHeight,
                          width: sizeConfig.screenWidth,
                          child: PageView(
                            controller: _controller,
                            children: <Widget>[
                              StepOneInformationForm(
                                onFormFilled: onFirstFormFilled,
                                userProfileData: permissionToUseProfileData,
                              ),
                              StepTwoApplicationForm(
                                onCoursesStatusChanged: onFormFilled,
                              ),

                              DocUploadFormFour()
                            ],
                            onPageChanged: (page) {
                              setState(() {
                                _currentStep = page;
                              });
                            },
                          ),
                        )*/
                stepperPages[_currentStep]
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: sizeConfig.screenHeight * 0.132),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            widget.institute.details.institutesCoverurl))),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: (useProfileData && _currentStep >= 1)
                      ? sizeConfig.screenHeight * 0.20
                      : sizeConfig.screenHeight * 0.22,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizeConfig.screenWidth * 0.06),
                  child: Text(
                    widget.institute.details.name,
                    style: GoogleFonts.workSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0)),
                    textScaleFactor: 1.0,
                    key: stepOneKey,
                  ),
                ),
                SizedBox(
                  height: (useProfileData && _currentStep >= 1)
                      ? sizeConfig.screenHeight * 0.04
                      : sizeConfig.screenHeight * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.3),
                  child: Material(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    elevation: 1,
                    child: Container(
                      color: Colors.white,
                      height: (useProfileData && _currentStep >= 1) ? 220 : 176,
                      width: 340,
                      child: Column(
                        children: [
                          (useProfileData && _currentStep >= 1)
                              ? Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    color: AppTheme.checkBoxCheckedColor,
                                    height: 50,
                                    width: 340,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 18,
                                            ),
                                            Text(
                                              selectedStudent.membersFirstname +
                                                  " " +
                                                  selectedStudent
                                                      .membersLastname,
                                              style: AppTheme.helperLabelStyle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14.0),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          child: Icon(
                                            Icons.navigate_next,
                                            size: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              : SizedBox(
                                  height: 0,
                                  width: 0,
                                ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomStepper(
                            currentStep: this._currentStep,
                            steps: _firstTwoSteps(),
                            onStepContinue: onStepContinue,
                          ),
                          CustomStepper(
                            currentStep: _currentStep + 1,
                            steps: _lasTwoTwoSteps(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                widget.fromStudentApply
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        key: checkBoxKey,
                                        activeColor:
                                            AppTheme.checkBoxCheckedColor,
                                        value: true,
                                        onChanged: null),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Text(
                                      "Apply Information from My Profile",
                                      style: AppTheme.profileInfoStyle.copyWith(
                                          fontSize: 14.0,
                                          color: AppTheme.cardTitleTxtColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      selectedStudent.membersFirstname +
                                          " " +
                                          selectedStudent.membersLastname,
                                      style: TextStyle(
                                          color: Color(0xff191919),
                                          fontSize: 15.0),
                                    ),
                                    Text(
                                      "Account ID:" +
                                          " " +
                                          selectedStudent.membersId,
                                      style: TextStyle(
                                          color: Color(0xff8E8E8E),
                                          fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AppWidgetHelper.divider(),
                          ],
                        ),
                      )
                    : Offstage(
                        offstage: selectedStudent != null && _currentStep >= 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        key: checkBoxKey,
                                        activeColor:
                                            AppTheme.checkBoxCheckedColor,
                                        value: userProfileDataSet,
                                        onChanged: (value) {
                                          Scrollable.ensureVisible(
                                              stepOneKey.currentContext,
                                              alignment: 0.0,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.linear);
                                          setState(() {
                                            //checkBoxChecked = !checkBoxChecked;
                                            userProfileDataSet =
                                                !userProfileDataSet;
                                            /*permissionToUseProfileData(
                                          userProfileDataSet);*/
                                            useProfileData = !useProfileData;
                                            if (!useProfileData) {
                                              selectedStudent = null;
                                              stepperPages.insert(0,
                                                  stepOneInformationFormPage());
                                            }
                                          });
                                        }),
                                  ),
                                  Text(
                                    "Apply Information from My Student",
                                    style: AppTheme.profileInfoStyle.copyWith(
                                        fontSize: 14.0,
                                        color: AppTheme.cardTitleTxtColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppWidgetHelper.divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                  visible: userProfileDataSet,
                                  child: AutoComplete(
                                    selectedStudent: onStudentSelected,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ]))),
    ));
    return instituteDetailPage;
    /*Stack(
        children: [
          Container(
            height: 280,
            width: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/malaya.jpg")
                )
            ),
          ),
          Text("College Name"),




        ],
      ),*/
  }

/*  void onStepperChange(int value) {
    setState(() {
      stepperPageIndex = value;
    });
  }*/

  void onFirstFormFilled(Map<String, dynamic> value) {
    if (_currentStep < this._firstTwoSteps().length - 1) {
      setState(() {
        pageData = value;
        this._currentStep = this._currentStep + value["page"];
        //print("FIRST FORM CURRENT STEP" + this._currentStep.toString());
        // _controller.jumpToPage(value);
      });
    }
  }

  List<CustomStep> _firstTwoSteps() {
    List<CustomStep> steps = [
      CustomStep(
        stepNumber: 1,
        isActive: _currentStep >= 0,
        title: "STEP1",
        subtitle: "INFORMATION",
      ),
      CustomStep(
        stepNumber: 2,
        isActive: _currentStep >= 1,
        title: "STEP2",
        subtitle: "COURSES",
      )
    ];
    return steps;
  }

  List<CustomStep> _lasTwoTwoSteps() {
    List<CustomStep> steps = [
      CustomStep(
        stepNumber: 3,
        isActive: stepperThree,
        title: "STEP3",
        subtitle: "WORK EXPERIENCE",
      ),
      CustomStep(
        isActive: stepperFour,
        stepNumber: 4,
        title: "STEP4",
        subtitle: "REQUIRED DOCUMENTS",
      )
    ];
    return steps;
  }

  void onStepContinue() {
    if (_currentStep < this._firstTwoSteps().length - 1) {
      this._currentStep = this._currentStep + 1;
    }
  }

  void onFormFilled(StepperCommand stepperCommand) {
    if (stepperCommand.cancelOrContinue) {
      setState(() {
        this.stepperPageIndex = stepperCommand.pageIndex + 1;
        print("NEXT PAGE" + this.stepperPageIndex.toString());
        this._currentStep = this._currentStep + 1;

        if (stepperPageIndex == 2) {
          this.stepperThree = true;
        } else if (stepperPageIndex == 3) {
          this.stepperFour = true;
        }

        // _controller.jumpToPage(_currentStep);
      });
    } else {
      setState(() {
        this.stepperPageIndex = stepperCommand.pageIndex - 1;
        this._currentStep = this._currentStep - 1;
        if (stepperPageIndex == 1) {
          this.stepperThree = false;
          this.stepperFour = false;
        } else if (stepperPageIndex == 2) {
          this.stepperThree = true;
          this.stepperFour = false;
        }
      });
    }
  }

  void permissionToUseProfileData(bool value) {
    //taking effect only from next page
    setState(() {
      if (!useProfileData) {}
    });
  }

  void onStudentSelected(Studentlist value) {
    setState(() {
      selectedStudent = value;
      stepperPages.removeAt(0);
      stepperPages.insert(0, stepOneInformationFormPage());
      stepperPages.insert(
        1,
        StepTwoApplicationForm(
          stdId: selectedStudent.membersId,
          instId: widget.institute.details.id,
          pageData: pageData["data"] ?? widget.institute.instapolicy[0],
          level: pageData["level"] ?? widget.institute.instapolicy[0].degreeId,
          onCoursesStatusChanged: onFormFilled,
        ),
      );
      stepperPages.insert(
        2,
        WorkExperienceForm(
          stdId: selectedStudent.membersId,
          onFormFilled: onFormFilled,
        ),
      );
      stepperPages.insert(
          3,
          DocUploadFormFour(
            stdId: selectedStudent.membersId,
            instId: widget.institute.details.id,
            onFormFilled: onPreviewPage,
          ));
    });
    // selectedStudent=null;
  }

  void onPreviewPage(StepperCommand stepperCommand) {
    if (stepperCommand.cancelOrContinue) {
      //print("NAVIGATION TO PREVIEW");
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (_) => PreviewPage(
                studentId: selectedStudent.membersId,
                instId: widget.institute.details.id,
              )));
    } else {
      setState(() {
        this.stepperPageIndex = stepperCommand.pageIndex - 1;
        this._currentStep = this._currentStep - 1;
        if (stepperPageIndex == 1) {
          this.stepperThree = false;
          this.stepperFour = false;
        } else if (stepperPageIndex == 2) {
          this.stepperThree = true;
          this.stepperFour = false;
        }
      });
    }
  }
}

class ApplicationStepper extends StatefulWidget {
  final int stepperCount;

  const ApplicationStepper({
    this.stepperCount,
    Key key,
  }) : super(key: key);

  @override
  _ApplicationStepperState createState() => _ApplicationStepperState();
}

class _ApplicationStepperState extends State<ApplicationStepper> {
  int selectedIndex = 0;
  BoxDecoration selectedBoxDecoration = BoxDecoration(
    color: AppTheme.checkBoxCheckedColor,
    borderRadius: BorderRadius.circular(40.0),
  );
  BoxDecoration unSelectedBoxDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: AppTheme.greyBackground),
    borderRadius: BorderRadius.circular(40.0),
  );
  Container stepperCurrentContainer;
  Container stepperPreviousContainer;

  Widget stepCountContainer(int count) {
    return Container(
      width: 40,
      height: 40,
      decoration: selectedBoxDecoration,
      child: ListTile(
        onTap: () {
          /*widget.stepperCount(count - 1);*/
          setState(() {
            selectedIndex = count;
          });
        },
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
          child: Text(
            count.toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Widget stepPreviousContainer(int count) {
    return Container(
      width: 40,
      height: 40,
      decoration: unSelectedBoxDecoration,
      child: ListTile(
        onTap: () {
          /*widget.stepperCount(count - 1);*/
          /* setState(() {
            selectedIndex = count;
          });*/
        },
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
          child: Text(
            count.toString(),
            style: TextStyle(
                color: AppTheme.greyBackground,
                fontSize: 14.0,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    widget.stepperCount != null
        ? selectedIndex = widget.stepperCount + 1
        : selectedIndex = 0;
    stepperCurrentContainer = stepCountContainer(selectedIndex);
    stepperPreviousContainer = stepPreviousContainer(selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                selectedIndex == 1
                    ? stepperCurrentContainer
                    : stepperPreviousContainer,
                SizedBox(
                  height: 30,
                ),
                stepCountContainer(3),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "STEP1",
                      style: TextStyle(
                          color: Color(0xff191919),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "INFORMATION",
                      style: TextStyle(
                          color: Color(0xff191919),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "STEP3",
                      style:
                          TextStyle(color: Color(0xff191919), fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 85,
                      child: Text(
                        "WORK EXPERIENCE",
                        style: TextStyle(
                            color: Color(0xff191919),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                selectedIndex == 2
                    ? stepperCurrentContainer
                    : stepperPreviousContainer,
                SizedBox(
                  height: 30,
                ),
                stepCountContainer(4),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "STEP2",
                      style:
                          TextStyle(color: Color(0xff191919), fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "COURSE",
                      style: TextStyle(
                          color: Color(0xff191919),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "STEP4",
                        style:
                            TextStyle(color: Color(0xff191919), fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 85,
                        child: Text(
                          "REQUIRED DOCUMENTS",
                          maxLines: null,
                          style: TextStyle(
                              color: Color(0xff191919),
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StepOneInformationForm extends StatefulWidget {
  final ValueChanged<Map<String, dynamic>> onFormFilled;

  final Studentlist selectedStudent;
  final bool showCheckBox;
  final double adjustablePadding;
  final String selectedFundingId;
  final GlobalKey checkBoxKey;
  final String univ;
  final InstituteDetailRes instDetail;
  final bool userProfileDataSet;
  final bool fromStudentApply;

  const StepOneInformationForm(
      {Key key,
      this.fromStudentApply,
      this.userProfileDataSet,
      this.univ,
      this.instDetail,
      this.checkBoxKey,
      this.selectedStudent,
      this.selectedFundingId,
      this.onFormFilled,
      this.adjustablePadding,
      this.showCheckBox})
      : super(key: key);

  @override
  _StepOneInformationFormState createState() => _StepOneInformationFormState();
}

class _StepOneInformationFormState extends State<StepOneInformationForm> {
  final GlobalKey<FormBuilderState> _stepOneFormKey =
      GlobalKey<FormBuilderState>();

  ApplyApplicationBloc _applyApplicationBloc;
  Map<String, dynamic> nextStepWithPageData = {};

  /*Funding initialFunding;
  StartDate initialStartDate;
  Degree initialDegree;*/

  @override
  void initState() {
    //print("UNIVERSITY_iD"+widget.univ);
    _applyApplicationBloc = ApplyApplicationBloc();
    //for keeping the user selected dropdown form
    if (stepOneDto.fund == null) {
      stepOneDto.fund = loadDataLabel.funding[0];
    }

    stepOneDto.instapolicy = widget.instDetail.instapolicy[0];
    stepOneDto.startDate = stepOneDto.instapolicy.startdates[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplyApplicationBloc, ApplyApplicationState>(
      cubit: _applyApplicationBloc,
      listener: (context, state) {
        /* if (state is ApplyApplicationInitial) {
          LoadingDialog.show(context);
        }*/
        if (state is FirstStepApplied) {
          LoadingDialog.hide(context);
          if (state.appliedResponse.gonext) {
            setState(() {
              nextStepWithPageData = {
                "page": 1,
                "data": stepOneDto.instapolicy,
                "level": stepOneDto.levelDegreeId
              };
            });
            widget.onFormFilled(nextStepWithPageData);
          }
          // AppWidgetHelper.showSnackBar(state.appliedResponse.msg, context);
        }
      },
      child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              //physics: const NeverScrollableScrollPhysics(),
              child: FormBuilder(
                key: _stepOneFormKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: widget.adjustablePadding ??
                          sizeConfig.screenHeight * 0.20,
                    ),

                    widget.fromStudentApply
                        ? const SizedBox(
                            height: 115,
                          )
                        : const SizedBox(
                            height: 135,
                          ),

                    Text(
                      "Personal Information",
                      style: AppTheme.profileInfoStyle.copyWith(
                          color: AppTheme.cardTitleTxtColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Name as it appears on Passport",
                      style: AppTheme.profileInfoStyle.copyWith(
                          fontSize: 14.0,
                          color: AppTheme.cardTitleTxtColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Passport",
                      style: AppTheme.studentLabelStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      initialValue: stepOneDto.passport != null
                          ? stepOneDto.passport
                          : '',
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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Surname",
                      style: AppTheme.studentLabelStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      initialValue:
                          stepOneDto.surname != null ? stepOneDto.surname : '',
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.disabled,
                      attribute: "surname",
                      autocorrect: false,
                      validators: [FormBuilderValidators.required()],
                      decoration: AppWidgetHelper.buildInputDecoration(),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      "Other Names",
                      style: AppTheme.studentLabelStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      initialValue: stepOneDto.othername != null
                          ? stepOneDto.othername
                          : '',
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.disabled,
                      attribute: "othername",
                      autocorrect: false,
                      validators: [FormBuilderValidators.required()],
                      decoration: AppWidgetHelper.buildInputDecoration(),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Permanent Home Address (In English)",
                      style: AppTheme.studentLabelStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.cardTitleTxtColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      initialValue: stepOneDto.homeaddress != null
                          ? stepOneDto.homeaddress
                          : '',
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.disabled,
                      attribute: "homeaddress",
                      autocorrect: false,
                      validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(
                          filled: true,
                          // errorStyle: TextStyle(color: Color(0xff886069)),
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 0.0, 25.0, 50.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide: BorderSide(
                                width: 1, color: AppTheme.btnBorderColor),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0))),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AppWidgetHelper.divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Funding Source",
                      style: AppTheme.profileInfoStyle.copyWith(
                          color: AppTheme.cardTitleTxtColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: sizeConfig.screenWidth,
                      decoration: BoxDecoration(
                          //color: Color(0xff212F3F),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: AppTheme.btnBorderColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FundingSourceDropDown(
                          initialFunding: stepOneDto.fund,
                          funding: loadDataLabel.funding,
                          onFundingSelected: (fund) {
                            setState(() {
                              stepOneDto.fund = fund;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //AppWidgetHelper.divider(),
                    SizedBox(
                      height: 10,
                    ),
                    getDropDownConditionForm(stepOneDto.fund),
                    SizedBox(
                      height: 20,
                    ),
                    AppWidgetHelper.divider(),
                    Text(
                      "Program",
                      style: AppTheme.studentLabelStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.cardTitleTxtColor),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Level of Study",
                      style: AppTheme.studentLabelStyle
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DegreeProgramDropDown(
                        initialInstapolicy: widget.instDetail.instapolicy[0],
                        instaPolicyList: widget.instDetail.instapolicy,
                        onDegreeProgramSelected: (instapolicy) {
                          setState(() {
                            // stepOneDto.instapolicy = instapolicy;
                          });
                        },
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                  color: AppTheme.instituteTextColor,
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          minWidth: sizeConfig.screenWidth / 2.6,
                          height: 48,
                          textColor: Colors.white,
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: AppTheme.instituteTextColor,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            /* .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*/
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          minWidth: sizeConfig.screenWidth / 2.6,
                          height: 50,
                          color: AppTheme.instituteTextColor,
                          child: Text(
                            "Next",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8),
                          ),
                          onPressed: () {
                            if (widget.selectedStudent != null) {
                              if (_stepOneFormKey.currentState
                                  .saveAndValidate()) {
                                LoadingDialog.show(context);
                                setState(() {
                                  stepOneDto.surname = _stepOneFormKey
                                      .currentState
                                      .fields['surname']
                                      .currentState
                                      .value;
                                  stepOneDto.passport = _stepOneFormKey
                                      .currentState
                                      .fields['passport']
                                      .currentState
                                      .value;
                                  stepOneDto.homeaddress = _stepOneFormKey
                                      .currentState
                                      .fields['homeaddress']
                                      .currentState
                                      .value;
                                  stepOneDto.othername = _stepOneFormKey
                                      .currentState
                                      .fields['othername']
                                      .currentState
                                      .value;
                                  stepOneDto.sponcorfname = _stepOneFormKey
                                              .currentState.fields['fname'] !=
                                          null
                                      ? _stepOneFormKey.currentState
                                          .fields['fname'].currentState.value
                                      : "";

                                  stepOneDto.sponcorlname = _stepOneFormKey
                                              .currentState.fields['lname'] !=
                                          null
                                      ? _stepOneFormKey.currentState
                                          .fields['lname'].currentState.value
                                      : "";

                                  stepOneDto.sponcoremail = _stepOneFormKey
                                              .currentState.fields['email'] !=
                                          null
                                      ? _stepOneFormKey.currentState
                                          .fields['email'].currentState.value
                                      : "";

                                  stepOneDto.sponcortelephone = _stepOneFormKey
                                              .currentState.fields['phone'] !=
                                          null
                                      ? _stepOneFormKey.currentState
                                          .fields['phone'].currentState.value
                                      : "";

                                  stepOneDto
                                      .fundingdescription = _stepOneFormKey
                                              .currentState
                                              .fields['fundingdescription'] !=
                                          null
                                      ? _stepOneFormKey
                                          .currentState
                                          .fields['fundingdescription']
                                          .currentState
                                          .value
                                      : "";

                                  stepOneDto.govtfundev = _stepOneFormKey
                                              .currentState
                                              .fields['govtfundev'] !=
                                          null
                                      ? _stepOneFormKey
                                          .currentState
                                          .fields['govtfundev']
                                          .currentState
                                          .value
                                      : "";
                                  stepOneDto.govtfundapplied = _stepOneFormKey
                                              .currentState
                                              .fields['govtfundapplied'] !=
                                          null
                                      ? _stepOneFormKey
                                          .currentState
                                          .fields['govtfundapplied']
                                          .currentState
                                          .value
                                      : "";
                                  stepOneDto.selected =
                                      stepOneDto.fund.fundingId;
                                  stepOneDto.selectedstartdate =
                                      stepOneDto.startDate.value;
                                  stepOneDto.levelDegreeId =
                                      stepOneDto.instapolicy.degreeId;
                                });
                                print(stepOneDto.toJson());
                                _applyApplicationBloc.add(ApplyFirstStep(
                                    instId: widget.univ,
                                    studyLevel: stepOneDto.instapolicy.degreeId,
                                    stdId: widget.selectedStudent.membersId,
                                    stepOneDto: stepOneDto));
                                //LoadingDialog.show(context);

                              }
                            } else {
                              Scrollable.ensureVisible(
                                  widget.checkBoxKey.currentContext,
                                  alignment: 0.0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                              AppWidgetHelper.showSnackBar(
                                  "Please select student to apply.", context);
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget getDropDownConditionForm(Funding fund) {
    if (fund.fundingId == "15" || fund.fundingId == "19") {
      return FriendFamilyForm(
        formDto: stepOneDto,
      );
    } else if (fund.fundingId == "16") {
      return GovOrgRadioForm();
    } else if (fund.fundingId == "17" || fund.fundingId == "18") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("- How do you intend to pay by your self?",
              style: AppTheme.studentLabelStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.cardTitleTxtColor)),
          SizedBox(
            height: 15,
          ),
          FormBuilderTextField(
            initialValue: stepOneDto.fundingdescription != null
                ? stepOneDto.fundingdescription
                : '',
            autofocus: false,
            autovalidateMode: AutovalidateMode.disabled,
            attribute: "fundingdescription",
            autocorrect: false,
            validators: [FormBuilderValidators.required()],
            maxLines: null,
            decoration: InputDecoration(
                filled: true,
                // errorStyle: TextStyle(color: Color(0xff886069)),
                fillColor: Colors.white,
                contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 25.0, 50.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  borderSide:
                      BorderSide(width: 1, color: AppTheme.btnBorderColor),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0))),
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
          ),
        ],
      );
    } else {
      return FriendFamilyForm(
        formDto: stepOneDto,
      );
    }
  }
}

class KeepAlive extends StatefulWidget {
  const KeepAlive({Key key, this.data}) : super(key: key);

  final Widget data;

  @override
  _KeepAliveState createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.data;
  }
}

class AutoComplete extends StatefulWidget {
  final ValueChanged<Studentlist> selectedStudent;

  AutoComplete({this.selectedStudent});

  @override
  _AutoCompleteState createState() => new _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  _AutoCompleteState();

  String studentId;

  TextEditingController controller = new TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  final myStudentList = studentListResponse.studentlist;

  //find and create list of matched strings
  List<Studentlist> _getSuggestions(String query) {
    List<Studentlist> matches = List();

    matches.addAll(myStudentList);

    matches.retainWhere(
        (s) => s.membersFirstname.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<Studentlist>(
      hideSuggestionsOnKeyboardHide: false,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.grey, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5))),
      textFieldConfiguration: TextFieldConfiguration(
          onEditingComplete: () {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          cursorColor: Colors.black,
          autofocus: false,
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontStyle: FontStyle.normal),
          decoration: AppWidgetHelper.buildInputDecoration(),
          controller: this.controller),
      suggestionsCallback: (pattern) async {
        return _getSuggestions(pattern);
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: Text(
              suggestion.membersFirstname + " " + suggestion.membersLastname),
        );
      },
      onSuggestionSelected: (suggestion) {
        setState(() {
          controller.text =
              suggestion.membersFirstname + " " + suggestion.membersLastname;
          studentId = suggestion.membersId;
          widget.selectedStudent(suggestion);
        });
        /*Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Container(
                decoration: BoxDecoration(
                  //color: Color(0xff212F3F),
                  */ /* borderRadius: BorderRadius.all(
                    Radius.circular(5)),*/ /*
                    border: Border.all(
                        color: AppTheme.btnBorderColor)),

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "hello",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                      ),

                    ]))
        ));*/
      },
    );
  }
}

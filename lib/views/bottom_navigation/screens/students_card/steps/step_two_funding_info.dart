import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/apply_application/apply_application_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/secondstep/std_funding_bloc.dart';
import 'package:findadmissionaffiliate/dto/students/funding_dto.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/helpers/loading_indicator_dialog.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:findadmissionaffiliate/utils/affiliate_methods.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/step_one/family_friend_form.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/step_one/gov_org_form.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/funding_source_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/profile/profile.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';



class StepTwoFundingForm extends StatefulWidget {
  final ValueChanged<int> onFormFilled;
  final StdLoadDataRes stdLoadDataRes;
  final Studentlist selectedStudent;
  final bool showCheckBox;
  final double adjustablePadding;
  final String selectedFundingId;
  final GlobalKey checkBoxKey;
  final Match univ;
  final InstituteDetailRes instDetail;
  final bool userProfileDataSet;

  const StepTwoFundingForm(
      {Key key,
      this.stdLoadDataRes,
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
  _StepTwoFundingFormState createState() => _StepTwoFundingFormState();
}

class _StepTwoFundingFormState extends State<StepTwoFundingForm> {
  final GlobalKey<FormBuilderState> _stepTwoFundingFormKey =
      GlobalKey<FormBuilderState>();
  StdLoadDataRes stdLoadDataRes;
  StdFundingBloc _stdFundingBloc;
  Map<String, dynamic> nextStepWithPageData = {};

  /*Funding initialFunding;
  StartDate initialStartDate;
  Degree initialDegree;*/

  @override
  void initState() {

    stdLoadDataRes = widget.stdLoadDataRes;
    _stdFundingBloc = StdFundingBloc();
    //for keeping the user selected dropdown form
    if (stepTwoFundingDto.fund == null) {
      stepTwoFundingDto.fund = stdLoadDataRes.funding[0];
    }

    // stepTwoFundingDto.instapolicy = widget.instDetail.instapolicy[0];
    //stepTwoFundingDto.startDate = stepTwoFundingDto.startDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StdFundingBloc, StdFundingState>(
      cubit: _stdFundingBloc,
      listener: (context, state) {

        if (state is StdFundingStoredNext) {
          LoadingDialog.hide(context);
          print("NEXT");
          widget.onFormFilled(2);
          /* if (state.appliedResponse.gonext) {
            // widget.onFormFilled(1);
          }*/
          // AppWidgetHelper.showSnackBar(state.appliedResponse.msg, context);
        }
        if (state is StdFundingStoredSave) {
          LoadingDialog.hide(context);
          print("SAVED");
          /* if (state.appliedResponse.gonext) {
            // widget.onFormFilled(1);
          }*/
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
                key: _stepTwoFundingFormKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: widget.adjustablePadding ??
                          sizeConfig.screenHeight * 0.20,
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
                      initialValue: stepTwoFundingDto.passport != null
                          ? stepTwoFundingDto.passport
                          : '',
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.disabled,
                      attribute: "stdpassport",
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
                      initialValue: stepTwoFundingDto.surname != null
                          ? stepTwoFundingDto.surname
                          : '',
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
                      initialValue: stepTwoFundingDto.othername != null
                          ? stepTwoFundingDto.othername
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
                      initialValue: stepTwoFundingDto.homeaddress != null
                          ? stepTwoFundingDto.homeaddress
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
                        child: StdFundSourceDropDown(
                          initialFunding: stepTwoFundingDto.fund,
                          funding: stdLoadDataRes.funding,
                          onFundingSelected: (fund) {
                            setState(() {
                              stepTwoFundingDto.fund = fund;
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
                    getDropDownConditionForm(stepTwoFundingDto.fund),
                    SizedBox(
                      height: 20,
                    ),
                    AppWidgetHelper.divider(),
                    /*Text(
                      "Program",
                      style: AppTheme.studentLabelStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.cardTitleTxtColor),
                    ),
                    SizedBox(
                      height: 15,
                    ),*/
                    /* Text(
                      "Level of Study",
                      style: AppTheme.studentLabelStyle
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StudentDegreeDropDown(
                        degreeList:stdLoadDataRes.degree,
                        onDegreeProgramSelected: (instapolicy) {
                          setState(() {
                          });
                        },
                      ),
                    ),*/
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
                            LoadingDialog.show(context);
                            prepareFormData();
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
                            LoadingDialog.show(context);
                            prepareFormData();

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
        formDto: stepTwoFundingDto,
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
            initialValue: stepTwoFundingDto.fundingdescription != null
                ? stepTwoFundingDto.fundingdescription
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
        formDto: stepTwoFundingDto,
      );
    }
  }

  void prepareFormData() {
    setState(() {
      print("PASSPORT"+_stepTwoFundingFormKey
          .currentState.fields['stdpassport'].currentState.value);
      stepTwoFundingDto.surname = _stepTwoFundingFormKey
          .currentState.fields['surname'].currentState.value;
      stepTwoFundingDto.passport = _stepTwoFundingFormKey
          .currentState.fields['stdpassport'].currentState.value;
      stepTwoFundingDto.homeaddress = _stepTwoFundingFormKey
          .currentState.fields['homeaddress'].currentState.value;
      stepTwoFundingDto.othername = _stepTwoFundingFormKey
          .currentState.fields['othername'].currentState.value;
      stepTwoFundingDto.sponcorfname =
          _stepTwoFundingFormKey.currentState.fields['fname'] != null
              ? _stepTwoFundingFormKey
                  .currentState.fields['fname'].currentState.value
              : "";

      stepTwoFundingDto.sponcorlname =
          _stepTwoFundingFormKey.currentState.fields['lname'] != null
              ? _stepTwoFundingFormKey
                  .currentState.fields['lname'].currentState.value
              : "";

      stepTwoFundingDto.sponcoremail =
          _stepTwoFundingFormKey.currentState.fields['email'] != null
              ? _stepTwoFundingFormKey
                  .currentState.fields['email'].currentState.value
              : "";

      stepTwoFundingDto.sponcortelephone =
          _stepTwoFundingFormKey.currentState.fields['phone'] != null
              ? _stepTwoFundingFormKey
                  .currentState.fields['phone'].currentState.value
              : "";

      stepTwoFundingDto.fundingdescription =
          _stepTwoFundingFormKey.currentState.fields['fundingdescription'] !=
                  null
              ? _stepTwoFundingFormKey
                  .currentState.fields['fundingdescription'].currentState.value
              : "";

      stepTwoFundingDto.govtfundev =
          _stepTwoFundingFormKey.currentState.fields['govtfundev'] != null
              ? _stepTwoFundingFormKey
                  .currentState.fields['govtfundev'].currentState.value
              : "";
      stepTwoFundingDto.govtfundapplied =
          _stepTwoFundingFormKey.currentState.fields['govtfundapplied'] != null
              ? _stepTwoFundingFormKey
                  .currentState.fields['govtfundapplied'].currentState.value
              : "";
      stepTwoFundingDto.selected = stepTwoFundingDto.fund.fundingId;
//stepTwoFundingDto.needvisa=widget.stdLoadDataRes.funding;

      stepTwoFundingDto.scholammount = "";
      print(stepTwoFundingDto.toJson().toString());
      _stdFundingBloc.add(StoreFundingInfoAndNext(stdId: widget.stdLoadDataRes.myid,stepTwoFundingDto: stepTwoFundingDto));
    });
  }
}

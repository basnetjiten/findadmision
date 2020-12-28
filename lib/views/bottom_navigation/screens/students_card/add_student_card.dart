import 'dart:async';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/student_bloc/add_students_bloc.dart';
import 'package:findadmissionaffiliate/dto/students/add_student.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/loading_indicator_dialog.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/univ_global.dart';
import 'package:findadmissionaffiliate/utils/affiliate_methods.dart';
import 'package:findadmissionaffiliate/utils/dialog_type.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/day_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/months_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/year_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/multiple_select_dialog.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/no_account_expansioni_title.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/yes_account_expansion_tile.dart';
import 'package:findadmissionaffiliate/views/signup/dropdowns/country_dropdown.dart';
import 'package:findadmissionaffiliate/views/signup/dropdowns/gender_dropdown.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AddStudentCard extends StatefulWidget {
  @override
  _AddStudentCardState createState() => _AddStudentCardState();
}

class _AddStudentCardState extends State<AddStudentCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormBuilderState> _addStdFormKey =
      GlobalKey<FormBuilderState>();

  Map<String, String> location = {
    "UK": "Add Student who already has a Findadmission account",
    "AU": "Add Student who doesn’t have an account"
  };
  List<String> _tempSelectedOption = List();
  List<Activecountry> selectedInterestedLocation = [];
  List<Degree> selectedStudyLevel = [];
  List<Startdate> selectedEntryDate = [];
  List<String> selectedTuitionFee = [];

  //code for expansion tile
/*  List<String> selectedCountryKey= [];
  List<String> selectedStudyLevelKey = [];
  List<String> selectedEntryDateKey = [];
  List<String> selectedTuitionFeeKey = [];*/
  String selectedString = 'Select Location';
  bool _isYesAccountExpanded = false;
  bool _isNoAccountExpanded = false;
  AddStudentsBloc _addStudentsBloc;
  bool _yesAccChecked = false;
  bool _noAccChecked = false;
  AnimationController _noAccountController;
  AnimationController _yesAccountController;
  Animation<double> _iconTurns;
  Animation<Color> _iconColor;
  Widget addStudentPage;
  String selectedCountry;
  String selectedGender;
  String selectedDay;
  String selectedMonth;
  String selectedYear;

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<YesAccountExpansionTileState> yesExpansionTile =
      new GlobalKey();
  final GlobalKey<NoAccountExpansionTileState> noExpansionTile =
      new GlobalKey();

  void onNoExpansionChanged(bool expanded) {
    setState(() {
      if (expanded) {
        yesExpansionTile.currentState.collapse();
      }
    });
  }

  void onYesExpansionChanged(bool expanded) {
    setState(() {
      if (expanded) {
        noExpansionTile.currentState.collapse();
      }
    });
  }

  @override
  void initState() {
    _addStudentsBloc = AddStudentsBloc();
    //_noAccountController = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _yesAccountController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _tempSelectedOption = location.values.toList();
    /* getIt<UnivFilterBloc>().listen((state) {
      if (state is UnivFilterInitial) {}
      if (state is UnivDataFetched) {
        setState(() {
          activeCountryList = state.univFilterResponse.activecountry;
          cityList = state.univFilterResponse.citylist;
          startDateList = state.univFilterResponse.startdates;
        });
      }
    });*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
    );

    return BlocListener<AddStudentsBloc, AddStudentsState>(
      cubit: _addStudentsBloc,
      listener: (context, state) {
        if (state is StudentAddSuccess) {
          LoadingDialog.hide(context);

          print("ADEDDDDD" +
              state.studentAddedRes.studentlist[0].membersFirstname +
              state.studentAddedRes.studentlist[0].membersLastname);
          Studentlist newStudent = Studentlist(
              state.studentAddedRes.studentlist[0].completedCount,
              state.studentAddedRes.studentlist[0].inCompletedCount,
              state.studentAddedRes.studentlist[0].acceptedCount,
              state.studentAddedRes.studentlist[0].rejectedCount,
              state.studentAddedRes.lastaddedstudent.toString(),
              state.studentAddedRes.studentlist[0].membersFirstname,
              state.studentAddedRes.studentlist[0].membersLastname,
              state.studentAddedRes.studentlist[0].countryName,
              state.studentAddedRes.studentlist[0].membersPickey);

          Navigator.of(context).pop(newStudent);
        } else if (state is StudentApiEmpty) {}
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: AppTheme.greyBackground,
        body: Padding(
            padding:
                EdgeInsets.fromLTRB(15, sizeConfig.screenHeight * 0.15, 15, 0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              elevation: 1,
              child: Container(
                height: sizeConfig.screenHeight,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 55,
                      bottom: 0,
                      right: 0,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: FormBuilder(
                                  key: _addStdFormKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "First Name",
                                        style: AppTheme.studentLabelStyle,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: FormBuilderTextField(
                                          autofocus: false,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          attribute: "fname",
                                          validators: [
                                            FormBuilderValidators.required()
                                          ],
                                          decoration: AppWidgetHelper
                                              .buildInputDecoration(),
                                          style: TextStyle(color: Colors.black),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Last Name",
                                        style: AppTheme.studentLabelStyle,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: FormBuilderTextField(
                                          autofocus: false,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          validators: [
                                            FormBuilderValidators.required()
                                          ],
                                          attribute: "lname",
                                          decoration: AppWidgetHelper
                                              .buildInputDecoration(),
                                          style: TextStyle(color: Colors.black),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Country",
                                                style:
                                                    AppTheme.studentLabelStyle,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                // height: 55,
                                                width: sizeConfig.screenWidth /
                                                    2.55,
                                                decoration: BoxDecoration(
                                                    //color: Color(0xff212F3F),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    border: Border.all(
                                                        color: AppTheme
                                                            .btnBorderColor)),
                                                child: CountryDropDown(
                                                  countryChange:
                                                      onCountryDropDownChange,
                                                  countryCode:
                                                      appCheck.countrycode,
                                                  countryList: appCheck.country,
                                                  dropDownTxtStyle: AppTheme
                                                      .dropDownTextStyle
                                                      .copyWith(),
                                                  dropDownColor: AppTheme
                                                      .cardTitleTxtColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Gender",
                                                style:
                                                    AppTheme.studentLabelStyle,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                // height: 55,
                                                width: sizeConfig.screenWidth /
                                                    2.55,
                                                decoration: BoxDecoration(
                                                  // color: Color(0xff212F3F),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  /*  border: Border.all(
                                                                    color: AppTheme
                                                                        .btnBorderColor)*/
                                                ),
                                                child: GenderDropDown(
                                                  onGenderChange:
                                                      onGenderChange,
                                                  lightTheme: true,
                                                  dropDownTxtStyle: AppTheme
                                                      .dropDownTextStyle,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Date of Birth (DD-MM-YYY)",
                                        style: AppTheme.studentLabelStyle,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          buildDropDownContainer(
                                            DayDropDown(
                                              onDayChange: onDayChange,
                                              dropDownTxtStyle:
                                                  AppTheme.dropDownTextStyle,
                                            ),
                                          ),
                                          buildDropDownContainer(
                                            MonthDropDown(
                                              onMonthChange: onMonthChange,
                                              dropDownTxtStyle:
                                                  AppTheme.dropDownTextStyle,
                                            ),
                                          ),
                                          buildDropDownContainer(YearDropDown(
                                            onYearChanged: onYearChanged,
                                            dropDownTxtStyle:
                                                AppTheme.dropDownTextStyle,
                                          )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      /* Text(
                                        "Detail Information (optional)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final selectedLocationKey =
                                          await showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DetailInfoDialog(
                                                  options:
                                                  activeCountryList,
                                                  selectedOptions:
                                                  selectedInterestedLocation,
                                                  fromProfileEdit:
                                                  true,
                                                  dialogType:
                                                  DialogType
                                                      .LOCATION,
                                                  title:
                                                  "Interested Location",
                                                  */ /* onSelectedOptionListChanged:
                                                                  (selectedValue) {
                                                                selectedInterestedLocation =
                                                                    selectedValue;
                                                              },*/ /*
                                                );
                                              });
                                          setState(() {
                                            selectedInterestedLocation =
                                            List<Activecountry>.from(
                                                selectedLocationKey);
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width:
                                          sizeConfig.screenWidth /
                                              2.1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              border: Border.all(
                                                  color: selectedUnselectedColor(
                                                      selectedInterestedLocation,
                                                      AppTheme
                                                          .btnBorderColor))),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(
                                                10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                buildSelectedOptionText(
                                                    selectedInterestedLocation,
                                                    "Interested Location"),
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  size: 20,
                                                  color: selectedUnselectedColor(
                                                      selectedInterestedLocation,
                                                      AppTheme
                                                          .cardTitleTxtColor),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final selectedStudyLevelKey =
                                          await showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DetailInfoDialog(
                                                  options:
                                                  degreeList,
                                                  selectedOptions:
                                                  selectedStudyLevel,
                                                  fromProfileEdit:
                                                  true,
                                                  dialogType:
                                                  DialogType
                                                      .STUDY,
                                                  title:
                                                  "Study Level",
                                                  */ /*onSelectedOptionListChanged:
                                                                  (selectedValue) {
                                                                {
                                                                  selectedStudyLevel =
                                                                      selectedValue;
                                                                }
                                                              },*/ /*
                                                );
                                              });
                                          setState(() {
                                            selectedStudyLevel = List<
                                                Degree>.from(
                                                selectedStudyLevelKey);
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width:
                                          sizeConfig.screenWidth /
                                              2.1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              border: Border.all(
                                                  color: selectedUnselectedColor(
                                                      selectedStudyLevel,
                                                      AppTheme
                                                          .btnBorderColor))),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(
                                                10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                buildSelectedDegreeText(
                                                  selectedStudyLevel,
                                                  "Study Level",
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  size: 20,
                                                  color: selectedUnselectedColor(
                                                      selectedStudyLevel,
                                                      AppTheme
                                                          .cardTitleTxtColor),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final selectedEntryDateKey =
                                          await showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DetailInfoDialog(
                                                  options:
                                                  startDateList,
                                                  selectedOptions:
                                                  selectedEntryDate,
                                                  fromProfileEdit:
                                                  true,
                                                  dialogType:
                                                  DialogType
                                                      .DATE,
                                                  title:
                                                  "Entry Date",
                                                  */ /*onSelectedOptionListChanged:
                                                                  (selectedValue) {
                                                                selectedEntryDate =
                                                                    selectedValue;
                                                              },*/ /*
                                                );
                                              });
                                          setState(() {
                                            selectedEntryDate = List<
                                                Startdate>.from(
                                                selectedEntryDateKey);
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width:
                                          sizeConfig.screenWidth /
                                              2.1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              border: Border.all(
                                                  color: selectedUnselectedColor(
                                                      selectedEntryDate,
                                                      AppTheme
                                                          .btnBorderColor))),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(
                                                10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                buildSelectedDateText(
                                                    selectedEntryDate,
                                                    "Entry Date"),
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  size: 20,
                                                  color: selectedUnselectedColor(
                                                      selectedEntryDate,
                                                      AppTheme
                                                          .cardTitleTxtColor),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),*/
                                      /*SizedBox(
                                            height: 30,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(BlockBuildPageRoute(
                                                  transition: PageTransition.SlideRightTrans,
                                                  widget: TuitionFeeFilter(
                                                    feeRange: (null),
                                                  )));
                                            },
                                            child: Container(
                                              height: 50,
                                              width: sizeConfig.screenWidth / 2.5,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  border: Border.all(
                                                      color: AppTheme.btnBorderColor)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(12, 16, 10, 0),
                                                child: Text("Tuition Fee"),
                                              ),
                                            ),
                                          ),*/
                                      SizedBox(
                                        height: 30,
                                      ),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        color: AppTheme.checkBoxCheckedColor,
                                        minWidth: 340,
                                        height: 50,
                                        textColor: Colors.white,
                                        child: Text(
                                          "Add Student",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          if (_addStdFormKey.currentState
                                              .saveAndValidate()) {
                                            prepareAddStudentData();
                                          } else {
                                            AppWidgetHelper.showSnackBar(
                                                "Please fill up the required fields.",
                                                context,
                                                AppTheme.errorColor);
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            /*Theme(
                              data: theme,
                              child: YesAccountExpansionTile(
                                  onExpansionChanged: onYesExpansionChanged,
                                  key: yesExpansionTile,
                                  title: Container(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          height: 50.0,
                                          child: Transform.scale(
                                            scale: 1.2,
                                            child: Checkbox(
                                                activeColor: AppTheme
                                                    .checkBoxCheckedColor,
                                                value: _yesAccChecked,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    _yesAccChecked = value;
                                                    _noAccChecked = false;
                                                    if (_yesAccChecked) {
                                                      yesExpansionTile
                                                          .currentState
                                                          .expand();
                                                    } else {
                                                      yesExpansionTile
                                                          .currentState
                                                          .collapse();
                                                    }
                                                  });
                                                }),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: new Text(
                                              _tempSelectedOption[0],
                                              //maxLines: 1,
                                              style: AppTheme
                                                  .dialogDetailInfoStyle
                                                  .copyWith(
                                                      color: AppTheme
                                                          .cardTitleTxtColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: <Widget>[
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 20, 30.0, 0),
                                            child: Container(
                                                width: sizeConfig.screenWidth,
                                                height: 50,
                                                child:
                                                    AutoComplete()) Container(
                                          width: sizeConfig.screenWidth,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5)),
                                          child: Center(
                                            child: TextFormField(
                                                onChanged: (value) {
                                                  AutoComplete();
                                                },
                                                cursorColor: AppTheme.cardTitleTxtColor,
                                                decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.all(10),
                                                    hintText: 'key words..',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(4.0)),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(7.0)),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: AppTheme.btnBorderColor),
                                                    ))),
                                          ),
                                        )
                                            ,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ])
                                  ]),
                            ),*/
                            /*Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: AppWidgetHelper.divider(),
                            ),*/
                            /* Theme(
                              data: theme,
                              child: NoAccountExpansionTile(
                                  onExpansionChanged: onNoExpansionChanged,
                                  key: noExpansionTile,
                                  title: Container(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          height: 50.0,
                                          child: Transform.scale(
                                            scale: 1.2,
                                            child: Checkbox(
                                                activeColor: AppTheme
                                                    .checkBoxCheckedColor,
                                                value: _noAccChecked,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    _noAccChecked = value;
                                                    _yesAccChecked = false;
                                                    if (_noAccChecked) {
                                                      noExpansionTile
                                                          .currentState
                                                          .expand();
                                                    } else {
                                                      noExpansionTile
                                                          .currentState
                                                          .collapse();
                                                    }
                                                  });
                                                }),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: new Text(
                                              _tempSelectedOption[1],
                                              //maxLines: 1,
                                              style: AppTheme
                                                  .dialogDetailInfoStyle
                                                  .copyWith(
                                                      color: AppTheme
                                                          .cardTitleTxtColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: <Widget>[
                                    SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: FormBuilder(
                                          key: _addStdFormKey,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "First Name",
                                                style:
                                                    AppTheme.studentLabelStyle,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                child: FormBuilderTextField(
                                                  autofocus: false,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  attribute: "fname",
                                                  validators: [
                                                    FormBuilderValidators
                                                        .required()
                                                  ],
                                                  decoration: AppWidgetHelper
                                                      .buildInputDecoration(),
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  cursorColor: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Last Name",
                                                style:
                                                    AppTheme.studentLabelStyle,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                child: FormBuilderTextField(
                                                  autofocus: false,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  validators: [
                                                    FormBuilderValidators
                                                        .required()
                                                  ],
                                                  attribute: "lname",
                                                  decoration: AppWidgetHelper
                                                      .buildInputDecoration(),
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  cursorColor: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Country",
                                                        style: AppTheme
                                                            .studentLabelStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        // height: 55,
                                                        width: sizeConfig
                                                                .screenWidth /
                                                            2.55,
                                                        decoration:
                                                            BoxDecoration(
                                                                //color: Color(0xff212F3F),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                                border: Border.all(
                                                                    color: AppTheme
                                                                        .btnBorderColor)),
                                                        child: CountryDropDown(
                                                          countryChange:
                                                              onCountryDropDownChange,
                                                          countryCode: appCheck
                                                              .countrycode,
                                                          countryList:
                                                              appCheck.country,
                                                          dropDownTxtStyle: AppTheme
                                                              .dropDownTextStyle
                                                              .copyWith(),
                                                          dropDownColor: AppTheme
                                                              .cardTitleTxtColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Gender",
                                                        style: AppTheme
                                                            .studentLabelStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        // height: 55,
                                                        width: sizeConfig
                                                                .screenWidth /
                                                            2.55,
                                                        decoration:
                                                            BoxDecoration(
                                                          // color: Color(0xff212F3F),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                          */ /*  border: Border.all(
                                                                    color: AppTheme
                                                                        .btnBorderColor)*/ /*
                                                        ),
                                                        child: GenderDropDown(
                                                          onGenderChange:
                                                              onGenderChange,
                                                          lightTheme: true,
                                                          dropDownTxtStyle: AppTheme
                                                              .dropDownTextStyle,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Date of Birth (DD-MM-YYY)",
                                                style:
                                                    AppTheme.studentLabelStyle,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  buildDropDownContainer(
                                                    DayDropDown(
                                                      onDayChange: onDayChange,
                                                      dropDownTxtStyle: AppTheme
                                                          .dropDownTextStyle,
                                                    ),
                                                  ),
                                                  buildDropDownContainer(
                                                    MonthDropDown(
                                                      onMonthChange:
                                                          onMonthChange,
                                                      dropDownTxtStyle: AppTheme
                                                          .dropDownTextStyle,
                                                    ),
                                                  ),
                                                  buildDropDownContainer(
                                                      YearDropDown(
                                                    onYearChanged:
                                                        onYearChanged,
                                                    dropDownTxtStyle: AppTheme
                                                        .dropDownTextStyle,
                                                  )),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "Detail Information (optional)",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  final selectedLocationKey =
                                                      await showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return DetailInfoDialog(
                                                              options:
                                                                  activeCountryList,
                                                              selectedOptions:
                                                                  selectedInterestedLocation,
                                                              fromProfileEdit:
                                                                  true,
                                                              dialogType:
                                                                  DialogType
                                                                      .LOCATION,
                                                              title:
                                                                  "Interested Location",
                                                              */ /* onSelectedOptionListChanged:
                                                                  (selectedValue) {
                                                                selectedInterestedLocation =
                                                                    selectedValue;
                                                              },*/ /*
                                                            );
                                                          });
                                                  setState(() {
                                                    selectedInterestedLocation =
                                                        List<Activecountry>.from(
                                                            selectedLocationKey);
                                                  });
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width:
                                                      sizeConfig.screenWidth /
                                                          2.1,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(5),
                                                      ),
                                                      border: Border.all(
                                                          color: selectedUnselectedColor(
                                                              selectedInterestedLocation,
                                                              AppTheme
                                                                  .btnBorderColor))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        buildSelectedOptionText(
                                                            selectedInterestedLocation,
                                                            "Interested Location"),
                                                        Icon(
                                                          Icons.arrow_drop_down,
                                                          size: 20,
                                                          color: selectedUnselectedColor(
                                                              selectedInterestedLocation,
                                                              AppTheme
                                                                  .cardTitleTxtColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  final selectedStudyLevelKey =
                                                      await showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return DetailInfoDialog(
                                                              options:
                                                                  degreeList,
                                                              selectedOptions:
                                                                  selectedStudyLevel,
                                                              fromProfileEdit:
                                                                  true,
                                                              dialogType:
                                                                  DialogType
                                                                      .STUDY,
                                                              title:
                                                                  "Study Level",
                                                              */ /*onSelectedOptionListChanged:
                                                                  (selectedValue) {
                                                                {
                                                                  selectedStudyLevel =
                                                                      selectedValue;
                                                                }
                                                              },*/ /*
                                                            );
                                                          });
                                                  setState(() {
                                                    selectedStudyLevel = List<
                                                            Degree>.from(
                                                        selectedStudyLevelKey);
                                                  });
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width:
                                                      sizeConfig.screenWidth /
                                                          2.1,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(5),
                                                      ),
                                                      border: Border.all(
                                                          color: selectedUnselectedColor(
                                                              selectedStudyLevel,
                                                              AppTheme
                                                                  .btnBorderColor))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        buildSelectedDegreeText(
                                                          selectedStudyLevel,
                                                          "Study Level",
                                                        ),
                                                        Icon(
                                                          Icons.arrow_drop_down,
                                                          size: 20,
                                                          color: selectedUnselectedColor(
                                                              selectedStudyLevel,
                                                              AppTheme
                                                                  .cardTitleTxtColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  final selectedEntryDateKey =
                                                      await showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return DetailInfoDialog(
                                                              options:
                                                                  startDateList,
                                                              selectedOptions:
                                                                  selectedEntryDate,
                                                              fromProfileEdit:
                                                                  true,
                                                              dialogType:
                                                                  DialogType
                                                                      .DATE,
                                                              title:
                                                                  "Entry Date",
                                                              */ /*onSelectedOptionListChanged:
                                                                  (selectedValue) {
                                                                selectedEntryDate =
                                                                    selectedValue;
                                                              },*/ /*
                                                            );
                                                          });
                                                  setState(() {
                                                    selectedEntryDate = List<
                                                            Startdate>.from(
                                                        selectedEntryDateKey);
                                                  });
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width:
                                                      sizeConfig.screenWidth /
                                                          2.1,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(5),
                                                      ),
                                                      border: Border.all(
                                                          color: selectedUnselectedColor(
                                                              selectedEntryDate,
                                                              AppTheme
                                                                  .btnBorderColor))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        buildSelectedDateText(
                                                            selectedEntryDate,
                                                            "Entry Date"),
                                                        Icon(
                                                          Icons.arrow_drop_down,
                                                          size: 20,
                                                          color: selectedUnselectedColor(
                                                              selectedEntryDate,
                                                              AppTheme
                                                                  .cardTitleTxtColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              */ /*SizedBox(
                                            height: 30,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(BlockBuildPageRoute(
                                                  transition: PageTransition.SlideRightTrans,
                                                  widget: TuitionFeeFilter(
                                                    feeRange: (null),
                                                  )));
                                            },
                                            child: Container(
                                              height: 50,
                                              width: sizeConfig.screenWidth / 2.5,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                  border: Border.all(
                                                      color: AppTheme.btnBorderColor)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(12, 16, 10, 0),
                                                child: Text("Tuition Fee"),
                                              ),
                                            ),
                                          ),*/ /*
                                              SizedBox(
                                                height: 30,
                                              ),
                                              MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                color: AppTheme
                                                    .checkBoxCheckedColor,
                                                minWidth: 340,
                                                height: 50,
                                                textColor: Colors.white,
                                                child: Text(
                                                  "Add Student",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                onPressed: () {
                                                  if (_addStdFormKey
                                                      .currentState
                                                      .saveAndValidate()) {
                                                    prepareAddStudentData();
                                                  } else {
                                                    AppWidgetHelper.showSnackBar(
                                                        "Please fill up the required fields.",
                                                        context,
                                                        AppTheme.errorColor);
                                                  }
                                                },
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 5,
                      bottom: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(CupertinoIcons.back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              "Add Students",
                              style: AppTheme.helperLabelStyle.copyWith(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  void onCountryDropDownChange(String value) {
    setState(() {
      selectedCountry = value;
    });
  }

  Container buildDropDownContainer(Widget dropDown) {
    return Container(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: dropDown,
      ),
    );
  }

  Widget buildSelectedOptionText(
      selectedInterestedLocation, String defaultTitle) {
    return Flexible(
      child: Text(
        selectedInterestedLocation.isNotEmpty
            ? (selectedInterestedLocation.length > 1
                ? selectedInterestedLocation[0].countryName +
                    ", " +
                    selectedInterestedLocation[1].countryName
                : selectedInterestedLocation[0].countryName)
            : defaultTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: selectedUnselectedColor(
                selectedInterestedLocation, AppTheme.cardTitleTxtColor)),
      ),
    );
  }

  Widget buildSelectedDegreeText(
      List<Degree> selectedDegree, String defaultTitle) {
    return Flexible(
      child: Text(
        selectedDegree.isNotEmpty
            ? (selectedDegree.length > 1
                ? selectedDegree[0].degreeName +
                    ", " +
                    selectedDegree[1].degreeName
                : selectedDegree[0].degreeName)
            : defaultTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: selectedUnselectedColor(
                selectedStudyLevel, AppTheme.cardTitleTxtColor)),
      ),
    );
  }

  Widget buildSelectedDateText(List<Startdate> startDate, String defaultTitle) {
    return Flexible(
      child: Text(
        startDate.isNotEmpty
            ? (startDate.length > 1
                ? startDate[0].name + ", " + startDate[1].name
                : startDate[0].name)
            : defaultTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: selectedUnselectedColor(
                selectedEntryDate, AppTheme.cardTitleTxtColor)),
      ),
    );
  }

  void onCountrySelected(selectedList) {}

  Color selectedUnselectedColor(list, color) {
    if (list.isNotEmpty) {
      return list.isNotEmpty ? AppTheme.checkBoxCheckedColor : color;
    } else {
      return color;
    }
  }

  void prepareAddStudentData() {
    final firstName =
        _addStdFormKey.currentState.fields['fname'].currentState.value;
    final lastName =
        _addStdFormKey.currentState.fields['lname'].currentState.value;
    final country = selectedCountry ??
        AffiliateMethods.getUserDefaultCountry(appCheck.countrycode);
    final gender = selectedGender[0].toLowerCase();
    final day = selectedDay;
    final month = selectedMonth;
    final year = selectedMonth;
    /*final interestedLocation = [];
    final selectedDegree = [];
    final selectedDate = [];
    selectedInterestedLocation.forEach((element) {
      interestedLocation.add(element.countryId);
      interestedLocation.join("");
    });
    selectedStudyLevel.forEach((element) {
      selectedDegree.add(element.degreeId);
      selectedDegree.join("");
    });
    selectedEntryDate.forEach((element) {
      selectedDate.add(element.id);
      selectedDate.join("");
    });

    print(selectedDate.toString());*/
    AddStudentDto addStudent = AddStudentDto(
      fname: firstName,
      lname: lastName,
      selecteddays: day,
      studentgender: gender,
      selectedmonths: month,
      selectedyears: year,
      studentcountry: country,
    );
    LoadingDialog.show(context);
    _addStudentsBloc.add(AddStudent(addStudentDto: addStudent));
  }

  void onGenderChange(String value) {
    setState(() {
      selectedGender = value;
    });
  }

  void onDayChange(String value) {
    setState(() {
      selectedDay = value;
    });
  }

  void onMonthChange(String value) {
    setState(() {
      selectedMonth = value;
    });
  }

  void onYearChanged(String value) {
    setState(() {
      selectedYear = value;
    });
  }
}

/*class AutoComplete extends StatefulWidget {
  @override
  _AutoCompleteState createState() => new _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  _AutoCompleteState();

  TextEditingController controller =
      new TextEditingController(text: "Key Words");
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  final myChemicalList = ["cobalt", "copper", "cop", "Nickel", "Nike","copper", "cop","copper", "cop",];
  //find and create list of matched strings
  List<String> _getSuggestions(String query) {
    List<String> matches = List();

    matches.addAll(myChemicalList);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.grey, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5))),
      textFieldConfiguration: TextFieldConfiguration(
          cursorColor: Colors.black,
          autofocus: false,
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontStyle: FontStyle.normal),
          decoration: AppWidgetHelper.buildInputDecoration(),
          controller: this.controller),
      suggestionsCallback: (pattern) async {
        return _getSuggestions(pattern);
      }
     ,
      itemBuilder: (context, suggestion) {
        return Container(
          height: 50,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              suggestion),
          ),
        );
      },
      onSuggestionSelected: (suggestion) {
        setState(() {
          controller.text = suggestion;
        });
        */ /*Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Container(
                decoration: BoxDecoration(
                  //color: Color(0xff212F3F),
                  */ /* */ /* borderRadius: BorderRadius.all(
                    Radius.circular(5)),*/ /* */ /*
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
        ));*/ /*
      },
    );
  }
}*/

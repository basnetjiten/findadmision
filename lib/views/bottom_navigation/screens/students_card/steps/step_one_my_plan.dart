import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/course/course_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/first_step/finish_first_step_bloc.dart';
import 'package:findadmissionaffiliate/dto/students/first_step_dto.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/Max_3_course.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/budget_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/std_degree_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/std_startdates.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepOneMyPlanPage extends StatefulWidget {
  final ValueChanged<int> onFormFilled;
  final StdLoadDataRes stdLoadData;

  StepOneMyPlanPage({this.onFormFilled, this.stdLoadData});

  @override
  _StepOneMyPlanPageState createState() => _StepOneMyPlanPageState();
}

class _StepOneMyPlanPageState extends State<StepOneMyPlanPage> {
  List<StudentCountry> _initialSelectedCountry = [];
  StdCourseBloc _stdCourseBloc;
  FinishFirstStepBloc _finishFirstStepBloc;

  //List<String> selectedCourses = [];
  List<Selectedcoursearr> appliedCourseList = [];
  FirstStepDto _firstStepDto;
  Startdate startDate;
  Degree studyLevel;
  int startBudget, endBudget;
  final greyTextStyle = AppTheme.termsInfoText
      .copyWith(color: AppTheme.locationTxtColor, fontWeight: FontWeight.w400);
  final heading = AppTheme.studentLabelStyle
      .copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w800);
  final subHeading = AppTheme.studentLabelStyle
      .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700);
  SizedBox gap20box = const SizedBox(
    height: 20,
  );

  @override
  void initState() {
    _stdCourseBloc = StdCourseBloc();
    _finishFirstStepBloc = FinishFirstStepBloc();

    appliedCourseList = widget.stdLoadData.selectedcoursearr;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<StdCourseBloc, StdCourseState>(
          cubit: _stdCourseBloc,
          listener: (context, state) {
            if (state is CourseApplied) {
              AppWidgetHelper.showSnackBar(
                  "Course Saved", context, AppTheme.checkBoxCheckedColor);
            }
          },
        ),
        BlocListener<FinishFirstStepBloc, FinishFirstStepState>(
          cubit: _finishFirstStepBloc,
          listener: (context, state) {
            if (state is FirstStepSuccess) {
              widget.onFormFilled(1);
            }
          },
        )
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "STEP1: MYPLAN",
                style: heading,
              ),
              gap20box,
              Text(
                "Proposed Program",
                style: subHeading,
              ),
              gap20box,
              Text(
                "Level of Study",
              ),
              gap20box,
              Container(
                width: sizeConfig.screenWidth,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StudentDegreeDropDown(
                    degreeList: widget.stdLoadData.degree,
                    onDegreeProgramSelected: onDegreeSelected,
                    // dropDownTxtStyle: AppTheme.dropDownTextStyle,
                  ),
                ),
              ),
              gap20box,
              Text(
                "Start Date",
                style: AppTheme.studentLabelStyle
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              gap20box,
              Container(
                width: sizeConfig.screenWidth,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StdStartDateDropDown(
                    startDates: widget.stdLoadData.startdates,
                    onStartDateSelected: onStartDateChanged,
                  ),
                ),
              ),
              gap20box,
              Text(
                "Budget",
                style: subHeading,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "From",
                        style: AppTheme.studentLabelStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: sizeConfig.screenWidth / 2.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BudgetDropDown(
                            budgetOptions: appCheck.budgetoptions,
                            onBudgetChange: onBudgetStartChange,
                            dropDownTxtStyle: AppTheme.dropDownTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "To",
                        style: AppTheme.studentLabelStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: sizeConfig.screenWidth / 2.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BudgetDropDown(
                            budgetOptions: appCheck.budgetoptions,
                            onBudgetChange: onBudgetEndChanged,
                            dropDownTxtStyle: AppTheme.dropDownTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Country of Study",
                style: subHeading,
              ),
              gap20box,
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                        activeColor: AppTheme.checkBoxCheckedColor,
                        value: _initialSelectedCountry.length ==
                            widget.stdLoadData.country.length,
                        onChanged: (value) {
                          setState(() {
                            _initialSelectedCountry
                                .addAll(widget.stdLoadData.country);
                          });
                        }),
                  ),
                  Text("Select All",
                      style: greyTextStyle.copyWith(
                          color: AppTheme.cardTitleTxtColor)),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _initialSelectedCountry.clear();
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.delete,
                          color: AppTheme.instituteTextColor,
                        ),
                        Text("Cancel All",
                            style: greyTextStyle.copyWith(
                                color: AppTheme.cardTitleTxtColor)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: sizeConfig.screenWidth * 0.65,
                  height: 130,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 2,
                          childAspectRatio: 4,
                          crossAxisCount: 2),
                      itemBuilder: (_, index) {
                        final country = widget.stdLoadData.country[index];
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                    activeColor: AppTheme.checkBoxCheckedColor,
                                    value: _initialSelectedCountry
                                        .contains(country),
                                    onChanged: (bool value) {
                                      if (value) {
                                        if (!_initialSelectedCountry
                                            .contains(country)) {
                                          setState(() {
                                            _initialSelectedCountry
                                                .add(country);
                                            /*countryListMap.forEach((countryName) {
                                              countryName.forEach((key,
                                                  value) {
                                                //check the initial selection of users
                                                //if selection made except those initialSelection then store the new selection in newSelectedOption
                                                if (!_initialSelectedCountry
                                                    .contains(value)) {
                                                  if (!widget
                                                      .newSelectedOption
                                                      .contains(value)) {
                                                    widget.newSelectedOption
                                                        .add(value);
                                                  }

                                                  print("new selection" +
                                                      widget.newSelectedOption
                                                          .toString());
                                                  //append the new selection to initialSelection
                                                  widget.newSelectedOption
                                                      .forEach((value) {
                                                    _initialSelectedCountry
                                                        .add(value);
                                                  });
                                                }
                                              });
                                            });*/
                                          });
                                        }
                                      } else {
                                        if (_initialSelectedCountry
                                            .contains(country)) {
                                          setState(() {
                                            _initialSelectedCountry.removeWhere(
                                                (StudentCountry thisCountry) =>
                                                    thisCountry.id ==
                                                    country.id);

                                            /*countryListMap.forEach((
                                                countryName) {
                                              countryName.forEach((key,
                                                  value) {
                                                //remove only new selection and keep the initial selection when un checking title
                                                //  if (newSelectedOption.contains(value)) {
                                                _initialSelectedCountry
                                                    .removeWhere(
                                                        (Country country) =>
                                                    country == value);
                                                // }
                                              });*/
                                          });
                                        }
                                      }
                                      /*  widget.onSelectedOptionListChanged(
                                          _initialSelectedOption);*/
                                    }),
                              ),
                              Text(country.name,
                                  style: greyTextStyle.copyWith(
                                      color: AppTheme.cardTitleTxtColor)),
                            ]);
                      },
                      itemCount: widget.stdLoadData.country.length,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  )),
              gap20box,
              Text("Select 3 courses (maximum)", style: greyTextStyle),
              SizedBox(
                height: 15,
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: 60.0,
                  minWidth: sizeConfig.screenWidth,
                  maxHeight: 180,
                  maxWidth: sizeConfig.screenWidth,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppTheme.containerBG,
                ),
                child: appliedCourseList.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          "you haven't selected any yet",
                          style: greyTextStyle,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: selectedCourseChip(appliedCourseList),
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: sizeConfig.screenWidth,
                height: 50,
                color: Colors.white,
                child: Center(
                  child: TextFormField(
                      cursorColor: AppTheme.cardTitleTxtColor,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: greyTextStyle,
                          hintText: 'Search key words..',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.0),
                            ),
                            borderSide: BorderSide(
                                width: 0.5, color: AppTheme.btnBorderColor),
                          ))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.stdLoadData.dep.length,
                    itemBuilder: (context, index) {
                      final dep = widget.stdLoadData.dep[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                    color: AppTheme.instituteTextColor,
                                    width: 1.0,
                                    style: BorderStyle.solid)),
                            minWidth: sizeConfig.screenWidth,
                            height: 50,
                            textColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    dep.name,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: AppTheme.instituteTextColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: AppTheme.instituteTextColor,
                                )
                              ],
                            ),
                            onPressed: () async {
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StdMax3CourseDialog(
                                      dep: dep,
                                      options: dep.course,
                                      selectedOptions: appliedCourseList,
                                      title: dep.name,
                                      onSelectedOptionListChanged:
                                          (selectedValue) {
                                        if (selectedValue.isNotEmpty) {
                                         // if(appliedCourseList.length<=3){
                                            appliedCourseList=selectedValue;
                                         // }

                                        }
                                      },
                                    );
                                  });
                              setState(() {
                                //selectedCourses = selectedCourseKey;
                              });
                            },
                          ),
                        ],
                      );
                    }),
              ),
              /*gap20box,
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                        activeColor: AppTheme.checkBoxCheckedColor,
                        value: true,
                        onChanged: (value) {}),
                  ),
                  Text(
                    "Others",
                    style:
                        greyTextStyle.copyWith(color: AppTheme.cardTitleTxtColor),
                  ),
                ],
              ),*/
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
                      // widget.onFormFilled(1);
                      _stdCourseBloc.add(SaveCourse(
                          courses: appliedCourseList,
                          stdId: widget.stdLoadData.myid));
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
                      //print(_initialSelectedCountry.length.toString());
                      _firstStepDto = FirstStepDto(
                          startdate: startDate != null
                              ? startDate.value
                              : widget.stdLoadData.startdates[0].value,
                          countryinsert: _initialSelectedCountry,
                          level: studyLevel != null
                              ? studyLevel.degreeId
                              : widget.stdLoadData.degree[0].degreeId,
                          startbudgt: startBudget ??
                              int.parse(widget.stdLoadData.budgetstart),
                          endbudgt: endBudget ??
                              int.parse(widget.stdLoadData.budgetend));
                      if (_initialSelectedCountry.isNotEmpty) {
                        _stdCourseBloc.add(SaveCourse(
                            courses: appliedCourseList,
                            stdId: widget.stdLoadData.myid));
                        _finishFirstStepBloc.add(FinishFirstStdStep(
                            firstStepDto: _firstStepDto,
                            stdId: widget.stdLoadData.myid));
                        // widget.onFormFilled(1);
                      } else {
                        AppWidgetHelper.showSnackBar(
                            "Please select the interested country.", context);
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

  void onStartDateChanged(Startdate value) {
    setState(() {
      startDate = value;
    });
  }

  void onBudgetEndChanged(Budgetoption value) {
    setState(() {
      endBudget = value.id;
    });
  }

  void onBudgetStartChange(Budgetoption value) {
    setState(() {
      startBudget = value.id;
    });
  }
}

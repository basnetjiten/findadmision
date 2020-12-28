import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/institutes/course/course_bloc.dart';
import 'package:findadmissionaffiliate/dto/institutes/selected_course.dart';
import 'package:findadmissionaffiliate/dto/stepper_btn_cmd.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/helpers/loading_indicator_dialog.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/max_3_select_courses_dialog.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:findadmissionaffiliate/dto/institutes/courses.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepTwoApplicationForm extends StatefulWidget {
  final String stdId, instId, level;
  final Instapolicy pageData;
  final double adjustablePadding;
  final ValueChanged<StepperCommand> onCoursesStatusChanged;

  const StepTwoApplicationForm(
      {Key key,
      this.level,
      this.stdId,
      this.instId,
      this.onCoursesStatusChanged,
      this.adjustablePadding,
      this.pageData})
      : super(key: key);

  @override
  _StepTwoApplicationFormState createState() => _StepTwoApplicationFormState();
}

class _StepTwoApplicationFormState extends State<StepTwoApplicationForm> {
  ScrollController scrollTopController;
  final greyTextStyle = AppTheme.termsInfoText
      .copyWith(color: AppTheme.locationTxtColor, fontWeight: FontWeight.w400);
  StepperCommand stepperCommand =
      StepperCommand(pageIndex: 1, cancelOrContinue: false);

  //List<ApplyCourseDto> selectedCourses = [];
  SelectedCourse selectedCourse;
  Instapolicy instaPolicy;
  CourseBloc courseBloc;

  @override
  void initState() {

    scrollTopController = ScrollController(initialScrollOffset:0);
    courseBloc = CourseBloc();
    selectedCourse = getIt<SelectedCourse>();
    // selectedCourses = [];
    instaPolicy = widget.pageData;
    /*WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollTopController.jumpTo(0);
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollTopController.jumpTo(0));
    return BlocListener<CourseBloc, CourseState>(
      cubit: courseBloc,
      listener: (context, state) {
        /*if (state is CourseInitial) {

        }*/
        if (state is CourseApplied) {
          LoadingDialog.hide(context);
          if (state.courseAppliedRes.gonext) {
            stepperCommand.cancelOrContinue = true;
            widget.onCoursesStatusChanged(stepperCommand);
          }
        }
        if (state is CourseApplyError) {
          LoadingDialog.hide(context);
          AppWidgetHelper.showSnackBar("Error Proceeding", context);
        }
      },
      child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              controller: scrollTopController,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: widget.adjustablePadding ??
                          sizeConfig.screenHeight * 0.2,
                    ),
                    Text(
                      "Course Applied",
                      style: AppTheme.profileInfoStyle.copyWith(
                          color: AppTheme.cardTitleTxtColor,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                      child: selectedCourse.appliedCourseList == null
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Text(
                                "you haven't selected any yet",
                                style: greyTextStyle,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                              child: selectedCourseChip(
                                  selectedCourse.appliedCourseList),
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
                                      width: 0.5,
                                      color: AppTheme.btnBorderColor),
                                ))),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: instaPolicy.course.length,
                          itemBuilder: (context, index) {
                            final course = instaPolicy.course[index];
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          course.name,
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
                                    final selectedCourseKey = await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Max3CourseSelection(
                                            options: course,
                                            selectedOptions: selectedCourse
                                                .appliedCourseList,
                                            fromProfileEdit: true,
                                            title: course.name,
                                            onSelectedOptionListChanged:
                                                (selectedValue) {
                                              if (selectedValue.isNotEmpty) {
                                                selectedCourse.addCourseToList(
                                                    selectedValue);
                                                /* print(selectedCourse
                                                    .appliedCourseList.length
                                                    .toString());*/
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
                          minWidth: 155,
                          height: 48,
                          textColor: Colors.white,
                          child: Text(
                            "BACK",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: AppTheme.instituteTextColor,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8),
                          ),
                          onPressed: () {
                            //Navigator.of(context).pop();
                            widget.onCoursesStatusChanged(stepperCommand);
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
                          minWidth: 155,
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
                            if (selectedCourse.appliedCourseList.isNotEmpty) {
                              LoadingDialog.show(context);
                              courseBloc.add(SelectCourse(
                                  level: widget.level,
                                  courses: selectedCourse.appliedCourseList,
                                  instId: widget.instId,
                                  stdId: widget.stdId));
                              /*stepperCommand.cancelOrContinue = true;
                              widget.onCoursesStatusChanged(stepperCommand);*/
                            } else {
                              AppWidgetHelper.showSnackBar(
                                  "Please select max 3 courses.", context);
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

  InputDecoration buildInputDecoration() {
    return InputDecoration(
        filled: true,
        // errorStyle: TextStyle(color: Color(0xff886069)),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 25.0, 23.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: AppTheme.btnBorderColor),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)));
  }

  Widget selectedCourseChip(List<ApplyCourseDto> selectedCourses) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 8.0,
      // gap between adjacent chips
      //runSpacing: 4.0, // gap between lines
      children: <Widget>[
        for (int i = 0; i < selectedCourses.length; i++)
          if (selectedCourses[i].name.isNotEmpty)
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
}

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/dropdowns/course_dropdown.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Courses extends StatefulWidget {
  final InstituteDetailRes instDetailRes;

  Courses({this.instDetailRes});

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<InstapolicyCourse> instaCourse;
  final subTitleGaping = const SizedBox(height: 5.0);

  final titleGaping = const SizedBox(height: 15.0);

  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, fontWeight: FontWeight.w700);

  final TextStyle subTitleStyle = AppTheme.helperLabelStyle.copyWith(
      color: AppTheme.instituteTextColor, fontWeight: FontWeight.w600);

  final TextStyle chipsStyle = GoogleFonts.workSans(
      textStyle: AppTheme.studentLabelStyle.copyWith(
          color: AppTheme.cardTitleTxtColor, fontWeight: FontWeight.w400));

  @override
  void initState() {
    instaCourse = widget.instDetailRes.instapolicy[0].course;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Container(
              height: 42,
              width: sizeConfig.screenWidth,
              decoration: BoxDecoration(
                //color: Color(0xff212F3F),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: AppTheme.cardTitleTxtColor)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CourseDropDown(
                  dropDownTxtStyle: AppTheme.dropDownTextStyle,
                  instaPolicy: widget.instDetailRes.instapolicy,
                  onCourseChange: onCourseChange,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Faculty",
              style: titleStyle,
            ),
            AppWidgetHelper.divider(AppTheme.instituteTextColor),
            CourseExpansionTile(
                instapolicyCourse: instaCourse,
                subTitleStyle: subTitleStyle,
                chipsStyle: chipsStyle),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  void onCourseChange(List<InstapolicyCourse> value) {
    setState(() {
      instaCourse = value;
    });
  }
}

class CourseExpansionTile extends StatelessWidget {
  const CourseExpansionTile({
    this.instapolicyCourse,
    Key key,
    @required this.subTitleStyle,
    @required this.chipsStyle,
  }) : super(key: key);

  final TextStyle subTitleStyle;
  final TextStyle chipsStyle;
  final List<InstapolicyCourse> instapolicyCourse;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 500,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: instapolicyCourse.length,
          itemBuilder: (context, index) {
            final InstapolicyCourse instPolicyCourse = instapolicyCourse[index];

            return ExpansionTile(
              title: Text(
                instPolicyCourse.name,
                style: subTitleStyle,
              ),
              children: [
                Container(
                  width: sizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: AppTheme.containerBG,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        spacing: 8.0,
                        // gap between adjacent chips
                        //runSpacing: 4.0, // gap between lines
                        children: <Widget>[
                          for (int i = 0; i <
                              instPolicyCourse.course.length; i++)

                            Chip(
                              label: Text(
                                instPolicyCourse.course[i].name,
                                style: chipsStyle,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(
                                    width: 0.5,
                                    color: AppTheme.cardTitleTxtColor,
                                  )),
                              // backgroundColor: AppTheme.checkBoxCheckedColor,
                            ),
                        ],
                      ) /*Container(
                        height: 100,
                        width: double.maxFinite,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: instPolicyCourse.course.length,
                          itemBuilder: (context, index) {
                            final course = instPolicyCourse.course[index];
                            return Chip(
                              label: Text(
                                course.name,
                                style: chipsStyle,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(
                                    width: 0.5,
                                    color: AppTheme.cardTitleTxtColor,
                                  )),
                              // backgroundColor: AppTheme.checkBoxCheckedColor,
                            );
                          },
                        ),
                      )*/,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

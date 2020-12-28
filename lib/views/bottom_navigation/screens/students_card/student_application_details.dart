import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/action_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/select_institute.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/student_application_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentApplicationDetails extends StatefulWidget {
  final Studentlist student;
  StudentApplicationDetails({this.student});

  @override
  _StudentApplicationDetailsState createState() =>
      _StudentApplicationDetailsState();
}

class _StudentApplicationDetailsState extends State<StudentApplicationDetails>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  AnimationController controller;

  final GlobalKey<StudentApplicationExpansionTileState> studentTile =
      new GlobalKey();

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
    );

    return Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        elevation: 1,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Theme(
                  data: theme,
                  child: StudentApplicationExpansionTile(
                    key: studentTile,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _isExpanded = expanded;
                      });
                    },
                    title: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 50),
                            Text(
                              widget.student.membersFirstname +" "+widget.student.membersLastname,
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontSize: 16.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Account ID : ${widget.student.membersId}",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            Text(
                              "Subscription: None  ",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            Text(
                              "Country : ${widget.student.countryName} ",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                           /* Text(
                              "Gender : ${widget.student.} ",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),*/
                            /*Text(
                              "Date of Birth : 21/9/1988 ",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),*/
                            Visibility(
                              visible: !_isExpanded,
                              child: buildSeeMoreRow(Icon(
                                Icons.keyboard_arrow_down,
                                color: AppTheme.instituteTextColor,
                              ),"See More"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        Positioned(
                          left:-20,
                          top:0,
                          bottom:0,
                          right:0,
                          child: Align(
                            alignment:Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(CupertinoIcons.back),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Text(
                                  "Student Details",
                                  style: AppTheme.helperLabelStyle.copyWith(
                                      fontSize: 18.0,
                                      color: AppTheme.cardTitleTxtColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AppWidgetHelper.divider(),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Contact",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontSize: 16.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Phone: +44-7482172833",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            Text(
                              "Whatsapp: +44-7482172833",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            Text(
                              "Email: Idris Taofeek@gmail.com",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            Text(
                              "Gender : Female ",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            Text(
                              "Date of Birth : ",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/whatsapplogo.svg"),
                                SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset("assets/whatsapptitle.svg")
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppWidgetHelper.divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Student Profile",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontSize: 16.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Phone: +44-7482172833",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            Text(
                              "Whatsapp: +44-7482172833",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            Text(
                              "Email: Idris Taofeek@gmail.com",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            Text(
                              "Gender : Female ",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            Text(
                              "Date of Birth : ",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Unifinished",
                                  style: AppTheme.clickableTermsStyle
                                      .copyWith(color: AppTheme.editTxtColor),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  color: AppTheme.editBtnColor,
                                  minWidth: 40,
                                  height: 30,
                                  textColor: Colors.white,
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppWidgetHelper.divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Actions",
                              style: AppTheme.helperLabelStyle.copyWith(
                                fontSize: 16.0,
                                color: AppTheme.cardTitleTxtColor,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 42,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      //color: Color(0xff212F3F),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                          color: AppTheme.btnBorderColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: ActionDropDown(),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  color: AppTheme.checkBoxCheckedColor,
                                  minWidth: 120,
                                  height: 42,
                                  textColor: Colors.white,
                                  child: Text(
                                    "Apply",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (_)=>SelectInstitute(student: widget.student,)
                                    ));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                studentTile.currentState.collapse();
                              },
                              child: Visibility(
                                visible: _isExpanded,
                                child: buildSeeMoreRow(Icon(
                                  Icons.keyboard_arrow_up,
                                  color: AppTheme.instituteTextColor,
                                ),"See Less"),
                              ),
                            ),
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
          ),
        ));
  }

  Widget buildSeeMoreRow(Icon icon,String title) {
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: () {
          studentTile.currentState.toggle();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Container(
                height: 50,
                width: 100,
                child: Center(
                  child: Text(
                    title,
                    style: AppTheme.instituteStyle
                        .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            icon
          ],
        ),
      ),
    );
  }
}

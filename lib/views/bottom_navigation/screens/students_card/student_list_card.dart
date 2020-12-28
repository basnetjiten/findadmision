
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/student_status/student_status_bloc.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/student_status_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/profile/profile.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/students.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  final Studentlist studentlist;
  final Studentstatus initialStatus;
  StudentList({this.studentlist,this.initialStatus});

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  StudentStatusBloc studentStatusBloc;
  Studentlist stdlist;
  TextStyle subTitle =
  AppTheme.studentLabelStyle.copyWith(color: AppTheme.cardTitleTxtColor);

  @override
  void initState() {
    studentStatusBloc= StudentStatusBloc();
    stdlist=widget.studentlist;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: sizeConfig.screenWidth,
          height: sizeConfig.screenHeight / 2.75,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7)),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Scrollbar(
              //isAlwaysShown: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                       // width: sizeConfig.screenWidth/3,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text(
                              stdlist.membersFirstname+" "+stdlist.membersLastname,
                              style: AppTheme.instituteStyle.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 18.0),
                              maxLines: null,
                            ),
                            Container(
                              //width: sizeConfig.screenWidth/2.5,

                              child: Text(
                                "${stdlist.countryName} | ${stdlist.membersId}",
                                style: subTitle,
                                maxLines: null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(

                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      "Profile",
                                      style: subTitle.copyWith(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Application",
                                      style: subTitle.copyWith(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 7,),
                                        Row(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
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
                                              onPressed: () {
                                                print("STUDENT ID"+stdlist.membersId);
                                                Navigator.of(context).push(
                                                    CupertinoPageRoute(
                                                        builder: (_) =>
                                                            StudentProfile(stdId: stdlist.membersId,country: stdlist.countryName,)));
                                              },
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [Column(
                                            children: [
                                              Text(
                                                "Incomplete",
                                                style: subTitle,
                                              ),
                                              Text(
                                                "Complete ",
                                                style: subTitle,
                                              ),
                                              Text(
                                                "-Accepted:",
                                                style: subTitle,
                                              ),
                                              Text(
                                                "-Rejected:",
                                                style: subTitle,
                                              ),
                                            ],
                                          ),
                                            Column(
                                              children: [
                                                Text(
                                                  "${stdlist.inCompletedCount}",
                                                  style: subTitle,
                                                ),
                                                Text(
                                                  "${stdlist.completedCount}",
                                                  style: subTitle,
                                                ),
                                                Text(
                                                  "${stdlist.acceptedCount}",
                                                  style: subTitle,
                                                ),
                                                Text(
                                                  "${stdlist.rejectedCount}",
                                                  style: subTitle,
                                                ),
                                              ],
                                            )],
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 42,
                            width: sizeConfig.screenWidth / 2.8,
                            decoration: BoxDecoration(
                              //color: Color(0xff212F3F),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                border: Border.all(color: AppTheme.btnBorderColor)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child:
                              StudentStatusDropDown(
                                initialStatus: widget.initialStatus,
                                studentStatusList: appCheck.studentstatus,
                                onStatusChange: onStdStatusChange,
                              )
                              ,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: AppTheme.officeBGColor,
                            minWidth: sizeConfig.screenWidth / 2.8,
                            height: 42,
                            textColor: Colors.white,
                            child: Text(
                              "See Detail",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (_) => StudentPage(std:stdlist)));
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }

  void onStdStatusChange(Studentstatus value) {
    studentStatusBloc.add(UpdateStdStatus(stdId: widget.studentlist.membersId,newStatus: value.id.toString()));
  }
}
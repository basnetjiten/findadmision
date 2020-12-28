import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationCard extends StatelessWidget {
  const ApplicationCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(

      borderOnForeground: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(

          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                     "assets/application.svg"
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Applications",
                      style: AppTheme.helperLabelStyle.copyWith(
                          fontSize: 18.0,
                          color: AppTheme.cardTitleTxtColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Uncompleted",
                        style: TextStyle(
                            color: Color(0xff191919), fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Pending",
                        style: TextStyle(
                            color: Color(0xff191919), fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  SizedBox(width: 12,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgetHelper.counterContainer(dashboardDataRes.applicationcount[0].count),
                      SizedBox(
                        height: 18,
                      ),
                      AppWidgetHelper.counterContainer(dashboardDataRes.applicationcount[2].count),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Submitted",
                        style: TextStyle(
                            color: Color(0xff191919), fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Enrolled",
                        style: TextStyle(
                            color: Color(0xff191919), fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  SizedBox(width: 12,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgetHelper.counterContainer(dashboardDataRes.applicationcount[1].count),
                      SizedBox(
                        height: 18,
                      ),
                      AppWidgetHelper.counterContainer(dashboardDataRes.applicationcount[3].count),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey,),
              Container(
                // width: 440,
                height: 250,
                child: Column(
                  children: <Widget>[

                    Container(
                      height: 50,
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                          "assets/student.svg"
                      ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Students",
                            style: AppTheme.profileInfoStyle.copyWith(

                                color: AppTheme.cardTitleTxtColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Active",
                              style: TextStyle(
                                  color: Color(0xff191919), fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              "Offered",
                              style: TextStyle(
                                  color: Color(0xff191919), fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        SizedBox(width: 45,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgetHelper.counterContainer(dashboardDataRes.studentcount[0].count),
                            SizedBox(
                              height: 18,
                            ),
                            AppWidgetHelper.counterContainer(dashboardDataRes.applicationcount[2].count),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "In-active",
                              style: TextStyle(
                                  color: Color(0xff191919), fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              "Admitted",
                              style: TextStyle(
                                  color: Color(0xff191919), fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        SizedBox(width: 12,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgetHelper.counterContainer(dashboardDataRes.applicationcount[1].count),
                            SizedBox(
                              height: 18,
                            ),
                            AppWidgetHelper.counterContainer(dashboardDataRes.applicationcount[3].count),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(color: Colors.grey,),
                    SizedBox(height: 15,),
                    MaterialButton(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppTheme.checkBoxCheckedColor,
                      minWidth: 350,
                      height: 50,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add,color: Colors.white,),
                          Text(
                            "Add Students",
                            style: TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ],
                      ),
                      onPressed: () {
                        //refresh any left out pages from the begining
                        final CupertinoTabBar navigationBar = globalKey.currentWidget;
                       // final Widget studentKey = thirdTabNavKey.currentWidget;
                        Navigator.of(thirdTabNavKey.currentState.context)
                            .popUntil((Route<dynamic> r) => r.isFirst);
                        navigationBar.onTap(2);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

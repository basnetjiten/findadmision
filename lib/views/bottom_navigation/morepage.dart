import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/office_list_bloc/office_list_bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/repository/user/menu/local_repo.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/office_cards/my_office.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/office_cards/my_office_list.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/setting.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/office_list_max_3.dart';
import 'package:findadmissionaffiliate/views/login/login.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  Widget morePage;
  OfficeListBloc _officeListBloc;

  @override
  void initState() {
    _officeListBloc = BlocProvider.of<OfficeListBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.greyBackground,
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              15,
              sizeConfig.isMediumScreen()
                  ? sizeConfig.screenHeight * 0.15
                  : sizeConfig.screenHeight * 0.15,
              15,
              15),
          child: Column(
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                color: Colors.white,
                minWidth: sizeConfig.screenWidth / 2.8,
                height: 70,
                textColor: Colors.white,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/myoffice.png",
                        fit: BoxFit.contain,
                        height: 27,
                        width: 27,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "My Office",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppTheme.cardTitleTxtColor,
                            fontWeight: FontWeight.w800),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15.0,
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  if (officeList.isEmpty) {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (_) => BlocProvider<OfficeListBloc>(
                            create: (context) => _officeListBloc,
                            child: MyOffice())));
                  } else {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (_) => BlocProvider<OfficeListBloc>(
                            create: (context) => _officeListBloc,
                            child: MyOfficeList(
                              parentContext: context,
                            ))));
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                color: Colors.white,
                minWidth: sizeConfig.screenWidth / 2.8,
                height: 70,
                textColor: Colors.white,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/setting.png",
                        fit: BoxFit.contain,
                        height: 27,
                        width: 27,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppTheme.cardTitleTxtColor,
                            fontWeight: FontWeight.w800),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15.0,
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (_) => Setting()));
                },
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                color: Colors.white,
                minWidth: sizeConfig.screenWidth / 2.8,
                height: 70,
                textColor: Colors.white,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/logout.png",
                        fit: BoxFit.contain,
                        height: 27,
                        width: 27,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppTheme.cardTitleTxtColor,
                            fontWeight: FontWeight.w800),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15.0,
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(child: Text("Log out")),
                          content: Container(
                            height: 200,
                            width: 345,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Are you sure to Logout?"),
                                  SizedBox(
                                    height: 104,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              side: BorderSide(
                                                  color: AppTheme
                                                      .instituteTextColor,
                                                  width: 1.0,
                                                  style: BorderStyle.solid)),
                                          minWidth:
                                              sizeConfig.screenWidth / 2.8,
                                          height: 48,
                                          textColor: Colors.white,
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color:
                                                    AppTheme.instituteTextColor,
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
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          minWidth:
                                              sizeConfig.screenWidth / 2.8,
                                          height: 50,
                                          color: AppTheme.instituteTextColor,
                                          child: Text(
                                            "Log out",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 0.8),
                                          ),
                                          onPressed: () async {
                                            getIt<LocalLoginRepository>()
                                                .deleteAllLoginResponse();
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginPage()),
                                                    (Route<dynamic> route) =>
                                                        false);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

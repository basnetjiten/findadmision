import 'dart:async';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/application/application_bloc.dart';
import 'package:findadmissionaffiliate/bloc/fcm_token_bloc/firebase_token_check_bloc.dart';
import 'package:findadmissionaffiliate/bloc/office_list_bloc/office_list_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/student_bloc/add_students_bloc.dart';
import 'package:findadmissionaffiliate/bloc/univ_filter_bloc/univ_filter_bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/auth/fcm_token_check.dart';
import 'package:findadmissionaffiliate/models/login/login_response.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/home.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/institutes.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/morepage.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/nav_drawer.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/colleges_list_card.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/institute_details.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/student_index.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/students.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/transaction.dart';
import 'package:findadmissionaffiliate/views/global_scaffold.dart';
import 'package:findadmissionaffiliate/views/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:findadmissionaffiliate/main.dart';
import 'dart:io';

import '../../univ_global.dart';

GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> fifthTabNavKey = GlobalKey<NavigatorState>();

class BottomNavigationPage extends StatefulWidget {
  final LoginResponse loginResponse;

  BottomNavigationPage({this.loginResponse});

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage>
    with AutomaticKeepAliveClientMixin<BottomNavigationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final itemTitleColor = Color(0xffC0CEDF);
  List<Widget> _widgetList;
  List<Widget> _institutePages;
  int selectedInstitutePage = 0;
  OfficeListBloc _officeListBloc;
  AddStudentsBloc _addStudentsBloc;

  UnivFilterResponse univFilterResponse;



  @override
  void initState() {
    activeCountryList = [];

    //bloc instantiation
    _addStudentsBloc = AddStudentsBloc();
    _officeListBloc = OfficeListBloc();

    _addStudentsBloc.add(FetchStudentList());
    _institutePages = [
      InstitutePage(),
      InstituteDetails(),
    ];
    /*
    _widgetList = [
      HomePage(),
      _institutePages[selectedInstitutePage],
      StudentPage(),
      Container(
        height: 50,
        width: 50,
        color: Colors.blue,
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.blue,
      ),
      Container(
        height: 50,
        width: 50,
        color: Colors.blue,
      ),
    ];*/
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
           onWillPop: () async => exit(0),
           child: GlobalScaffold(

               child: Scaffold(
                   resizeToAvoidBottomPadding: false,
                   resizeToAvoidBottomInset: false,
                   key: _scaffoldKey,
                   endDrawer: NavigationDrawer(),
                   body: buildCupertinoTabScaffold())),
         );

  }

  CupertinoTabScaffold buildCupertinoTabScaffold() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        key: globalKey,
        activeColor: Colors.white,
        inactiveColor: AppTheme.navInactiveColor,
        backgroundColor: AppTheme.darkGreyBGColour,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: buildSvgPicture(
              'assets/dashboard_filled.svg',
            ),
            icon: buildSvgPicture(
              'assets/dashboard_outln.svg',
            ),
            title: Text("Home", style: TextStyle(fontSize: 12.0)),
          ),
          BottomNavigationBarItem(
            activeIcon: buildSvgPicture(
              'assets/colluges_filled.svg',
            ),
            icon: buildSvgPicture(
              'assets/colluges_outln.svg',
            ),
            title: Text("Institutes", style: TextStyle(fontSize: 12.0)),
          ),
          BottomNavigationBarItem(
            activeIcon: buildSvgPicture(
              'assets/profile_filled.svg',
            ),
            icon: buildSvgPicture(
              'assets/profile_outln.svg',
            ),
            title: Text("Students", style: TextStyle(fontSize: 12.0)),
          ),
          BottomNavigationBarItem(
              activeIcon: buildSvgPicture(
                'assets/transaction_filled.svg',
              ),
              icon: buildSvgPicture(
                'assets/transaction_outln.svg',
              ),
              title: Text("Transactions", style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(
              activeIcon: buildMoreIcon(
                'assets/more_filled.svg',
              ),
              icon: buildMoreIcon(
                'assets/more_outln.svg',
              ),
              title: Text(
                "More",
                style: TextStyle(fontSize: 12.0),
              )),
        ],
      ),
      // ignore: missing_return
      tabBuilder: (BuildContext context, int index) {
        // ignore: missing_return
        if (index == 0) {
          return CupertinoTabView(
            navigatorKey: firstTabNavKey,
            builder: (BuildContext context) =>
                BlocProvider<OfficeListBloc>.value(
                    value: _officeListBloc, child: HomePage()),
          );
        } else if (index == 1) {
          return CupertinoTabView(
            navigatorKey: secondTabNavKey,
            builder: (BuildContext context) => InstitutePage(),
          );
        } else if (index == 2) {
          return CupertinoTabView(
            navigatorKey: thirdTabNavKey,
            builder: (BuildContext context) => BlocProvider<AddStudentsBloc>(
                create: (context) => _addStudentsBloc,
                child: StudentIndexPage()),
          );
        } else if (index == 3) {
          return CupertinoTabView(
            navigatorKey: fourthTabNavKey,
            builder: (BuildContext context) => Transaction(),
          );
        } else if (index == 4) {
          return CupertinoTabView(
            navigatorKey: fifthTabNavKey,
            builder: (BuildContext context) => BlocProvider<OfficeListBloc>(
                create: (context) => _officeListBloc, child: MorePage()),
          );
        }
      },
    );
  }

  SvgPicture buildSvgPicture(String asset) {
    return SvgPicture.asset(
      asset,
      height: 25,
      width: 25,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  buildMoreIcon(String asset) {
    return SvgPicture.asset(
      asset,
      height: 5,
      width: 5,
    );
  }


}

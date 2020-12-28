import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/setting_account_bloc/account_setting_bloc.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/account.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/reset_pw.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/custom_tab_bar.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Widget settingPage;
  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, fontWeight: FontWeight.w800);
  AccountSettingBloc accountSettingBloc;

  @override
  void initState() {
    super.initState();
    accountSettingBloc = AccountSettingBloc()..add(FetchAccountSetting());
  }
  @override
  void dispose() {
    accountSettingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.greyBackground,
        body: Padding(
          padding:
              EdgeInsets.fromLTRB(15.0, sizeConfig.screenHeight * 0.15, 15, 15),
          child: Material(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
            elevation: 1,
            child: Container(
              width: sizeConfig.screenWidth,
              height: sizeConfig.screenHeight,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Expanded(
                        child: Container(
                            width: sizeConfig.screenWidth,
                            height: sizeConfig.screenHeight,
                            child: buildDefaultTabController(
                                sizeConfig.screenWidth)),
                      ),
                    ],
                  ),
                  Positioned(
                    left: -15,
                    right: 0,
                    bottom: 0,
                    top: 10,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            icon: Icon(CupertinoIcons.back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          //SizedBox(width: 4,),
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
                            style: titleStyle,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildDefaultTabController(screenWidth) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(-sizeConfig.screenHeight * 0.05),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizeConfig.screenWidth * 0.035),
            child: CustomTabBar(
              tabBar: TabBar(
                labelStyle: sizeConfig.isMediumScreen()
                    ? AppTheme.chipStyle
                        .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold)
                    : AppTheme.chipStyle
                        .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
                isScrollable: false,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: sizeConfig.isMediumScreen()
                    ? AppTheme.chipStyle
                        .copyWith(fontSize: 16.0, fontWeight: FontWeight.normal)
                    : AppTheme.chipStyle.copyWith(
                        fontSize: 16.0, fontWeight: FontWeight.normal),

                labelColor: AppTheme.checkBoxCheckedColor,
                // indicatorColor: AinAppTheme.brandColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: UnderlineTabIndicator(
                  insets: const EdgeInsets.symmetric(horizontal: 15),
                  borderSide: BorderSide(
                      color: AppTheme.checkBoxCheckedColor, width: 5.0),
                ),
                tabs: [
                  Tab(
                    text: "Account",
                  ),
                  Tab(text: "Password Reset"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(children: [AccountPage(accountBloc:accountSettingBloc), ResetPassword()]),
      ),
    );
  }
}

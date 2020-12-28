import 'dart:async';

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/setting_account_bloc/account_setting_bloc.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/edit_account.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  final AccountSettingBloc accountBloc;

  AccountPage({this.accountBloc});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final subTitleGaping = const SizedBox(height: 5.0);
  final titleGaping = const SizedBox(height: 15.0);
  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  final TextStyle subTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w600);
  final TextStyle smallTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400);

  Map<String, String>  account;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountSettingBloc, AccountSettingState>(
      cubit: widget.accountBloc,
      // ignore: missing_return
      builder: (context, state) {
        if (state is AccountSettingInitial) {
          return Center(child: AppWidgetHelper.loadingIndicator());
        }
        if (state is AccountSettingLoaded) {
           account = state.setting.partnerDet;
          return buildContainer(context);
        }
        /*if (state is AccountSettingUpdated) {
          return buildContainer(context);
        }*/
        /*if (state is AccountSettingRefreshed) {
          account = state.setting.partnerDet;
          return buildContainer(context);
        }*/
      },
    );
  }

  Widget buildContainer(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SingleChildScrollView(
            child: Container(
              width: sizeConfig.screenWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company Name",
                      style: subTitleStyle,
                    ),
                    subTitleGaping,
                    Text(
                      account["partner_companyname"],
                      style: smallTitleStyle,
                    ),
                    titleGaping,
                    Text(
                      "Full Name",
                      style: subTitleStyle,
                    ),
                    subTitleGaping,
                    Text(
                      account["partner_name"],
                      style: smallTitleStyle,
                    ),
                    titleGaping,
                    Text(
                      "Email",
                      style: subTitleStyle,
                    ),
                    subTitleGaping,
                    Text(
                      account["partner_email"],
                      style: smallTitleStyle,
                    ),
                    titleGaping,
                    Text(
                      "Phone",
                      style: subTitleStyle,
                    ),
                    subTitleGaping,
                    Text(
                      account["partner_phone"],
                      style: smallTitleStyle,
                    ),
                    titleGaping,
                    AppWidgetHelper.divider(),
                    titleGaping,
                    Text(
                      "Bank Account",
                      style: subTitleStyle,
                    ),
                    subTitleGaping,
                    Text(
                      account["partner_accno"],
                      style: smallTitleStyle,
                    ),
                    titleGaping,
                    Text(
                      "Bank Address",
                      style: subTitleStyle,
                    ),
                    subTitleGaping,
                    Text(
                      account["partner_bankaddress"],
                      style: smallTitleStyle,
                    ),
                    titleGaping,
                    Text(
                      "Account Holder Name",
                      style: subTitleStyle,
                    ),
                    subTitleGaping,
                    Text(
                      account["partner_accholder"],
                      style: smallTitleStyle,
                    ),
                    titleGaping,
                    Text(
                      "Account Swift",
                      style: subTitleStyle,
                    ),
                    subTitleGaping,
                    Text(
                      account["partner_accswift"],
                      style: smallTitleStyle,
                    ),
                    titleGaping,
                    Text(
                      "Routing No.",
                      style: subTitleStyle,
                    ),
                    subTitleGaping,
                    Text(
                      account["partner_routing"],
                      style: smallTitleStyle,
                    ),
                    titleGaping,
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(
                              color: AppTheme.instituteTextColor,
                              width: 1.0,
                              style: BorderStyle.solid)),
                      minWidth: sizeConfig.screenWidth,
                      height: 48,
                      textColor: Colors.white,
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: AppTheme.instituteTextColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8),
                      ),
                      onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                            builder: (_) =>  EditAccount(
                                  account: account,
                                  accountBloc:widget.accountBloc,
                                )));

                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }


}

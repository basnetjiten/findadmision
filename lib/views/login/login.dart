import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/findadmision_dialog.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/views/login/partials/login_form.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  final String passwordRequestMail;

  LoginPage([this.passwordRequestMail]);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    // print(widget.passwordResetMessage ?? "null");
    if (widget.passwordRequestMail != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        /*_scaffoldKey.currentState.showSnackBar(SnackBar(

       content: Text(widget.passwordResetMessage),
       behavior: SnackBarBehavior.floating,
     ));*/
        Flushbar(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(20, 120, 30, 0),
          //animationDuration: Duration(seconds: 1),
          borderRadius: 8,
          backgroundColor: Colors.white,
          //message: "hellooooooooooo fdfjd oid fdf ",
          messageText: Text(
            "Find your new password from the email ${widget.passwordRequestMail}",
            style: TextStyle(
                color: Color(0xff2D79AD),
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          flushbarPosition: FlushbarPosition.TOP,
          /*icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Color(0xff2D79AD),
        ),*/
          flushbarStyle: FlushbarStyle.FLOATING,
          duration: Duration(seconds: 7),
        )..show(_scaffoldKey.currentState.context);
      });
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: RepositoryProvider<AppCheck>(
        create: (buildContext) => appCheck,
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomPadding: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: AppTheme.lightGreyBGColour,
          body: Padding(
            padding:
                EdgeInsets.fromLTRB(30, sizeConfig.screenHeight * 0.07, 30, 0),
            child: Container(
              // height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: sizeConfig.screenHeight * 0.1,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AppWidgetHelper.bannerLogo())),
                    ),
                  ),
                  Positioned(
                    top: sizeConfig.screenHeight * 0.12,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: LoginForm(
                        parentContext: buildContext,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future showLoginDialog(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AdmissionProgressDialog('Loggin in..');
        });
  }
}

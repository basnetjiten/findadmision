import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/univ_filter_bloc/univ_filter_bloc.dart';
import 'package:findadmissionaffiliate/constants/routing_constants.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/models/login/login_response.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_review/launch_review.dart';

class NewAppUpdate extends StatefulWidget {
  final AppCheck appCheck;
  final LoginResponse loginResponse;

  NewAppUpdate({this.appCheck, this.loginResponse});

  @override
  _NewAppUpdateState createState() => _NewAppUpdateState();
}

class _NewAppUpdateState extends State<NewAppUpdate> {
  String androidUrl;
  final headingMessageStyle = GoogleFonts.inter(
      textStyle: AppTheme.studentLabelStyle.copyWith(
          letterSpacing: 0,
          wordSpacing: 0,
          color: AppTheme.switchAppTitleColor,
          fontWeight: FontWeight.w700,
          fontSize: 22.0));

  final textMessageStyle = GoogleFonts.inter(
    textStyle: AppTheme.helperLabelStyle.copyWith(
        height: 1.3,
        color: Color.fromRGBO(
          255,
          255,
          255,
          0.9,
        ),
        fontWeight: FontWeight.w400,
        fontSize: 15.0),
  );

  @override
  void initState() {
    androidUrl = widget.appCheck.androidurl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: AppTheme.darkGreyBGColour,
          height: sizeConfig.screenHeight,
          width: sizeConfig.screenWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 225,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AppWidgetHelper.bannerLogo())),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 60,
                        width: 255,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "It's time to switch to",
                              style: headingMessageStyle,
                            ),
                            Text(
                              " our new app!",
                              style: headingMessageStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(
                                    'assets/images/updateicon.png'))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizeConfig.screenHeight * 0.05,
                ),
                Text(
                    "The app you're using have been updated. The new Version is quicker, simpler and has more important features that you will need.",
                    style: textMessageStyle),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    "To make your study abroad dream much easier, please download the latest version now",
                    style: textMessageStyle),
                SizedBox(
                  height: sizeConfig.screenHeight * 0.1,
                ),
               /* MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: AppTheme.checkBoxCheckedColor,
                  minWidth: 345,
                  height: 50,
                  textColor: Colors.white,
                  child: Text(
                    "Update Now",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    try {
                      LaunchReview.launch(
                          androidAppId: "com.fapanels.student",
                          iOSAppId: "1479630542");
                    } catch (_) {}
                  },
                ),*/
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                          style: BorderStyle.solid)),
                  minWidth: 345,
                  height: 50,
                  textColor: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        "Use Current version",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "(Not Recommended)",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  onPressed: () {
                    if (widget.loginResponse != null) {
                      getIt<UnivFilterBloc>().add(FetchUnivData());
                      Navigator.pushReplacementNamed(context, DashBoardRoute,
                          arguments: widget.loginResponse);
                    } else {
                      Navigator.of(context).pushReplacementNamed(
                        LoginViewRoute,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

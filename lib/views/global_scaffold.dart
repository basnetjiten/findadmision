import 'dart:async';

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/fcm_token_bloc/firebase_token_check_bloc.dart';
import 'package:findadmissionaffiliate/bloc/institutes/fav_inst_list.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/auth/fcm_token_check.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/notification_page.dart';
import 'package:findadmissionaffiliate/views/login/login.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class GlobalScaffold extends StatefulWidget {
  final Widget child;

  GlobalScaffold({this.child});

  @override
  _GlobalScaffoldState createState() => _GlobalScaffoldState();
}

class _GlobalScaffoldState extends State<GlobalScaffold> {
  FcmTokenCheckBloc _fcmTokenCheckBloc;
  Timer timer;

  @override
  void initState() {
    _fcmTokenCheckBloc = FcmTokenCheckBloc();
    _fcmTokenCheckBloc.add(DispatchFcmTokenCheck());
    timer = Timer.periodic(
        Duration(seconds: 60), (Timer t) => executeOnThirtySecond(fcmToken));
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(sizeConfig.screenHeight * 0.1),
        child: Padding(
          padding: EdgeInsets.only(top: sizeConfig.isMediumScreen() ? 15 : 0.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                    CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (_) => NotificationPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      bottom: 0,
                      top: 10,
                      right: 10,
                      child: Transform.scale(
                        scale: 0.9,
                        child: SvgPicture.asset(
                          "assets/announce_blue.svg",
                          height: 10,
                          width: 15,
                        ),
                      ),
                    ),
                    Positioned(
                        left: 30,
                        bottom: 18,
                        top: 0,
                        right: 0,
                        child: BlocBuilder<FcmTokenCheckBloc,
                                FirebaseTokenCheckState>(
                            cubit: _fcmTokenCheckBloc,
                            // ignore: missing_return
                            builder: (context, state) {
                              if (state is FirebaseTokenCheckInitial) {
                                return SizedBox();
                              }
                              if (state is FcmTokenCheckCompleted) {
                                final fcmTokenResponse =
                                    state.fcmTokenCheckResponse;
                                return fcmTokenResponse.notiCount == 0
                                    ? SizedBox()
                                    : Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                        child: Center(
                                            child: Text(
                                          fcmTokenResponse.notiCount.toString(),
                                          style: TextStyle(fontSize: 12.0),
                                        )),
                                      );
                              } else if (state is FcmTokenCheckError) {
                                Navigator.of(context, rootNavigator: true)
                                    .pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                        (Route<dynamic> route) => false);
                              }
                            }))
                  ],
                ),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      fullscreenDialog: true, builder: (_) => FavInstitutes()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.favorite,
                    color: AppTheme.favouriteBtnColor,
                  ),
                ),
              )
            ],
            centerTitle: true,
            backgroundColor: AppTheme.darkGreyBGColour,
            elevation: 0,
            title: Container(
              height: 40,
              width: 125,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AppWidgetHelper.bannerLogo())),
            ),
          ),
        ),
      ),
      body: widget.child,
    );
  }

  dynamic executeOnThirtySecond(String fcmToken) {
    _fcmTokenCheckBloc.add(DispatchFcmTokenCheck());
  }
}

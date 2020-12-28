import 'dart:async';

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/sizeconfig.dart';
import 'package:findadmissionaffiliate/views/splashes/network_spinner.dart';
import 'package:flutter/material.dart';
SizeConfig sizeConfig;
class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {


  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 4), onClose);
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig= SizeConfig(context);
    return Scaffold(
        backgroundColor: AppTheme.lightGreyBGColour,
        body: Center(
          child: Container(
            height: 60,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AppWidgetHelper.bannerLogo())), //<- place where the image appears
          ),
        ));
  }

  void onClose() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        maintainState: false,
        opaque: false,
        pageBuilder: (context, _, __) => NetworkWorkerSpinner(),
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}

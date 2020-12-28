import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';

class Transaction extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding:  EdgeInsets.fromLTRB(15.0,sizeConfig.screenHeight*0.15,15,15),
        child: Container(

          height: sizeConfig.screenHeight,
          width: sizeConfig.screenWidth,
          decoration:BoxDecoration(
             color: AppTheme.greyBackground,
           borderRadius: BorderRadius.circular(7)
          ),
          child: Center(
            child: SizedBox(height: 120,width: 120,child: Image.asset("assets/images/comingsoon.png"),),
          ),
        ),
      );
  }
}

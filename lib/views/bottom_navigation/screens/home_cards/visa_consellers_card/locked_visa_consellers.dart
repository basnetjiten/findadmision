import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LockedVisaConseller extends StatelessWidget {
  const LockedVisaConseller({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Visa Conseller",
                  style: AppTheme.profileInfoStyle.copyWith(

                      color: AppTheme.cardTitleTxtColor,
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  child: SvgPicture.asset(
                      "assets/lock.svg"
                  ),
                ),
                SizedBox(height: 20,),
                Text("You need to successfully enroll student in partner institutions to become our official Visa counselor.",style:
                  TextStyle(color:AppTheme.cardTitleTxtColor,fontSize: 14.0),),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

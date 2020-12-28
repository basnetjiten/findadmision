import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LockedComingSoon extends StatelessWidget {
  const LockedComingSoon({
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
                  height: 15,
                ),
                Container(
                  height: 20,
                  width: 500,
                  child: Text(
                    "Visa Conseller",
                    style: AppTheme.helperLabelStyle.copyWith(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: SvgPicture.asset(
                      "assets/lock_soon.svg"
                  ),
                ),
                SizedBox(height:10,),
                Center(child: Text("Coming Soon",style: TextStyle(color: Color(0xffC0CEDF)),)),
                SizedBox(height:20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

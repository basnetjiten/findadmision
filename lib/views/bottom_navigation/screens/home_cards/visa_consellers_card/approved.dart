import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Approved extends StatelessWidget {
  const Approved({
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
                  style: AppTheme.helperLabelStyle.copyWith(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  child: SvgPicture.asset("assets/lock.svg"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "You’ve been Approved as a Visa Conseller!",
                  style: TextStyle(
                      color: AppTheme.checkBoxCheckedColor, fontSize: 16.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your unique code.",
                  style: TextStyle(
                      color: AppTheme.cardTitleTxtColor, fontSize: 14.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              side: BorderSide(
                                width: 0.8,
                                color: Color(0xffACACAC),
                              )),
                          color: Color(0xffEEF4FC),
                          minWidth: sizeConfig.screenWidth/2.8,
                          height: 50,
                          textColor: Colors.white,
                          child: Center(
                            child: Text(
                              "EXKAK18",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: AppTheme.cardTitleTxtColor,fontWeight: FontWeight.bold),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: AppTheme.checkBoxCheckedColor,
                          minWidth:sizeConfig.screenWidth/2.8,
                          height: 50,
                          textColor: Colors.white,
                          child: Text(
                            "Copy",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "See more",
                          style: AppTheme.chipStyle.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.navigate_next,
                          size: 28,
                          color: AppTheme.checkBoxCheckedColor,
                        )
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

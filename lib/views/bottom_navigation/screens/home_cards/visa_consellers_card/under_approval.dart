import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UnderApproval extends StatelessWidget {
  const UnderApproval({
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
                  height: 30,
                  //width: 500,
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
                      "assets/lock.svg"
                  ),
                ),
                SizedBox(height: 20,),
                Text("Your profile is under approval.",style:
                  TextStyle(color:AppTheme.cardTitleTxtColor,fontSize: 14.0),),
                SizedBox(height: 20,),
                Container(
                    child: Row(
                      children: [
                        Text(
                          "See more",
                          style: AppTheme.chipStyle.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                        Icon(
                          Icons.navigate_next,
                          size: 27,
                          color: AppTheme.checkBoxCheckedColor,
                        )
                      ],
                    )),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

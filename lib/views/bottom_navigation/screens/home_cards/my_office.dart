import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOfficeCard extends StatelessWidget {
  const MyOfficeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color:  AppTheme.officeBGColor,

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
                  "My Office",
                  style: AppTheme.helperLabelStyle.copyWith(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),

                Text("You haven’t bulit your office information yet.",
                  style: AppTheme.helperLabelStyle.copyWith(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),),
                SizedBox(
                  height: 25,
                ),

                Center(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: AppTheme.instituteTextColor,
                    minWidth: 155,
                    height: 50,
                    textColor: Colors.white,
                    child: Text(
                      "Start now",
                      style:
                      TextStyle(fontSize: 16.0, color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),


              ]
          ),
        ),
      ),
    ));
  }

}

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/new_institute_carousel_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentIntention extends StatelessWidget {
  const StudentIntention({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.stdIntentionBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Student's Intention",
                style: AppTheme.profileInfoStyle.copyWith(
                    color: AppTheme.cardTitleTxtColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              chipItem([
                "United Kingdom",
                "South Africa",
                "0K -22K",
                "Online Distance Learning Postgraduate",
                "UnderGraduate",
                "Arts and Humanities"
              ]),
              Align(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(
                          color: AppTheme.instituteTextColor, width: 1.0, style: BorderStyle.solid)),
                  minWidth: 100,
                  height: 40,
                  textColor: Colors.white,
                  child: Text(
                    "Edit",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: AppTheme.instituteTextColor,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.8),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    /*Navigator.of(context)
                            .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*/
                  },
                ),
              ),
           
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget chipItem(List chipLabel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 8.0,
      // gap between adjacent chips
      //runSpacing: 4.0, // gap between lines
      children: <Widget>[
        for (int i = 0; i < chipLabel.length; i++)
          if (chipLabel[i].isNotEmpty)
            Chip(
              label: Text(
                chipLabel[i],
                style: AppTheme.chipStyle.copyWith(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                 /* side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )*/),
              backgroundColor: AppTheme.stdIntentionColor,
            ),
      ],
    );
  }
}

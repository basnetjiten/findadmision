import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/material.dart';

class CollegeOverviewText extends StatelessWidget {
  final String aboutText;
  final String collegeName;

  const CollegeOverviewText({
    this.collegeName,
    this.aboutText,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             /* Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Text(collegeName,
                    style: AppTheme.instituteStyle.copyWith(
                        color: AppTheme.cardTitleTxtColor,
                        fontWeight: FontWeight.normal)),
              ),
              SizedBox(
                height: 15,
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  aboutText,
                  style: AppTheme.instituteStyle.copyWith(
                      color: AppTheme.cardTitleTxtColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ));
  }
}

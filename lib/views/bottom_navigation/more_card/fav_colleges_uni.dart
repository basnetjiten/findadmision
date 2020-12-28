import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/colleges_list_card.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteColleges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkGreyBGColour,
      body: Container(
        height: sizeConfig.screenHeight,
        width: sizeConfig.screenWidth,
        child: Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  IconButton(
                    icon: Icon(Icons.close,color: Colors.white,),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: sizeConfig.screenWidth/4,),
                  Text(
                    "Saved",
                    style: AppTheme.profileInfoStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: sizeConfig.screenHeight,
                  child: ListView.builder(
                   shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20.0,5,20,20),
                          child: Column(
                            children: [

                              CollegeListCard(),

                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/announcement_card.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/application_card.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/colleges_univ_card.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/institution_chart.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/office_list_max_3.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/visa_consellers_card/locked_visa_coming_soon.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget homePage;
 final gap20 = const SizedBox(
  height: 20,
  );

  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.greyBackground,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: sizeConfig.screenHeight * 0.15,
                ),
                AnnouncementCard(),
                gap20,
                ApplicationCard(),
                gap20,
                InstitutionChart(),
                gap20,
                CollegeUniversityCard(),
                const SizedBox(height: 25,),
                LockedComingSoon(),
                gap20,
                MaxThreeOfficeList(),
                gap20,
                // LockedComingSoon()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

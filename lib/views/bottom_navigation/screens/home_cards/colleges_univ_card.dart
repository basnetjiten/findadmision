import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/univ_filter_bloc/univ_filter_bloc.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/univ_global.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/course_institute_filter.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/new_institute_carousel_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bottom_nav.dart';


List<Degree> selectedHomeDegree;
class CollegeUniversityCard extends StatefulWidget {
  const CollegeUniversityCard({
    Key key,
  }) : super(key: key);

  @override
  _CollegeUniversityCardState createState() => _CollegeUniversityCardState();
}

class _CollegeUniversityCardState extends State<CollegeUniversityCard> {


  @override
  void initState() {
    selectedHomeDegree = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
                "Colleges & Universities",
                style: AppTheme.profileInfoStyle.copyWith(
                    color: AppTheme.cardTitleTxtColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<UnivFilterBloc, UnivFilterState>(
                  cubit: getIt<UnivFilterBloc>(),
                  // ignore: missing_return
                  builder: (context, state) {
                    if (state is UnivFilterInitial) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is UnivDataFetched) {
                      univFilterResponse = state.univFilterResponse;
                      degreeList = univFilterResponse.degree;
                      activeCountryList = univFilterResponse.activecountry;
                      cityList = univFilterResponse.citylist;
                      startDateList = univFilterResponse.startdates;
                      return Container(
                        height: 220,
                        width: 400,
                        child: CourseInstituteFilter(
                          options: degreeList,
                          selectedOptions: selectedHomeDegree,
                          onSelectedOptionListChanged: onCourseSelected,
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: AppTheme.checkBoxCheckedColor,
                    minWidth: 145,
                    height: 50,
                    textColor: Colors.white,
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    onPressed: () {
                      print("SELECTED DEGREE" + selectedHomeDegree.length.toString());
                      final CupertinoTabBar navigationBar =
                          globalKey.currentWidget;
                      navigationBar.onTap(1);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      final CupertinoTabBar navigationBar =
                          globalKey.currentWidget;
                      navigationBar.onTap(1);
                    },
                    child: Container(
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
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 190.0,
                  child: Stack(
                      alignment: Alignment.topCenter,
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          top: 10.0,
                          left: -30,
                          right: -30,
                          child: NewInstituteCarouselCard(),
                        )
                      ])),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCourseSelected(List<Degree> value) {
    setState(() {
      print("SELECTED DEGREE" + value.length.toString());
      selectedHomeDegree = value;
    });
  }
}
/*Widget chipItem(List chipLabel) {
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
                style: AppTheme.chipStyle,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )),
              backgroundColor: Colors.transparent,
            ),
      ],
    );
  }*/

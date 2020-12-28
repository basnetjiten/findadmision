import 'package:blockbuilder_transition/blockbuild_transition.dart';
import 'package:blockbuilder_transition/transition_builder.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/dto/institutes/chip_dselect_dto.dart';
import 'package:findadmissionaffiliate/dto/institutes/filterdto.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/univ_global.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/colleges_univ_card.dart';
import 'package:findadmissionaffiliate/views/filter_pages/city_list.dart';
import 'package:findadmissionaffiliate/views/filter_pages/date_list.dart';
import 'package:findadmissionaffiliate/views/filter_pages/degree_list.dart';
import 'package:findadmissionaffiliate/views/filter_pages/filter_chips/city_chip.dart';
import 'package:findadmissionaffiliate/views/filter_pages/filter_chips/entry_date_chip.dart';
import 'package:findadmissionaffiliate/views/filter_pages/filter_chips/fee_range_chip.dart';
import 'package:findadmissionaffiliate/views/filter_pages/filter_chips/location_chip.dart';
import 'package:findadmissionaffiliate/views/filter_pages/filter_chips/study_level_chip.dart';
import 'package:findadmissionaffiliate/views/filter_pages/location_list.dart';
import 'package:findadmissionaffiliate/views/filter_pages/tuition_fee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Activecountry> selectedLocation = [];
List<RangeValues> selectedFeeRange = [];
List<Startdate> selectedStartDate = [];
List<CitylistElement> selectedCity = [];
List<Degree> selectedDegree = [];
List actionableChipList = [];

class NavigationDrawer extends StatefulWidget {
  final ValueChanged<FilterDto> onCountryFiltered;

  NavigationDrawer({this.onCountryFiltered});

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<String> selectedLocationKey = [];
  List<String> selectedTuitionKey = [];
  List<String> selectedDateKey = [];

  @override
  void initState() {
    if (selectedHomeDegree.isNotEmpty) {
/*print("HOME COURSE"+selectedHomeDegree.length.toString());
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {*/
      selectedDegree = selectedHomeDegree;
      /*  });
      });*/
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("PAGE REBUILDING");
    TextStyle tileStyle = TextStyle(fontSize: 20.0, fontFamily: 'MyRaidPro');
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Drawer(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            /* DrawerHeader(
              decoration: BoxDecoration(color: Color(0xffeef7fb)),
              child: Text("Filter", style: tileStyle),
            ),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filter", style: tileStyle),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(
                            color: AppTheme.checkBoxCheckedColor,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    minWidth: 80,
                    height: 40,
                    textColor: Colors.white,
                    child: Text(
                      "Apply Filter",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppTheme.checkBoxCheckedColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      FilterDto filterDto = FilterDto(
                          selectedLocation,
                          selectedCity,
                          selectedStartDate,
                          selectedDegree,
                          selectedFeeRange);
                      widget.onCountryFiltered(filterDto);
                      /*  getTheLocationKey(selectedLocation);
                      getTheDateKey(selectedStartDate);
                      widget.onCountryFiltered(filterDto);*/
                    },
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            ListTile(
                title: Align(
                    alignment: Alignment(-1.1, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Location"), Icon(Icons.navigate_next)],
                    )),
                onTap: () {
                  Navigator.of(context).push(BlockBuildPageRoute(
                      transition: PageTransition.SlideRightTrans,
                      widget: LocationList(
                        onLocationChanged: _handleLocationChange,
                        selectedLocationList: selectedLocation,
                      )));
                }),
            Divider(
              thickness: 1.5,
            ),
            ListTile(
              title: Align(
                  alignment: Alignment(-1.2, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Tution Fee"), Icon(Icons.navigate_next)],
                  )),
              onTap: () {
                Navigator.of(context).push(BlockBuildPageRoute(
                    transition: PageTransition.SlideRightTrans,
                    widget: TuitionFeeFilter(
                      feeRange: _handleFeeRange,
                    )));
              },
            ),
            Divider(
              thickness: 1.5,
            ),
            /* ListTile(
              title: Align(
                  alignment: Alignment(-1.2, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Area of Study"),
                      Icon(Icons.navigate_next)
                    ],
                  )),
              onTap: () async {},
            ),
            Divider(
              thickness: 1.5,
            ),*/
            ListTile(
              title: Align(
                  alignment: Alignment(-1.2, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Entry Date"), Icon(Icons.navigate_next)],
                  )),
              onTap: () async {
                Navigator.of(context).push(BlockBuildPageRoute(
                    transition: PageTransition.SlideRightTrans,
                    widget: DateFilterList(
                      onDateChanged: _handleStartDateChange,
                      selectedDateFilterList: selectedStartDate,
                    )));
              },
            ),
            Divider(
              thickness: 1.5,
            ),
            ListTile(
              title: Align(
                  alignment: Alignment(-1.2, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("City"), Icon(Icons.navigate_next)],
                  )),
              onTap: () async {
                Navigator.of(context).push(BlockBuildPageRoute(
                    transition: PageTransition.SlideRightTrans,
                    widget: CityFilterList(
                      onCityChanged: _handleCityChange,
                      selectedCityFilterList: selectedCity,
                    )));
              },
            ),
            Divider(
              thickness: 1.5,
            ),
            ListTile(
              title: Align(
                  alignment: Alignment(-1.2, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Degree"), Icon(Icons.navigate_next)],
                  )),
              onTap: () async {
                Navigator.of(context).push(BlockBuildPageRoute(
                    transition: PageTransition.SlideRightTrans,
                    widget: DegreeFilerList(
                      onCityChanged: _handleDegreeChange,
                      selectedDegreeFilerList: selectedDegree,
                    )));
              },
            ),
            Divider(
              thickness: 1.5,
            ),
            Row(

              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(
                          color: AppTheme.checkBoxCheckedColor,
                          width: 1.0,
                          style: BorderStyle.solid)),
                  minWidth: 10,
                  height: 40,
                  textColor: Colors.white,
                  child: Text(
                    "Clear All",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: AppTheme.checkBoxCheckedColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedLocation.clear();
                      selectedCity.clear();
                      selectedStartDate.clear();
                      selectedDegree.clear();
                      selectedFeeRange.clear();
                    });
                  },
                )
              ],
            ),
            LocationChip(
              chipLabel: selectedLocation,
              onChipDeSelect: onChipDeselect,
            ),
            CityChip(
              chipLabel: selectedCity,
              onChipDeSelect: onChipDeselect,
            ),
            StudyLevelChip(
              chipLabel: selectedDegree,
              onChipDeSelect: onChipDeselect,
            ),
            FeeRangeChip(
              chipLabel: selectedFeeRange,
              onChipDeSelect: onChipDeselect,
            ),
            EntryDateChip(
              chipLabel: selectedStartDate,
              onChipDeSelect: onChipDeselect,
            )
          ],
        ),
      )),
    );
  }

/*
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
              deleteIcon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onDeleted: () {
                setState(() {
                  chipLabel.removeAt(i);
                });
              },
              label: Text(
                chipLabel[i],
                style: AppTheme.chipStyle.copyWith(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )),
              backgroundColor: AppTheme.checkBoxCheckedColor,
            ),
      ],
    );
  }
  Widget entryDateChip(List chipLabel) {
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
              deleteIcon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onDeleted: () {
                setState(() {
                  chipLabel.removeAt(i);
                });
              },
              label: Text(
                chipLabel[i],
                style: AppTheme.chipStyle.copyWith(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )),
              backgroundColor: AppTheme.checkBoxCheckedColor,
            ),
      ],
    );
  }
  Widget cityChip(List<CitylistElement> chipLabel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 8.0,
      // gap between adjacent chips
      //runSpacing: 4.0, // gap between lines
      children: <Widget>[
        for (int i = 0; i < chipLabel.length; i++)
          if (chipLabel[i].name.isNotEmpty)
            Chip(
              deleteIcon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onDeleted: () {
                setState(() {
                  chipLabel.removeAt(i);
                });
              },
              label: Text(
                chipLabel[i].name,
                style: AppTheme.chipStyle.copyWith(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )),
              backgroundColor: AppTheme.checkBoxCheckedColor,
            ),
      ],
    );
  }
  Widget feeRangeChip(List feeRangeList) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 8.0,
      // gap between adjacent chips
      //runSpacing: 4.0, // gap between lines
      children: <Widget>[
        for (int i = 0; i < feeRangeList.length; i++)
          if (feeRangeList[i].isNotEmpty)
            Chip(
              deleteIcon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onDeleted: () {
                setState(() {
                  feeRangeList.removeAt(i);
                });
              },
              label: Text(
                feeRangeList[i],
                style: AppTheme.chipStyle.copyWith(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )),
              backgroundColor: AppTheme.checkBoxCheckedColor,
            ),
      ],
    );
  }*/

  void _handleLocationChange(List<Activecountry> value) {
    setState(() {
      selectedLocation = value;
    });
  }

  void _handleCityChange(List<CitylistElement> value) {
    setState(() {
      selectedCity = value;
    });
  }

  void _handleDegreeChange(List<Degree> value) {
    setState(() {
      selectedDegree = value;
    });
  }

  void _handleStartDateChange(List<Startdate> value) {
    setState(() {
      selectedStartDate = value;
    });
  }

  _handleFeeRange(RangeValues feeRange) {
    setState(() {
      selectedFeeRange.clear();
      selectedFeeRange.add(feeRange);
    });
  }

  getTheLocationKey(List<String> selectedLocation) {
    activeCountryList.forEach((active) {
      selectedLocation.forEach((element) {
        if (active.countryName == element) {
          selectedLocationKey.add(active.countryId);
        }
      });
    });
  }

  getTheDateKey(List<String> selectedDate) {
    startDateList.forEach((date) {
      selectedDate.forEach((selectedDate) {
        if (date.name == selectedDate) {
          selectedDateKey.add(date.id.toString());
        }
      });
    });
  }

  void onChipDeselect(ChipDeselect value) {
    switch (value.chipType) {
      case Activecountry:
        setState(() {
          selectedLocation.removeAt(value.index);
        });
        break;
      case CitylistElement:
        setState(() {
          selectedCity.removeAt(value.index);
        });
        break;

      case Startdate:
        setState(() {
          selectedStartDate.removeAt(value.index);
        });
        break;

      case RangeValues:
        setState(() {
          selectedFeeRange.removeAt(value.index);
        });
        break;

      case Degree:
        setState(() {
          selectedDegree.removeAt(value.index);
        });
        break;
    }
  }
}

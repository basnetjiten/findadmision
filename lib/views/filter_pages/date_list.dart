import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../univ_global.dart';

class DateFilterList extends StatefulWidget {
  final ValueChanged<List<Startdate>> onDateChanged;
  final List<Startdate> selectedDateFilterList;
  DateFilterList({this.onDateChanged,this.selectedDateFilterList});
  @override
  _DateFilterListState createState() => _DateFilterListState();
}

class _DateFilterListState extends State<DateFilterList> {


  //Map<Startdate, Startdate> location = {"UK": "United Kingdom", "AU": "Australia"};
  List<Startdate> _tempSelectedOption = [];


  @override
  void initState() {
    //SitePreferences.init();
    _tempSelectedOption = widget.selectedDateFilterList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle tileStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.fromLTRB(sizeConfig.isMediumScreen() ?sizeConfig.screenWidth*0.22:sizeConfig.screenWidth*0.16, sizeConfig.screenHeight*0.1, 0, 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Drawer(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            /*IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                  )),*/
                            Text("Location", style: tileStyle),
                            /* SizedBox(
                                width: 40,
                              ),*/
                           /* MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                      color:
                                      AppTheme.checkBoxCheckedColor,
                                      width: 1.0,
                                      style: BorderStyle.solid)),
                              minWidth: 80,
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
                              onPressed: () {},
                            ),*/
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: AppTheme.cardTitleTxtColor,
                          thickness: 0.7,
                        ),
                        Container(
                          height: sizeConfig.screenHeight*0.67,
                          width: 400,
                          child: ListView.builder(
                            // shrinkWrap: true,
                              itemCount: startDateList.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                final selectedDate =
                                startDateList[index];
                                return Column(
                                  children: <Widget>[
                                    buildDialogContainer(selectedDate),
                                    Divider(
                                      color: AppTheme.cardTitleTxtColor,
                                      thickness: 0.3,
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Positioned(
            top: sizeConfig.screenHeight*0.12,
            left: sizeConfig.isMediumScreen() ?sizeConfig.screenWidth*0.07: sizeConfig.screenWidth*0.02,
            right: 10,
            bottom: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Material(
                type: MaterialType.transparency,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 27.0,
                      color: Colors.white,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDialogContainer(Startdate selectedOption) {
    return Container(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: Color(0xffACACAC)),
        child: CheckboxListTile(
            activeColor: AppTheme.checkBoxCheckedColor,
            controlAffinity: ListTileControlAffinity.leading,
            value: _tempSelectedOption.contains(selectedOption),
            title: Text(
              selectedOption.name,
              style: AppTheme.clickableTermsStyle
                  .copyWith(color: AppTheme.cardTitleTxtColor),
            ),
            onChanged: (bool value) {
              if (value) {
                if (!_tempSelectedOption.contains(selectedOption)) {
                  setState(() {
                    _tempSelectedOption.add(selectedOption);
                  });
                }
              } else {
                if (_tempSelectedOption.contains(selectedOption)) {
                  setState(() {
                    _tempSelectedOption.removeWhere(
                            (Startdate option) => option == selectedOption);
                  });
                }
              }
              widget.onDateChanged(_tempSelectedOption);
            }),
      ),
    );
  }
}

import 'dart:async';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/students/student_bloc/add_students_bloc.dart';
import 'package:findadmissionaffiliate/dto/students/add_student.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/loading_indicator_dialog.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/univ_global.dart';
import 'package:findadmissionaffiliate/utils/affiliate_methods.dart';
import 'package:findadmissionaffiliate/utils/dialog_type.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/institute_details.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/day_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/months_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/dropdowns/year_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/multiple_select_dialog.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/no_account_expansioni_title.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/yes_account_expansion_tile.dart';
import 'package:findadmissionaffiliate/views/signup/dropdowns/country_dropdown.dart';
import 'package:findadmissionaffiliate/views/signup/dropdowns/gender_dropdown.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SelectInstitute extends StatefulWidget {
  final Studentlist student;
  SelectInstitute({this.student});
  @override
  _SelectInstituteState createState() => _SelectInstituteState();
}

class _SelectInstituteState extends State<SelectInstitute>
    with SingleTickerProviderStateMixin {
  List<String> selectedInstitute = [];

  //Set<String> selectedInstitute = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.greyBackground,
      body: Padding(
          padding:
              EdgeInsets.fromLTRB(15, sizeConfig.screenHeight * 0.15, 15, 15),
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
            elevation: 1,
            child: Container(
              height: sizeConfig.screenHeight,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 100,
                    bottom: 0,
                    right: 0,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: FormBuilderTextField(
                                    autofocus: false,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    attribute: "filter",
                                    validators: [
                                      FormBuilderValidators.required()
                                    ],
                                    decoration:
                                        AppWidgetHelper.buildInputDecoration(
                                            'key words'),
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      border: Border.all(color: Colors.grey)),
                                  height: sizeConfig.screenHeight / 3,
                                  width: sizeConfig.screenWidth,
                                  child: MediaQuery.removePadding(
                                    context: context,
                                    removeTop: true,
                                    child: Scrollbar(
                                      thickness: 4,
                                      radius: Radius.circular(2),
                                      child: ListView.builder(
                                        //shrinkWrap: true,
                                        itemCount:
                                            univFilterResponse.match.length,
                                        itemBuilder: (context, index) {
                                          final univ =
                                              univFilterResponse.match[index];
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (selectedInstitute.length ==
                                                    1) {
                                                  selectedInstitute.clear();
                                                  selectedInstitute
                                                      .add(univ.id);
                                                } else {
                                                  selectedInstitute
                                                      .add(univ.id);
                                                }
                                              });
                                            },
                                            splashColor: Color(0xffB6E0FB),
                                            child: Container(
                                                color: selectedInstitute
                                                        .contains(univ.id)
                                                    ? Color(0xffB6E0FB)
                                                    : Colors.transparent,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                height: 38,
                                                width: sizeConfig.screenWidth,
                                                child: Text(univ.name)),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                              color:
                                                  AppTheme.checkBoxCheckedColor,
                                              width: 1.0,
                                              style: BorderStyle.solid)),
                                      minWidth: sizeConfig.screenWidth / 2.6,
                                      height: 48,
                                      textColor: Colors.white,
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color:
                                                AppTheme.checkBoxCheckedColor,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.8),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        /* .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*/
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      color: AppTheme.checkBoxCheckedColor,
                                      minWidth: sizeConfig.screenWidth / 2.6,
                                      height: 50,
                                      textColor: Colors.white,
                                      child: Text(
                                        "Start",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        //print(selectedInstitute[0]);
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (_) =>
                                                    InstituteDetails(
                                                      student:widget.student,
                                                    fromStudentApply: true,
                                                      universityId:
                                                          selectedInstitute[0],
                                                    )));
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 29,
                    top: 60,
                    bottom: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Please select the colleges or universities\n"
                        "you want to apply for the student and start the process.",
                        style: AppTheme.helperLabelStyle.copyWith(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 5,
                    bottom: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(CupertinoIcons.back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            "Apply",
                            style: AppTheme.helperLabelStyle.copyWith(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

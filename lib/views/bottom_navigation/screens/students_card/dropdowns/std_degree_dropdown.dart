import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/institute/loaddata_label.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/application_step_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StudentDegreeDropDown extends StatefulWidget {
  final List<Degree> degreeList;
  final ValueChanged<Degree> onDegreeProgramSelected;

  StudentDegreeDropDown({
    this.degreeList,
    this.onDegreeProgramSelected,
  });

  @override
  _StudentDegreeDropDownState createState() => _StudentDegreeDropDownState();
}

class _StudentDegreeDropDownState extends State<StudentDegreeDropDown> {
  Degree degree;

  @override
  Widget build(BuildContext context) {
    //print("country list"+widget.countryList.length.toString());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.white),
          child: DropdownButtonFormField<Degree>(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            itemHeight: 55,
            elevation: 1,
            hint: Text(
              degree != null
                  ? degree.degreeTitle
                  : widget.degreeList[0].degreeTitle,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            style: TextStyle(color: Colors.black, fontSize: 15),
            isDense: false,
            isExpanded: true,
            iconSize: 24.0,
            iconEnabledColor: Colors.black,
            items: widget.degreeList.map((Degree degree) {
              return DropdownMenuItem<Degree>(
                value: degree,
                child: Container(
                  child: Text(
                    degree.degreeTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: _onDegreeChanged,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            value: degree != null ? degree : widget.degreeList[0],
            validator: (value) => value == null ? '' : null,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              errorMaxLines: 1,
              errorStyle: TextStyle(height: 0),
              hintText: degree != null
                  ? degree.degreeTitle
                  : widget.degreeList[0].degreeTitle,
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              contentPadding: const EdgeInsets.only(left: 7, top: -5),
              hintMaxLines: 4,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0),
                ),
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
          ))
    ]);
  }

  void _onDegreeChanged(Degree value) {
    setState(() {
      degree = value;
      widget.onDegreeProgramSelected(degree);
    });
  }
}

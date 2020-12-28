import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseDropDown extends StatefulWidget {
  final String countryCode;
  final TextStyle dropDownTxtStyle;
  final List<Instapolicy> instaPolicy;
  final ValueChanged<List<InstapolicyCourse>> onCourseChange;
  final Color dropDownColor;

  CourseDropDown(
      {this.dropDownTxtStyle,
      this.dropDownColor,
      this.instaPolicy,
      this.onCourseChange,
      this.countryCode});

  @override
  _CourseDropDownState createState() => _CourseDropDownState();
}

class _CourseDropDownState extends State<CourseDropDown> {
  bool _autoValidate = false;
  Instapolicy instaPolicy;
  List<InstapolicyCourse> instaPolicyCourse = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<Instapolicy>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            widget.instaPolicy[0].degreeTitle,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.instaPolicy.map((Instapolicy instapolicy) {
            return DropdownMenuItem<Instapolicy>(
              value: instapolicy,
              child: Container(
                child: Text(
                  instapolicy.degreeTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              instaPolicy = value;
              instaPolicyCourse = getInstaPolicyCourses(instaPolicy);

              widget.onCourseChange(instaPolicyCourse);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: instaPolicy ?? null,
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),

            hintText: widget.instaPolicy[0].degreeTitle,
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
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
        ));
  }

  List<InstapolicyCourse> getInstaPolicyCourses(Instapolicy instapolicy) {
    List<InstapolicyCourse> instaPolicyCourses = [];
    widget.instaPolicy.forEach((instPolicy) {
      if (instPolicy.degreeId == instaPolicy.degreeId) {
        instaPolicyCourses = instaPolicy.course;
      }
    });
    return instaPolicyCourses;
  }

/*void getUserDefaultCourse(String userCourseCode) {
    widget.countryList.forEach((country) {
      if (country.countryShortcode == userCourseCode) {
        setState(() {
          countryName = country.countryName;
        });
        // widget.onCourseChange(country.instaPolicyCourse);
      }
    });
  }*/
}

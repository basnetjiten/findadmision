import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradeDropDown extends StatefulWidget {
  final List<Grade> grade;
  final ValueChanged<Grade> onGradeChange;

  GradeDropDown({
    this.grade,
    this.onGradeChange,
  });

  @override
  _GradeDropDownState createState() => _GradeDropDownState();
}

class _GradeDropDownState extends State<GradeDropDown> {
  bool _autoValidate = false;
  Grade initialGrade;

  @override
  void initState() {
    initialGrade = widget.grade[0];
    super.initState();
  }

  // String initialGradeText;

  @override
  Widget build(BuildContext context) {
    //prGrade("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<Grade>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            initialGrade.requirementName,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.grade.map((Grade grade) {
            return DropdownMenuItem<Grade>(
              value: grade,
              child: Container(
                child: Text(
                  grade.requirementName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (Grade value) {
            setState(() {
              initialGrade = value;

              widget.onGradeChange(initialGrade);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: initialGrade,
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText: initialGrade.requirementName,
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
        ));
  }
}

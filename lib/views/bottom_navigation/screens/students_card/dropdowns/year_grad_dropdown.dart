import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraduationYearDD extends StatefulWidget {
  final List<int> year;
  final ValueChanged<int> onYearChange;

  GraduationYearDD({
    this.year,
    this.onYearChange,
  });

  @override
  _GraduationYearDDState createState() => _GraduationYearDDState();
}

class _GraduationYearDDState extends State<GraduationYearDD> {
  bool _autoValidate = false;
  int gradYear;

  @override
  void initState() {
    gradYear = widget.year[0];
    super.initState();
  }
  // String gradYearText;

  @override
  Widget build(BuildContext context) {
    //print("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<int>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            gradYear!=null ? gradYear.toString() :widget.year[0].toString(),
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.year.map((int start) {
            return DropdownMenuItem<int>(
              value: start,
              child: Container(
                child: Text(
                  start.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (int value) {
            setState(() {
              gradYear = value;

              widget.onYearChange(gradYear);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value:  gradYear!=null ? gradYear :widget.year[0],

          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText:
            gradYear!=null ? gradYear.toString() :widget.year[0].toString(),
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

import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:findadmissionaffiliate/models/student/std_load_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StdStartDateDropDown extends StatefulWidget {
  final List<Startdate> startDates;
  final ValueChanged<Startdate> onStartDateSelected;

  StdStartDateDropDown({
    this.startDates,
    this.onStartDateSelected,
  });

  @override
  _StdStartDateDropDownState createState() => _StdStartDateDropDownState();
}

class _StdStartDateDropDownState extends State<StdStartDateDropDown> {
  bool _autoValidate = false;
  Startdate startDate;

  // String startDateText;

  @override
  Widget build(BuildContext context) {
    //print("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<Startdate>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            startDate != null ? startDate.text : widget.startDates[0].text,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.startDates.map((Startdate start) {
            return DropdownMenuItem<Startdate>(
              value: start,
              child: Container(
                child: Text(
                  start.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (Startdate value) {
            setState(() {
              startDate = value;

              widget.onStartDateSelected(startDate);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: startDate != null ? startDate : widget.startDates[0],
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText:
                startDate != null ? startDate.text : widget.startDates[0].text,
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

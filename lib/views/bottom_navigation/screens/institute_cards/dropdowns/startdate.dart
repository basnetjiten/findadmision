import 'package:findadmissionaffiliate/models/institute/institute_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartDateDropDown extends StatefulWidget {
  final List<InstDetailStartDate> startDate;
  final InstDetailStartDate initialStartDate;
  final ValueChanged<InstDetailStartDate> onStartDateSelected;

  StartDateDropDown({
    this.startDate,
    this.initialStartDate,
    this.onStartDateSelected,
  });

  @override
  _StartDateDropDownState createState() => _StartDateDropDownState();
}

class _StartDateDropDownState extends State<StartDateDropDown> {
  bool _autoValidate = false;
  InstDetailStartDate startDate;
 // String startDateText;

  @override
  void initState() {
    startDate = widget.initialStartDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: DropdownButtonFormField<InstDetailStartDate>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            startDate.text,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: Colors.black,
          items: widget.startDate.map((InstDetailStartDate start) {
            return DropdownMenuItem<InstDetailStartDate>(
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
          onChanged: (InstDetailStartDate value) {
            setState(() {
              startDate = value;

              widget.onStartDateSelected(startDate);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: startDate ?? null,
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            hintText: startDate.text,
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


}

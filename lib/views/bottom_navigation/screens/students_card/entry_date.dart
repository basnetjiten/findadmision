import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class EntryDateDropDown extends StatefulWidget {
  @override
  _EntryDateDropDownState createState() =>
      _EntryDateDropDownState();
}

class _EntryDateDropDownState
    extends State<EntryDateDropDown> {
  String initialLocation = 'Entry Date';
  final List<String> nationalityBucket = [];
  final SchedulerBinding scheduler = SchedulerBinding.instance;

  TextStyle dropDownTxtStyle =
      TextStyle(fontSize: 14, color: AppTheme.cardTitleTxtColor);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        dropdownColor: Color(0xffeef7fb),
        isDense: false,
        isExpanded: true,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        hint: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialLocation,
            style: dropDownTxtStyle,
          ),
        ),
        items: ["United Kingdom","Australia"].map((String countryPhoneCode) {
          return DropdownMenuItem<String>(
            value: countryPhoneCode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  countryPhoneCode,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (String userSelection) {
          setState(() {
            initialLocation=userSelection;
            dropDownTxtStyle =
                TextStyle(fontSize: 14.0, color: AppTheme.checkBoxCheckedColor);
          });
        },
      ),
    );
  }
}

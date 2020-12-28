import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OverViewDropDown extends StatefulWidget {
  final ValueChanged<int> onDropDownPageChange;

  OverViewDropDown({this.onDropDownPageChange});

  @override
  _OverViewDropDownState createState() => _OverViewDropDownState();
}

class _OverViewDropDownState extends State<OverViewDropDown> {
  String initialOverView = 'Overview';
  final List<String> dropDownPages = ["Overview", "Requirement", "course"];
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
        // dropdownColor: Color(0xffeef7fb),
        isDense: false,
        isExpanded: true,
        icon: Icon(
          Icons.arrow_drop_down,
          color: AppTheme.checkBoxCheckedColor,
        ),
        hint: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialOverView,
            style: dropDownTxtStyle.copyWith(
                color: AppTheme.checkBoxCheckedColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        items: dropDownPages.map((String countryPhoneCode) {
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
            initialOverView = userSelection;
            dropDownTxtStyle =
                TextStyle(fontSize: 14.0, color: AppTheme.checkBoxCheckedColor);
          });
          widget.onDropDownPageChange(dropDownPages.indexOf(initialOverView));
        },
      ),
    );
  }
}

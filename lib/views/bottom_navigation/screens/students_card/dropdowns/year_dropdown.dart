import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/univ_global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class YearDropDown extends StatefulWidget {
  final TextStyle dropDownTxtStyle;
  final ValueChanged<String> onYearChanged;

  YearDropDown({this.dropDownTxtStyle, this.onYearChanged});

  @override
  _YearDropDownState createState() => _YearDropDownState();
}

class _YearDropDownState extends State<YearDropDown> {
  String initialYear;
  final List<String> year = [];
  final SchedulerBinding scheduler = SchedulerBinding.instance;

  /* List<String> getDisplayValue() {
    RawListMapper.nationalityMapper.forEach((countryKey, countryName) {
      nationalityBucket.add(countryName);
      return nationalityBucket;
    });
  }*/

  @override
  void initState() {
    univFilterResponse.year.forEach((years) {
      year.add(years[0].toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        isDense: false,
        isExpanded: true,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        hint: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialYear ?? 'YY',
            style: widget.dropDownTxtStyle,
          ),
        ),
        items: year.map((String year) {
          return DropdownMenuItem<String>(
            value: year,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  year.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (String userSelection) {
          setState(() {
            initialYear = userSelection.toString();
            widget.onYearChanged(userSelection.toString());
          });
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: initialYear ?? null,
        validator: (value) => value == null ? "" : null,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          errorStyle: TextStyle(height: 0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 1, color: Colors.redAccent),
          ),
          hintText: initialYear,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          contentPadding: const EdgeInsets.only(left: 7, top: -5),
          hintMaxLines: 4,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 1, color: AppTheme.btnBorderColor),
          ),
        ),
      ),
    );
  }
}

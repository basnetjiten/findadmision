import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CountryDropDown extends StatefulWidget {
  final String countryCode;
  final TextStyle dropDownTxtStyle;
  final List<Country> countryList;
  final ValueChanged<String> countryChange;
  final Color dropDownColor;

  CountryDropDown(
      {this.dropDownTxtStyle,
      this.dropDownColor,
      this.countryList,
      this.countryChange,
      this.countryCode});

  @override
  _CountryDropDownState createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  bool _autoValidate = false;
  String countryName;
  String countryId;


  @override
  void initState() {
    print(widget.countryCode);
    getUserDefaultCountry(widget.countryCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("country list"+widget.countryList.length.toString());
    return Theme(
        data:
        Theme.of(context).copyWith(canvasColor: widget.dropDownColor!=null ? Colors.white:AppTheme.darkGreyBGColour),
        child: DropdownButtonFormField<String>(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Text(
            countryName ?? "Select",
            style: widget.dropDownTxtStyle ??TextStyle(color: Colors.white, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
      iconEnabledColor: widget.dropDownColor ??Colors.white,
          items: widget.countryList.map((Country country) {
            return DropdownMenuItem<String>(

              value: country.countryName,
              child: Container(
                child: Text(
                  country.countryName,
                  style: TextStyle(
                    color: widget.dropDownColor ??Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              countryName = value;
              countryId = getCountryId(value);
              print(getCountryId(value));
              widget.countryChange(countryId);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: countryName ?? null,
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: widget.dropDownColor!=null ? Colors.transparent: AppTheme.darkGreyBGColour,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Color(0xff886069)),
            ),
            hintText: countryName,
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

  String getCountryId(String value) {
    String selectedCId;
    widget.countryList.forEach((country) {
      if (country.countryName == value) {
        selectedCId = country.countryId;
      }
    });
    return selectedCId;
  }

  void getUserDefaultCountry(String userCountryCode) {
    widget.countryList.forEach((country) {
      if (country.countryShortcode == userCountryCode) {
        setState(() {
          countryName = country.countryName;
        });
        // widget.countryChange(country.countryId);
      }
    });
  }
}

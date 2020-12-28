import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneCodeDropDown extends StatefulWidget {
  final TextStyle dropDownTxtStyle;
  final Color dropDownColor;
  final List<Country> countryList;
  final ValueChanged<String> onDropDownChange;
  final String selectedPhoneCode;
  final String userCountryCode;

  PhoneCodeDropDown(
      {this.dropDownTxtStyle,
      this.userCountryCode,
      this.countryList,
      this.onDropDownChange,
        this.dropDownColor,
      this.selectedPhoneCode});

  @override
  _PhoneCodeDropDownState createState() => _PhoneCodeDropDownState();
}

class _PhoneCodeDropDownState extends State<PhoneCodeDropDown> {
  bool _autoValidate = false;
  String initialPhoneCode;

  @override
  void initState() {
    if (widget.selectedPhoneCode != null) {
      initialPhoneCode = widget.selectedPhoneCode;
    } else {
      getUserDefaultDialingCode(widget.userCountryCode);
    }

    // print("phone code"+initialPhoneCode);
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
          itemHeight: 59,
          elevation: 1,
          hint: Text(
            initialPhoneCode ?? "Select",
            style: widget.dropDownTxtStyle ??TextStyle(color: Colors.white, fontSize: 15),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: widget.dropDownColor ??Colors.white,
          items: widget.countryList.map((Country country) {
            return DropdownMenuItem<String>(
              value: country.dlkey,
              child: Container(
                child: Text(
                  country.dlkey,
                  style: TextStyle(
                    color: widget.dropDownColor ??Colors.white,
                    fontSize: 15,
                  ),
                  maxLines: 2,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              initialPhoneCode = value;

              print("PHONE CODE TEST" + getDialingCode(value));
              widget.onDropDownChange(getDialingCode(value));
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: initialPhoneCode ?? null,
          validator: (value) => value == null ? '' : null,
          decoration: InputDecoration(
            fillColor: widget.dropDownColor!=null ? Colors.transparent: AppTheme.darkGreyBGColour,
            errorMaxLines: 1,
            errorStyle: TextStyle(height: 0),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Color(0xff886069)),
            ),
            hintText: initialPhoneCode,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,

            ),
            contentPadding: const EdgeInsets.only(left: 7, top: -5),
            hintMaxLines: 1,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
        ));
  }

  String getDialingCode(String value) {
    String selectedCId;
    widget.countryList.forEach((country) {
      if (country.dlkey == value) {
        selectedCId = country.countryDialingcode;
      }
    });
    return selectedCId;
  }

  void getUserDefaultDialingCode(String userCountryCode) {
    widget.countryList.forEach((country) {
      if (country.countryShortcode == userCountryCode) {
        setState(() {
          initialPhoneCode = country.dlkey;
          // widget.onDropDownChange(country.countryDialingcode);
        });
      }
    });
  }
}

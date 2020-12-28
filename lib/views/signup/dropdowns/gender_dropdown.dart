import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderDropDown extends StatefulWidget {
  final TextStyle dropDownTxtStyle;
  final ValueChanged<String> onGenderChange;
  final bool lightTheme;

  GenderDropDown({this.dropDownTxtStyle, this.onGenderChange, this.lightTheme});

  @override
  _GenderDropDownState createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  bool _autoValidate = false;
  String initialGender;

  @override
  Widget build(BuildContext context) {
    //print("country list"+widget.countryList.length.toString());
    return Theme(
        data: Theme.of(context).copyWith(
            canvasColor:
                widget.lightTheme ? Colors.white : AppTheme.darkGreyBGColour),
        child: DropdownButtonFormField<String>(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          itemHeight: 55,
          elevation: 1,
          hint: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              initialGender ?? "Select",
              style: TextStyle(
                  color: widget.lightTheme ? Colors.black : Colors.white,
                  fontSize: 15),
            ),
          ),
          style: TextStyle(color: Colors.black, fontSize: 15),
          isDense: false,
          isExpanded: true,
          iconSize: 24.0,
          iconEnabledColor: widget.lightTheme ? Colors.black : Colors.white,
          items: ["Male", "Female"].map((String gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Container(
                child: Text(
                  gender,
                  style: TextStyle(
                    color: widget.lightTheme ? Colors.black : Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              initialGender = value;
              widget.onGenderChange(value);
            });
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: initialGender ?? null,
          validator: (value) => value == null ? "" : null,
          decoration: InputDecoration(
            fillColor: widget.lightTheme
                ? Colors.transparent
                : AppTheme.darkGreyBGColour,
            errorStyle: TextStyle(height: 0),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                  width: 1,
                  color:
                      widget.lightTheme ? Colors.redAccent : Color(0xff886069)),
            ),
            hintText: initialGender,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            contentPadding: const EdgeInsets.only(left: 7, top: -5),
            hintMaxLines: 4,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: widget.lightTheme
                  ? BorderSide(width: 1, color: AppTheme.btnBorderColor)
                  : BorderSide(width: 0, color: Colors.transparent),
            ),
          ),
        ));
  }
}

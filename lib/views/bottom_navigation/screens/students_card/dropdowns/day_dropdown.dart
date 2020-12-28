import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/univ_global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DayDropDown extends StatefulWidget {
  final TextStyle dropDownTxtStyle;
  final ValueChanged<String> onDayChange;

  DayDropDown({this.dropDownTxtStyle,this.onDayChange});

  @override
  _DayDropDownState createState() => _DayDropDownState();
}

class _DayDropDownState extends State<DayDropDown> {
  String initialDay;
  final List<String> dayList = [];
  final SchedulerBinding scheduler = SchedulerBinding.instance;

  @override
  void initState() {
    univFilterResponse.day.forEach((days) {
     dayList.add(days[0].toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        isDense: false,
        isExpanded: true,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        hint: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialDay ?? "DD",
            style: widget.dropDownTxtStyle,
          ),
        ),
        items: dayList.map((String day) {
          return DropdownMenuItem<String>(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            value: day,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  day.toString(),
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
            initialDay=userSelection.toString();
            widget.onDayChange(userSelection.toString());
          });
        },

        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: initialDay?? null,
        validator: (value) => value == null ? "" : null,
        decoration: InputDecoration(
          fillColor:
           Colors.transparent,
          errorStyle: TextStyle(height: 0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 1, color:  Colors.redAccent),
          ),
          hintText: initialDay,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          contentPadding: const EdgeInsets.only(left: 7, top: -5),
          hintMaxLines: 4,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide:BorderSide(width: 1, color:AppTheme.btnBorderColor),
          ),
        ),
      ),
    );
  }
}

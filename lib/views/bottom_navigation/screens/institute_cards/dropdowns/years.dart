import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class WorkExpYearDroDown extends StatefulWidget {
  final ValueChanged<int> onYearChange;
  final int fromY;

  WorkExpYearDroDown({this.onYearChange, this.fromY});

  @override
  _WorkExpYearDroDownState createState() => _WorkExpYearDroDownState();
}

class _WorkExpYearDroDownState extends State<WorkExpYearDroDown> {
  int initialDay;

  final SchedulerBinding scheduler = SchedulerBinding.instance;

  @override
  void initState() {
    initialDay = widget.fromY;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<int>(
        isDense: false,
        isExpanded: true,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        hint: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialDay != null
                ? initialDay.toString()
                : loadDataLabel.year[0].toString(),
            style: AppTheme.dropDownTextStyle,
          ),
        ),
        items: loadDataLabel.year.map((int year) {
          return DropdownMenuItem<int>(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
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
        onChanged: (int userSelection) {
          setState(() {
            initialDay = userSelection;
            widget.onYearChange(initialDay);
          });
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: initialDay ?? loadDataLabel.year[0],
        validator: (value) => value == null ? "" : null,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          errorStyle: TextStyle(height: 0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 1, color: Theme.of(context).errorColor),
          ),
          hintText: initialDay.toString(),
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

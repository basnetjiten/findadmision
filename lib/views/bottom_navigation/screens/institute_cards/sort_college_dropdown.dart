import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortCollegeDropDown extends StatefulWidget {
  /* final List<BankResult> bankList;

  const SortCollegeDropDown(this.bankList);*/

  @override
  _SortCollegeDropDownState createState() => _SortCollegeDropDownState();
}

class _SortCollegeDropDownState extends State<SortCollegeDropDown> {
  String initialSorting = 'Random Order';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        dropdownColor: Color(0xffeef7fb),
        isDense: false,
        isExpanded: true,
        underline: Divider(
          thickness: 1.0,
          color: Colors.green,
        ),
        hint: Text(
          initialSorting,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        items: ["Random Order", "Alphabet", "Most Popular"].map((String title) {
          return DropdownMenuItem<String>(
            value: title,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontFamily: 'MyRaidPro'),
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
            initialSorting = userSelection;
          });
        },
      ),
    );
  }
}

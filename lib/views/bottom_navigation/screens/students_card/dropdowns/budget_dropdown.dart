import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BudgetDropDown extends StatefulWidget {
  final TextStyle dropDownTxtStyle;
  final List<Budgetoption> budgetOptions;
  final ValueChanged<Budgetoption> onBudgetChange;

  BudgetDropDown(
      {this.budgetOptions, this.dropDownTxtStyle, this.onBudgetChange});

  @override
  _BudgetDropDownState createState() => _BudgetDropDownState();
}

class _BudgetDropDownState extends State<BudgetDropDown> {
  Budgetoption budgetFrom;

  @override
  void initState() {
    //print("BUDGET OPTIONS" + widget.budgetOptions.length.toString()+widget.budgetOptions[0].name);
    budgetFrom = widget.budgetOptions[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<Budgetoption>(
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
            budgetFrom.name,
            style: widget.dropDownTxtStyle,
          ),
        ),
        items: widget.budgetOptions.map((Budgetoption budget) {
          return DropdownMenuItem<Budgetoption>(
            value: budget,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  budget.name,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (Budgetoption userSelection) {
          setState(() {
            budgetFrom = userSelection;
            widget.onBudgetChange(userSelection);
          });
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: budgetFrom ?? null,
        validator: (value) => value == null ? "" : null,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          errorStyle: TextStyle(height: 0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 1, color: Colors.redAccent),
          ),
          hintText: budgetFrom.name,
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

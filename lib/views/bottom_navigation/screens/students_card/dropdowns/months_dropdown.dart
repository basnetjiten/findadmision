import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/univ_global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MonthDropDown extends StatefulWidget {
  final TextStyle dropDownTxtStyle;
  final ValueChanged<String> onMonthChange;
  MonthDropDown({this.dropDownTxtStyle,this.onMonthChange});
  @override
  _MonthDropDownState createState() => _MonthDropDownState();
}

class _MonthDropDownState extends State<MonthDropDown> {
  String initialMonth;
  final List<String> month = [];
  final SchedulerBinding scheduler = SchedulerBinding.instance;

  /* List<String> getDisplayValue() {
    RawListMapper.nationalityMapper.forEach((countryKey, countryName) {
      nationalityBucket.add(countryName);
      return nationalityBucket;
    });
  }*/

  @override
  void initState() {
    univFilterResponse.month.forEach((months) {
      month.add(months[0]);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        isDense: false,
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down,color: Colors.black,),

        hint: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialMonth ?? 'MM',
            style: widget.dropDownTxtStyle,
          ),
        ),
        items: month.map((String month) {
          return DropdownMenuItem<String>(
            value: month,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(
                  month,
                  style: TextStyle(fontSize: 18,),
                ),

              ],
            ),
          );
        }).toList(),
        onChanged: (String userSelection) {
          setState(() {
initialMonth=userSelection;
widget.onMonthChange(userSelection);
          });
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: initialMonth?? null,
        validator: (value) => value == null ? "" : null,
        decoration: InputDecoration(
          fillColor:
          Colors.transparent,
          errorStyle: TextStyle(height: 0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 1, color:  Colors.redAccent),
          ),
          hintText: initialMonth,
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

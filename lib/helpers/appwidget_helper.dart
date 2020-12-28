import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/helpers/findadmision_dialog.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';

class AppWidgetHelper {
  static textFieldDarkIssueDecoration(bool noError,[passwordObscure]) {
    return InputDecoration(
      // errorMaxLines: 2,
        errorMaxLines: 1,
        //errorStyle: TextStyle(height: 0),
        isDense: true,
        helperText: '   ',
        filled: true,
        errorStyle: TextStyle(fontSize:10.0,color: Color(0xff886069),),
        fillColor: AppTheme.darkGreyBGColour,
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 25.0, 23.0),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: Color(0xff886069)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 0, color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 0, color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: Color(0xff886069)),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(width: 0, color: Colors.green)));
    /*: InputDecoration(
            isDense: true,
            filled: true,
            errorStyle: TextStyle(color: Color(0xff886069)),
            fillColor: AppTheme.darkGreyBGColour,
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 25.0, 23.0),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Color(0xff886069)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Color(0xff886069)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)));*/
  }
  static textFieldLightIssueDecoration(bool verticalInputs,[passwordObscure]) {
    return InputDecoration(
        errorMaxLines: 1,
        isDense: true,
        helperText: verticalInputs ? null:'   ',
        filled: true,
     //   errorStyle: TextStyle(fontSize:10.0,color: Colors.redAccent,),
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 25.0, 23.0),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(width: 1, color: Colors.redAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: Colors.grey),

        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: Colors.red[400]),
        ),
       );
    /*: InputDecoration(
            isDense: true,
            filled: true,
            errorStyle: TextStyle(color: Colors.redAccent),
            fillColor: AppTheme.darkGreyBGColour,
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 25.0, 23.0),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Color(0xff886069)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Color(0xff886069)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)));*/
  }
  static textFieldDecoration(bool noError,[passwordObscure]) {
    return InputDecoration(
      // errorMaxLines: 2,
        errorMaxLines: 1,
        //errorStyle: TextStyle(height: 0),
        isDense: true,
        filled: true,
        errorStyle: TextStyle(fontSize:10.0,color: Color(0xff886069),),
        fillColor: AppTheme.darkGreyBGColour,
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 25.0, 23.0),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: Color(0xff886069)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 0, color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 0, color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: Color(0xff886069)),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(width: 0, color: Colors.green)));
    /*: InputDecoration(
            isDense: true,
            filled: true,
            errorStyle: TextStyle(color: Color(0xff886069)),
            fillColor: AppTheme.darkGreyBGColour,
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 25.0, 23.0),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Color(0xff886069)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Color(0xff886069)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)));*/
  }
  static AssetImage bannerLogo() {
    return AssetImage('assets/images/findadmission_logo.png');
  }

  static counterContainer(int count) {
    return Container(
      width: 32,
      height: 18,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Center(
          child: Text(
            count.toString(),
            style: TextStyle(
                color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
          )),
    );
  }

  static stepperContainer({int step, String title}) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.checkBoxCheckedColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              step.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "STEP${step.toString()}",
              style: AppTheme.stepperTextStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Text("${title.toUpperCase()}",
                style: AppTheme.stepperTextStyle
                    .copyWith(fontWeight: FontWeight.w800)),
          ],
        )
      ],
    );
  }

  static divider([Color color]) {
    return Divider(
      color: color ?? Color(0xffDBDBDB),
      thickness: 1.2,
    );
  }

  static buildInputDecoration([hintText]) {
    return InputDecoration(
      hintText: hintText ?? '',
        filled: true,
        // errorStyle: TextStyle(color: Color(0xff886069)),
        fillColor: Colors.white,

        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 23.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: AppTheme.btnBorderColor),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)));
  }
  static buildNoErrorInputDecoration() {
    return InputDecoration(
        filled: true,
        // errorStyle: TextStyle(color: Color(0xff886069)),
        fillColor: Colors.white,
        errorStyle: TextStyle(height: 0),
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 25.0, 23.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          borderSide: BorderSide(width: 1, color: AppTheme.btnBorderColor),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)));
  }

  static void showSnackBar(String message, context, [color]) {
    Flushbar(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(14),
      borderRadius: 7,
      duration: Duration(seconds: 2),
      backgroundColor: color ?? AppTheme.darkGreyBGColour,
      messageText: Text(
        message,
        style: AppTheme.helperLabelStyle,
      ),
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: color != null ? Colors.white : Color(0xff00d3fe),
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
    ).show(context);
  }

  static Future showLoginDialog(context, message,[color]) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AdmissionProgressDialog(message,color);
        });
  }

  static Widget  chipItem(List chipLabel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 8.0,
      // gap between adjacent chips
      //runSpacing: 4.0, // gap between lines
      children: <Widget>[
        for (int i = 0; i < chipLabel.length; i++)
          if (chipLabel[i].isNotEmpty)
            Chip(
              deleteIcon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onDeleted: () {
                //setState(() {
                  chipLabel.removeAt(i);
               // });
              },
              label: Text(
                chipLabel[i],
                style: AppTheme.chipStyle.copyWith(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )),
              backgroundColor: AppTheme.checkBoxCheckedColor,
            ),
      ],
    );
  }
  static Widget entryDateChip(List chipLabel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 8.0,
      // gap between adjacent chips
      //runSpacing: 4.0, // gap between lines
      children: <Widget>[
        for (int i = 0; i < chipLabel.length; i++)
          if (chipLabel[i].isNotEmpty)
            Chip(
              deleteIcon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onDeleted: () {
                //setState(() {
                  chipLabel.removeAt(i);
               // });
              },
              label: Text(
                chipLabel[i],
                style: AppTheme.chipStyle.copyWith(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )),
              backgroundColor: AppTheme.checkBoxCheckedColor,
            ),
      ],
    );
  }
  static Widget cityChip(List<CitylistElement> chipLabel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 8.0,
      // gap between adjacent chips
      //runSpacing: 4.0, // gap between lines
      children: <Widget>[
        for (int i = 0; i < chipLabel.length; i++)
          if (chipLabel[i].name.isNotEmpty)
            Chip(
              deleteIcon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onDeleted: () {
                //setState(() {
                  chipLabel.removeAt(i);
               // });
              },
              label: Text(
                chipLabel[i].name,
                style: AppTheme.chipStyle.copyWith(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )),
              backgroundColor: AppTheme.checkBoxCheckedColor,
            ),
      ],
    );
  }
  static Widget feeRangeChip(List feeRangeList) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 8.0,
      // gap between adjacent chips
      //runSpacing: 4.0, // gap between lines
      children: <Widget>[
        for (int i = 0; i < feeRangeList.length; i++)
          if (feeRangeList[i].isNotEmpty)
            Chip(
              deleteIcon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              onDeleted: () {
                //setState(() {
                  feeRangeList.removeAt(i);
                //});
              },
              label: Text(
                feeRangeList[i],
                style: AppTheme.chipStyle.copyWith(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    width: 0.5,
                    color: AppTheme.checkBoxCheckedColor,
                  )),
              backgroundColor: AppTheme.checkBoxCheckedColor,
            ),
      ],
    );
  }

  static Widget loadingIndicator(){
    return NutsActivityIndicator(
      radius: 25,
      activeColor: Colors.blue,
      inactiveColor: Colors.lightBlueAccent,
      tickCount: 10,
      startRatio: 0.5,
      animationDuration: Duration(milliseconds: 300),
    );
  }


}

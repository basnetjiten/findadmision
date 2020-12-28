import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ///*********APP COLOURS************
  static const String fontFamily = 'SfPro';
  static const Color lightGreyBGColour = Color(0xff384555);
  static const Color switchAppTitleColor= Color(0xff9CD299);
  static const Color stdIntentionColor = Color(0xff455A64);
  static const Color editTxtColor = Color(0xffC00101);
  static const Color editBtnColor = Color(0xffFF7575);
  static const Color btnBorderColor = Color(0xffACACAC);
  static const Color addedInstituteBG = Color(0xffE0F0FB);
  static const Color stdIntentionBG = Color(0xffEEF4FC);
  static const Color locationTxtColor = Color(0xff8E8E8E);
  static const Color greyBackground = Color(0xffDBDBDB);
  static const Color officeBGColor = Color(0xff3D8DBF);
  static const Color darkGreyBGColour = Color(0xff212F3F);
  static Color checkBoxCheckedColor = Color(0xff14A60E);
  static Color errorColor =  Color(0xff886069);
  static Color favouriteBtnColor = Color(0xffFF7575);
  static Color instituteTextColor = Color(0xff2D79AD);
  static Color cardTitleTxtColor = Color(0xff191919);
  static Color navInactiveColor = Color(0xffC0CEDF);
  static Color containerBG = Color(0xffECECEC);
  static Color chipSelectedColor = Color(0xff1F8FDC);



  ///*********APP TEXT FIELD STYLES************

  static const TextStyle dialogDetailInfoStyle = TextStyle(fontFamily: fontFamily,fontSize: 14,fontWeight: FontWeight.normal);

  static TextStyle profileInfoStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      color: Colors.grey,
      fontWeight: FontWeight.normal);

  static TextStyle clickableTermsStyle = TextStyle(
      fontSize: 14.0, color: Color(0xff34A4DA), fontWeight: FontWeight.normal);

  static TextStyle termsInfoText =TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.normal);
  static TextStyle dropDownTextStyle =  TextStyle(fontSize: 14,color: AppTheme.cardTitleTxtColor);


  static TextStyle helperLabelStyle =TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.normal);
  static TextStyle studentLabelStyle =TextStyle(color: Color(0xff515151), fontSize: 14.0,fontWeight: FontWeight.w400);
  static TextStyle chipStyle =TextStyle(color: Color(0xff14A60E), fontSize: 12.0);
  static TextStyle instituteStyle =TextStyle(color: instituteTextColor, fontSize: 14.0,fontWeight: FontWeight.bold);
  static TextStyle stepperTextStyle=TextStyle(
  color: Color(0xff191919),
  fontSize: 12.0,
  fontWeight: FontWeight.w400);

  static TextStyle interTextStyle=GoogleFonts.inter(textStyle: AppTheme.studentLabelStyle
      .copyWith(fontWeight: FontWeight.w400, color: AppTheme.cardTitleTxtColor));
}

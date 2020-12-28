import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/preview_page.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentApplicationUpload extends StatefulWidget {
  final ValueChanged<double> upCallBack;
  final ValueChanged<double> downScrollCallBack;
  final double adjustableHeight;

  StudentApplicationUpload({this.adjustableHeight,this.upCallBack,this.downScrollCallBack});
  @override
  _StudentApplicationUploadState createState() => _StudentApplicationUploadState();
}

class _StudentApplicationUploadState extends State<StudentApplicationUpload> {
  ScrollController uploadDocController= ScrollController();
  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  final TextStyle subTitleStyle = GoogleFonts.workSans(
      textStyle:
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
    );


    ListView eventList= ListView(
      controller: uploadDocController,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Travel Document",
                  style: titleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "International Passport Datapage",
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xffECECEC),
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload,
                        color: AppTheme.checkBoxCheckedColor,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                AppWidgetHelper.divider(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "High / Secondary School Qualifications",
                  style: titleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Certificate",
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xffECECEC),
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload,
                        color: AppTheme.checkBoxCheckedColor,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Transcript",
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xffECECEC),
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload,
                        color: AppTheme.checkBoxCheckedColor,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Certificate & Transcript Translated in English Language",
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xffECECEC),
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload,
                        color: AppTheme.checkBoxCheckedColor,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                AppWidgetHelper.divider(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bachelor / Undergraduate or Higher Diploma Degree Qualifications",
                  style: titleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Certificate",
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xffECECEC),
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload,
                        color: AppTheme.checkBoxCheckedColor,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Certificate",
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xffECECEC),
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload,
                        color: AppTheme.checkBoxCheckedColor,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Transcript",
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xffECECEC),
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload,
                        color: AppTheme.checkBoxCheckedColor,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Certificate & Transcript Translated in English Language",
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xffECECEC),
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload,
                        color: AppTheme.checkBoxCheckedColor,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                AppWidgetHelper.divider(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Other Qualification Completed",
                  style: titleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Color(0xffECECEC),
                  minWidth: 300,
                  height: 50,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload,
                        color: AppTheme.checkBoxCheckedColor,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppTheme.checkBoxCheckedColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Want to upload mutiple documents in one file ?",style: AppTheme.instituteStyle.copyWith(fontWeight: FontWeight.w700,fontSize: 16.0)),
                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(
                              color: AppTheme.instituteTextColor,
                              width: 1.0,
                              style: BorderStyle.solid)),
                      minWidth: sizeConfig.screenWidth/2.6,
                      height: 48,
                      textColor: Colors.white,
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: AppTheme.instituteTextColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        /* .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*/
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minWidth: sizeConfig.screenWidth/2.6,
                      height: 50,
                      color: AppTheme.instituteTextColor,
                      child: Text(
                        "Next",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => PreviewPage()));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        )
      ],
    );
    return Listener(
      onPointerMove: (event) {
        print("delta"+(event.delta.dy).toString() +"pixels"+
            eventList.controller.position.pixels.toString());
        double pixels = eventList.controller.position.pixels;
        if ((pixels == 0.0 && eventList.controller.position.userScrollDirection==ScrollDirection.forward)){
          widget.upCallBack(event.delta.dy);
        }else if( pixels > 500 && eventList.controller.position.userScrollDirection==ScrollDirection.reverse){
          widget.downScrollCallBack(pixels
          );
        }

      },
      child:eventList,
    );
  }
}

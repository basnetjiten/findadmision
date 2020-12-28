import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplySuccessPage extends StatefulWidget {
  @override
  _ApplySuccessPageState createState() => _ApplySuccessPageState();
}

class _ApplySuccessPageState extends State<ApplySuccessPage> {
  final subTitleGaping = const SizedBox(height: 5.0);
  final titleGaping = const SizedBox(height: 15.0);
  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  final TextStyle subTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w600);
  final TextStyle smallTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400);
  Widget previewPage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    previewPage = Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    //color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: sizeConfig.screenHeight * 0.46,
                          ),
                          Center(
                            child: Text(
                              "Congratulation",
                              style: titleStyle,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "your application is submitted!",
                              style: subTitleStyle,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "You can check your application process the link below.",
                              style: smallTitleStyle,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: AppTheme.checkBoxCheckedColor,
                            minWidth: 340,
                            height: 50,
                            textColor: Colors.white,
                            child: Text(
                              "Back to Steps",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: sizeConfig.screenHeight * 0.15),
                    child: Container(
                      height: 240,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/malaya.jpg"))),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: sizeConfig.screenHeight * 0.27,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: sizeConfig.screenWidth * 0.12),
                        child: Text(
                          'International University Malaya Wales (IUMW) ',
                          style: GoogleFonts.workSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
    return previewPage;

  }
}

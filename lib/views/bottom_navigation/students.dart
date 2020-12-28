import 'dart:async';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/application/application_bloc.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/app_doc_tabbar.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/student_application_details.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/student_intention.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';

typedef ScrollCallback = void Function(double position);

class StudentPage extends StatefulWidget {
  final Studentlist std;
  const StudentPage({
    this.std,
    Key key,
  }) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

  Widget studentPage;
  final ScrollController controller =
      ScrollController(initialScrollOffset: 0.0);
  final GlobalKey widgetKey = GlobalKey();

  /* widgetKey is for widget in buildHeaderRow() */
  StreamController<bool> _streamController = StreamController<bool>.broadcast();

  scrollCallback(double position) {
    if (controller.hasClients) {
      print("MAIN PAGE" + position.toString());
      if (position > 0.0 || position == 0.0) {
        controller.position.moveTo(controller.position.pixels - position);
      }
    }
  }

  scrollDowCallBack(double position) {
    if (controller.hasClients) {
      //if(position <1500 ){
      //print("FLOW IS HERE");
      controller.position.moveTo(controller.position.pixels + 50);

      //}

    }
  }

  @override
  void dispose() {
    controller.dispose();
    _streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    controller.addListener(() {
      //print((widgetKey.currentContext!=null).toString()+"CONTEXTT CHECK");
      if (widgetKey.currentContext != null) {
        double height = widgetKey.currentContext.size.height;
        print("HEIGHT" + height.toString());
        print("OFFSET" + controller.offset.toString());
        _streamController.add(controller.offset - 100 >= height + 220);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    studentPage = Container(
        color: AppTheme.greyBackground,
        child: Padding(
          padding: EdgeInsets.only(top: sizeConfig.screenHeight * 0.15),
          child: SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* SizedBox(
                height: sizeConfig.screenHeight * 0.15,
              ),*/
                      StudentApplicationDetails(student:widget.std),
                      SizedBox(
                        height: 15,
                      ),
                      //StudentIntention(),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border:Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(7)),
                          height: sizeConfig.screenHeight,
                          width: 400,
                          child: ApplicationDocCard(widget.std.membersId,widgetKey, scrollCallback,
                              scrollDowCallBack, _streamController.stream)),
                      SizedBox(
                        height: 15,
                      ),
                    ]),
              )),
        ));
    return studentPage;
  }
}

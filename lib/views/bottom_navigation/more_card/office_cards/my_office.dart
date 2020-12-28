import 'package:dotted_border/dotted_border.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/office_cards/add_office.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:findadmissionaffiliate/bloc/office_list_bloc/office_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOffice extends StatefulWidget {
  @override
  _MyOfficeState createState() => _MyOfficeState();
}

class _MyOfficeState extends State<MyOffice> {
  Widget myOfficePage;
  OfficeListBloc _officeListBloc;

  @override
  void initState() {
    _officeListBloc = BlocProvider.of<OfficeListBloc>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return /* BlocListener<OfficeListBloc,OfficeListState>(
      cubit: _officeListBloc,
      listener: (context,state){
        if(state is OfficeListFetched){

        }else if(state is OfficeListEmpty){

        }
      },
      child:*/ Container(
        child: Scaffold(
          backgroundColor: AppTheme.greyBackground,
          body: Padding(
            padding:
            EdgeInsets.fromLTRB(15, sizeConfig.screenHeight * 0.15, 15, 15),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              elevation: 1,
              child: Container(
                height: sizeConfig.screenHeight * 0.72,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),

                          SizedBox(
                            height: sizeConfig.screenHeight * 0.15,
                          ),
                          Container(
                            height: 150,
                            width: sizeConfig.screenWidth,
                            child: DottedBorder(
                                dashPattern: [6, 2],
                                color: AppTheme.instituteTextColor,
                                strokeWidth: 1.2,
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: Text(

                                        "You haven’t bulit your office information yet.",
                                        style: AppTheme.helperLabelStyle.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppTheme.instituteTextColor),
                                        textScaleFactor: 1.2,
                                      ),
                                    ))),
                          ),
                          SizedBox(
                            height:sizeConfig.isMediumScreen() ?sizeConfig.screenHeight * 0.19: sizeConfig.screenHeight * 0.17,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            minWidth: sizeConfig.screenWidth,
                            height: 50,
                            color: AppTheme.instituteTextColor,
                            child: Text(
                              "Update Now",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                  CupertinoPageRoute(builder: (_) => AddOffice()));
                            },
                          ),
                        ],
                      ),
                      Positioned(
                        left: -20,
                        top: -10,
                        bottom: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(CupertinoIcons.back),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Image.asset(
                                "assets/images/myoffice.png",
                                fit: BoxFit.contain,
                                height: 27,
                                width: 27,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "My Office",
                                style: AppTheme.helperLabelStyle.copyWith(
                                    color: AppTheme.cardTitleTxtColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
   // );
  }
}

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/office_list_bloc/office_list_bloc.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/office_cards/add_office.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/office_cards/edit_office.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:findadmissionaffiliate/models/home/office_list.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/office_list_max_3.dart';

BuildContext parentContext;

class MyOfficeList extends StatefulWidget {
  final BuildContext parentContext;

  MyOfficeList({this.parentContext});

  @override
  _MyOfficeListState createState() => _MyOfficeListState();
}

class _MyOfficeListState extends State<MyOfficeList> {
  OfficeListBloc _officeListBloc;
  final formTextStyle = AppTheme.interTextStyle;
  final btnStyle = GoogleFonts.workSans(
      textStyle: AppTheme.studentLabelStyle.copyWith(
          color: AppTheme.instituteTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 12));
  Widget myOfficePage;

  @override
  void initState() {
    parentContext = widget.parentContext;
    //print("EXEUTING THISSS");
    /*setState(() {
      //allOfficeList=officeList;
    });*/
    //print(widget.officeList.length.toString());
    _officeListBloc = BlocProvider.of<OfficeListBloc>(context);
    super.initState();
  }

/*  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyOfficeList oldWidget) {
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocListener<OfficeListBloc, OfficeListState>(
      cubit: _officeListBloc,
      listener: (context, state) {
        if (state is OfficeRemoved) {

          AppWidgetHelper.showSnackBar(
              "Office Deleted", context, AppTheme.checkBoxCheckedColor);
        } else if (state is OfficeListFetched) {
        } else if (state is OfficeListEmpty) {}
      },
      child: Scaffold(
        backgroundColor: AppTheme.greyBackground,
        body: Padding(
          padding:
              EdgeInsets.fromLTRB(20, sizeConfig.screenHeight * 0.05, 20, 20),
          child: Column(
            children: [
              SizedBox(
                height: 85,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(7),
                      topLeft: Radius.circular(7)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Container(
                  height: sizeConfig.screenHeight * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Positioned(
                          left: -7,
                          right: 2,
                          top: 0,
                          bottom: 0,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    Navigator.of(widget.parentContext).pop();
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/images/myoffice.png",
                                  height: 25,
                                  width: 25,
                                ),
                                SizedBox(
                                  width: 10,
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
              // SizedBox(height: 20,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200],
                        offset: Offset(1, 7), //(x,y)
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Container(
                    height: sizeConfig.screenHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          itemCount: officeList.length,
                          itemBuilder: (context, index) {
                            final office = officeList[index];
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  officeList.removeWhere((theOffice) =>
                                      theOffice.partnerOfficeId ==
                                      office.partnerOfficeId);
                                });
                                _officeListBloc.add(RemoveOffice(
                                    officeId: office.partnerOfficeId));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: sizeConfig.screenWidth,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              /*Text(
                                                "Office Name 1",
                                                style: AppTheme.helperLabelStyle
                                                    .copyWith(
                                                        color: AppTheme
                                                            .cardTitleTxtColor,
                                                        fontWeight:
                                                            FontWeight.w700),
                                              ),*/
                                              IconButton(
                                                icon: Icon(
                                                  CupertinoIcons.create,
                                                  color: AppTheme
                                                      .instituteTextColor,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      CupertinoPageRoute(
                                                          builder: (_) =>
                                                              EditOffice(office:office)));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 165,
                                              width: 50,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    "assets/office_location.svg",
                                                    height:22,
                                                  width:22,

                                              ),
                                                  SizedBox(
                                                    height: 95,
                                                  ),
                                                  SvgPicture.asset(
                                                      "assets/contact.svg",
                                                    height:22,
                                                    width:22,
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Container(
                                              height: 165,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [

                                                  Text(
                                                    office.countryName+","+office.partnerOfficeCity,
                                                    style: formTextStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(office
                                                      .partnerOfficeAddress),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  MaterialButton(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        side: BorderSide(
                                                            color: AppTheme
                                                                .instituteTextColor,
                                                            width: 1.0,
                                                            style: BorderStyle
                                                                .solid)),
                                                    minWidth: 100,
                                                    height: 40,
                                                    textColor: Colors.white,
                                                    child: Text(
                                                      "GoogleMap",
                                                      style: btnStyle,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      /*Navigator.of(context)
                                        .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*/
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    "+"+office.partnerOfficeContact,
                                                    style: formTextStyle,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AppWidgetHelper.divider(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              /* MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                        color: AppTheme.instituteTextColor,
                        width: 1.0,
                        style: BorderStyle.solid)),
                minWidth: sizeConfig.screenWidth,
                height: 50,
                textColor: Colors.white,
                child: Text(
                  "Add Office",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: AppTheme.instituteTextColor,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.8),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  */ /*Navigator.of(context)
                                      .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*/ /*
                },
              ),*/
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.instituteTextColor,
          onPressed: () async {
            final List<OfficeList> list = await Navigator.of(context).push(
                CupertinoPageRoute(
                    builder: (_) => BlocProvider<OfficeListBloc>(
                        create: (context) => _officeListBloc,
                        child: AddOffice())));
            if (list != null) {
              setState(() {
                officeList = list;
              });
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

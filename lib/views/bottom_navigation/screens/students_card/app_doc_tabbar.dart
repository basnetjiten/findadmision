import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/application/application_bloc.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/pagination.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/action_dropdown.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/custom_tab_bar.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/document_upload_card/travel_doc.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/student_application_list_card.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationDocCard extends StatefulWidget {
  ApplicationDocCard(
      this.stdId,this.widgetKey, this.upCallBack, this.downScrollCallBack, this.stream);

  final GlobalKey widgetKey;
  final ValueChanged<double> upCallBack;
  final ValueChanged<double> downScrollCallBack;
  final Stream<bool> stream;
  final String stdId;

  @override
  _ApplicationDocCardState createState() => _ApplicationDocCardState();
}

class _ApplicationDocCardState extends State<ApplicationDocCard> {
  bool isChildScrollEnabled = false;
  ScrollController _scrollController = ScrollController();
  ApplicationBloc _applicationBloc;

  @override
  void initState() {
    _applicationBloc = ApplicationBloc()..add(FetchApplicationList(stdId: widget.stdId));
    super.initState();
    widget.stream.distinct().listen((bool data) {
      setState(() {
        print("STREAMERS" + data.toString());
        isChildScrollEnabled = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Scrollbar eventList = Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: BlocBuilder<ApplicationBloc, ApplicationState>(
        cubit: _applicationBloc,
        // ignore: missing_return
        builder: (context, state) {
          if (state is ApplicationInitial) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ApplicationListFetched) {
            final applicationListRes = state.applicationListRes;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: new TextSpan(children: [
                      TextSpan(
                          text: '${applicationListRes.studentname} has ',
                          style: AppTheme.chipStyle
                              .copyWith(color: AppTheme.cardTitleTxtColor)),
                      TextSpan(
                          text: '${applicationListRes.match.length}',
                          style: AppTheme.chipStyle
                              .copyWith(color: AppTheme.checkBoxCheckedColor)),
                      TextSpan(
                          text: ' applicaitions ',
                          style: AppTheme.chipStyle
                              .copyWith(color: AppTheme.cardTitleTxtColor)),
                    ])),
                SizedBox(
                  height: 15,
                ),
                AppWidgetHelper.divider(),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                      key: widget.widgetKey,
                      controller: _scrollController,
                      physics:
                           AlwaysScrollableScrollPhysics(),
                         /*NeverScrollableScrollPhysics(),*/
                      itemCount: applicationListRes.match.length,
                      itemBuilder: (context, index) {
                        final application = applicationListRes.match[index];
                        return ApplicationListCard(application: application);
                      }),
                ),
              ],
            );
          }
          if (state is EmptyApplicationList) {
            return Center(
              child: Text("Seems like you have not applied"),
            );
          }
        },
      ),
    );

    return buildDefaultTabController(sizeConfig.screenWidth, eventList);
  }

  Widget buildDefaultTabController(screenWidth, Scrollbar eventList) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(-50),
          child: Padding(
            padding: EdgeInsets.only(right: sizeConfig.screenWidth * 0.2),
            child: CustomTabBar(
              tabBar: TabBar(
                labelStyle: sizeConfig.isMediumScreen()
                    ? AppTheme.chipStyle
                        .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold)
                    : AppTheme.chipStyle
                        .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: sizeConfig.isMediumScreen()
                    ? AppTheme.chipStyle
                        .copyWith(fontSize: 16.0, fontWeight: FontWeight.normal)
                    : AppTheme.chipStyle.copyWith(
                        fontSize: 16.0, fontWeight: FontWeight.normal),

                labelColor: AppTheme.checkBoxCheckedColor,
                // indicatorColor: AinAppTheme.brandColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: UnderlineTabIndicator(
                  insets: const EdgeInsets.symmetric(horizontal: 12),
                  borderSide: BorderSide(
                      color: AppTheme.checkBoxCheckedColor, width: 5.0),
                ),
                tabs: [
                  Tab(
                    text: "Applications",
                  ),
                  Tab(text: "Documents"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: sizeConfig.screenWidth * 0.4,
                  decoration: BoxDecoration(
                      //color: Color(0xff212F3F),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: AppTheme.btnBorderColor)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: ActionDropDown(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: sizeConfig.screenWidth * 0.4,
                      height: 50,
                      color: Colors.white,
                      child: Center(
                        child: TextFormField(
                            cursorColor: AppTheme.cardTitleTxtColor,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'key words..',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.0),
                                  ),
                                  borderSide: BorderSide(
                                      color: AppTheme.btnBorderColor),
                                ))),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppTheme.officeBGColor,
                      minWidth: 140,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Search",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  height: sizeConfig.screenHeight / 2.12,
                  child: Listener(
                    onPointerMove: (event) {
                      // print("delta"+(event.delta.dy).toString() +"pixels"+ eventList.controller.position.pixels.toString()+"pix");
                      // print("SCROLL DIRECTION"+(eventList.controller.position.userScrollDirection).toString());
                      double pixels = eventList.controller.position.pixels;
                      if ((event.delta.dy > 0.0 &&
                          pixels == 0.0 &&
                          eventList.controller.position.userScrollDirection ==
                              ScrollDirection.forward)) {
                        widget.upCallBack(event.delta.dy);
                      } else if (eventList
                              .controller.position.userScrollDirection ==
                          ScrollDirection.reverse) {
                        print("REVERSE");
                        widget.downScrollCallBack(pixels);
                      }
                    },
                    child: eventList,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                AppWidgetHelper.divider(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Showing 61 - 70 of 154 Results",
                  style: AppTheme.helperLabelStyle
                      .copyWith(color: AppTheme.cardTitleTxtColor),
                ),
                SizedBox(
                  height: 10,
                ),
                //PaginationCard(),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(
                  child: StudentApplicationUpload(
                upCallBack: widget.upCallBack,
                downScrollCallBack: widget.downScrollCallBack,
              )),
            ],
          ),
        ]),
      ),
    );
  }
}

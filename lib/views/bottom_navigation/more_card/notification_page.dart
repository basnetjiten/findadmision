import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/notification_bloc/notification_bloc.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/notification_list.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> position;
  List<Notilist> notilist=[];
  int notificationPage = 0;
  NotificationBloc notificationBloc;
  final _notificationScrollController = ScrollController();

  void _notiScrollListener() {
    final currentScroll = _notificationScrollController.position.pixels;
    final maxScroll = _notificationScrollController.position.maxScrollExtent;

    if (currentScroll == maxScroll) {
      notificationPage++;
      print("PAGE" + notificationPage.toString());
      notificationBloc.add(FetchNotification(index: notificationPage));
    }
  }

  @override
  void initState() {
    notilist=[];
    notificationBloc = NotificationBloc()
      ..add(FetchNotification(index: notificationPage));
    _notificationScrollController.addListener(_notiScrollListener);

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    position = Tween<Offset>(begin: Offset(0.0, -4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    notificationBloc.close();
    _notificationScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SlideTransition(
          position: position,
          child: Container(
            height: sizeConfig.screenHeight,
            width: sizeConfig.screenWidth,
            color: AppTheme.darkGreyBGColour,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizeConfig.screenHeight * 0.07,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: sizeConfig.screenWidth / 5,
                      ),
                      Text(
                        "Notifications",
                        style: AppTheme.profileInfoStyle.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    height: sizeConfig.screenHeight,
                    // width: 400,
                    child: BlocBuilder<NotificationBloc, NotificationState>(
                        cubit: notificationBloc,
                        // ignore: missing_return
                        builder: (context, state) {
                          if (state is NotificationInitial) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is NotificationDataFetched) {
                            final notificationList = state.notificationList;
                            notilist.addAll(notificationList);
                            return buildPadding(notificationList, state);
                          }
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildPadding(List<Notilist> notificationList, NotificationDataFetched state) {
    return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: ListView.builder(
                              controller: _notificationScrollController,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {

                                return index >= notificationList.length
                                    ?Padding(
                                      padding: const EdgeInsets.only(top:10.0),
                                      child: Container(
                                  alignment: Alignment.center,
                                  child: Center(
                                      child: SizedBox(
                                        width: 33,
                                        height: 33,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1.5,
                                        ),
                                      ),
                                  ),
                                ),
                                    )
                                    : Container(
                                        child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              notificationList[index]
                                                  .partnernotificationText,
                                              style: AppTheme.profileInfoStyle
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              notificationList[index]
                                                  .partnernotificationTime,
                                              style: AppTheme.profileInfoStyle
                                                  .copyWith(
                                                      fontSize: 12.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Divider(
                                            color: AppTheme.greyBackground,
                                            thickness: 0.8,
                                          )
                                        ],
                                      ));
                              },
                              itemCount: state.hasReachedMax
                                  ? notificationList.length
                                  : notificationList.length + 1,
                            ),
                          );
  }
}

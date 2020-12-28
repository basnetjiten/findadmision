import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      elevation: 1,
      child: Container(
        // width: 440,
        height: 220,
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                  color: Color(0xff3D8DBF),
                  height: 50,
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            "assets/announce_fill.svg"
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "Announcement",
                            style: AppTheme.helperLabelStyle.copyWith(fontWeight: FontWeight.bold,fontSize: 14.0),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.navigate_next,
                          size: 27,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 35.0,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Afternoon,",
                        style: AppTheme.helperLabelStyle.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      Text(dashboardDataRes.basic.fullname,
                          style: AppTheme.helperLabelStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        dashboardDataRes.basic.secondline,
                        style:
                            TextStyle(color: Color(0xff191919), fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Account ID: ${dashboardDataRes.basic.id}",
                        style:
                            TextStyle(color: Color(0xff8E8E8E), fontSize: 12.0),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

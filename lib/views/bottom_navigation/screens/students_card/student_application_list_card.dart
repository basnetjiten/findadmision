import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/institute/application_list_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationListCard extends StatefulWidget {
  final ApplicationMatch application;
  const ApplicationListCard({
    this.application,
    Key key,
  }) : super(key: key);

  @override
  _ApplicationListCardState createState() => _ApplicationListCardState();
}

class _ApplicationListCardState extends State<ApplicationListCard> {
  ApplicationMatch _application;
  @override
  void initState() {
    _application=widget.application;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 440,
      //height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(_application.pic),
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
                        _application.name,
                        style: AppTheme.helperLabelStyle.copyWith(
                            color: AppTheme.instituteTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      _application.country,
                      style:
                          TextStyle(color: Color(0xff191919), fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 25,
                      decoration: BoxDecoration(
                          color: AppTheme.checkBoxCheckedColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,4,8,0),
                        child: Text(_application.mydegreename,style: TextStyle(color: Colors.white,fontSize: 12.0),),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      int.parse(_application.faze) < 0 ? "Complete":"Incomplete",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: AppTheme.favouriteBtnColor,
                          fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
               // color: AppTheme.favouriteBtnColor,
                minWidth: 140,
                height: 50,
                textColor: Colors.white,
                child: Row(
                  children: [
                    Icon(CupertinoIcons.delete,color: AppTheme.instituteTextColor,),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Delete",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: AppTheme.instituteTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: AppTheme.favouriteBtnColor,
                minWidth: 145,
                height: 50,
                textColor: Colors.white,
                child: Text(
                int.parse(_application.faze) < 0 ? "Incomplete":"Complete",
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
          AppWidgetHelper.divider()
        ],
      ),
    );
  }
}

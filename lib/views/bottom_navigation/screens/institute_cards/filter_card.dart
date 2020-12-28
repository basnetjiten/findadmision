import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/univ_filter_bloc/univ_filter_bloc.dart';
import 'package:findadmissionaffiliate/helpers/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum BottomIcons { Home, Favorite, Search, Account }

class FilterUniversityCard extends StatefulWidget {
  const FilterUniversityCard({
    Key key,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _FilterUniversityCardState createState() => _FilterUniversityCardState();
}

class _FilterUniversityCardState extends State<FilterUniversityCard> {
  SizeConfig _sizeConfig;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _sizeConfig = SizeConfig(context);
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      elevation: 1,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/colleges.svg"),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Colleges & Universities",
                      style: AppTheme.helperLabelStyle.copyWith(
                          fontSize: 18.0,
                          color: AppTheme.cardTitleTxtColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                "Help students apply for the dream university",
                style: AppTheme.helperLabelStyle.copyWith(
                  fontSize: 14.0,
                  color: AppTheme.cardTitleTxtColor,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.7,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => widget._scaffoldKey.currentState.openEndDrawer(),
                child: Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filter",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Icon(
                        Icons.navigate_next,
                        size: 27,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.7,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: _sizeConfig.screenWidth * 0.48,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: TextFormField(
                          cursorColor: AppTheme.cardTitleTxtColor,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'key words..',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0)),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: AppTheme.officeBGColor,
                    minWidth: 110,
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
            ],
          ),
        ),
      ),
    );
  }
}

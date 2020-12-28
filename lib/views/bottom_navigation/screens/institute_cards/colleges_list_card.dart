import 'package:cached_network_image/cached_network_image.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/institutes/save_inst_bloc/save_inst_bloc.dart';
import 'package:findadmissionaffiliate/models/univ.dart';
import 'package:findadmissionaffiliate/utils/bottombar.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/institute_details.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollegeListCard extends StatefulWidget {
  final Match univMatch;
  final SaveInstBloc favInstBloc;

  const CollegeListCard({
    @required this.univMatch,
    @required this.favInstBloc,
    Key key,
  }) : super(key: key);

  @override
  _CollegeListCardState createState() => _CollegeListCardState();
}

class _CollegeListCardState extends State<CollegeListCard> {
  List<String> tabList = [];
  List<CollegeFees> allFees = [];
  String tab;
  String selectedValue;
  Match univMatch;
  SaveInstBloc _saveInstBloc;
  bool isFavourite = false;

  @override
  void initState() {
    _saveInstBloc = widget.favInstBloc;
    univMatch = widget.univMatch;
    tabList = univMatch.degreelist;
    tab = tabList[0];
    isFavourite = univMatch.saved;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderOnForeground: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
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
                      CircleAvatar(
                        radius: 25.0,
                        child: ClipOval(
                          child: Container(
                            height: 50,
                            width: 50,
                            child: CachedNetworkImage(
                              imageUrl: univMatch.pic,
                              fit: BoxFit.contain,
                              imageBuilder: (context, imageProvider) {
                                return Image(
                                  image: imageProvider,
                                  fit: BoxFit.contain,
                                  gaplessPlayback: true,
                                );
                              },
                              /*placeholder: (context, string) {
            return Image.asset(
              "assets/images/placeholder.png",
              fit: BoxFit.fill,
            );
          }*/
                            ),
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.univMatch.name,
                                style: AppTheme.helperLabelStyle.copyWith(
                                    color: AppTheme.instituteTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${univMatch.cityname + univMatch.country}",
                              style: TextStyle(
                                  color: Color(0xff191919), fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: tabList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final value = tabList[index];
                              return BottomBar(
                                  onPressed: () {
                                    setState(() {
                                      tab = value;
                                      selectedValue = value;
                                    });
                                  },
                                  bottomIcons: tab == value ? true : false,
                                  icons: Icons.home,
                                  text: value.toString());
                            }),
                      ),
                    ],
                  ),

                  getCollegeFeeDetails(tab),
                  SizedBox(
                    height: 10,
                  ),
                  // CollegeFees(univMatch: univMatch),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: AppTheme.favouriteBtnColor,
                        minWidth: sizeConfig.screenWidth / 2.5,
                        height: 50,
                        textColor: Colors.white,
                        child: Row(
                          children: [
                            Icon(isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onPressed: () {
                          if (isFavourite) {
                            setState(() {
                              isFavourite = false;
                              _saveInstBloc
                                  .add(DeleteInst(instId: univMatch.id));
                            });
                          } else {
                            setState(() {
                              isFavourite = true;
                              _saveInstBloc.add(SaveInst(instId: univMatch.id));
                            });
                          }
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: AppTheme.checkBoxCheckedColor,
                        minWidth: sizeConfig.screenWidth / 2.5,
                        height: 50,
                        textColor: Colors.white,
                        child: Text(
                          "See More",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          /* Navigator.of(context,rootNavigator: false).push(CupertinoPageRoute(
                          builder: (context)=>InstituteDetails()
                        ));*/
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (_) => InstituteDetails(
                                      fromStudentApply: false,
                                      universityId: univMatch.id,
                                    )),
                          );
                        },
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
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget getCollegeFeeDetails(String courseName) {
    Widget feeColumn;
    univMatch.allfees.forEach((fee) {
      if (fee.name.trim() == courseName.trim()) {
        feeColumn = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Tuition fee: ${fee.budget}",
              style: AppTheme.clickableTermsStyle
                  .copyWith(color: AppTheme.cardTitleTxtColor),
            ),
            Text(
              "Application fee: ${fee.applicationfee}",
              style: AppTheme.clickableTermsStyle
                  .copyWith(color: AppTheme.cardTitleTxtColor),
            ),
            Text(
              "Intake: ${univMatch.startmonliststr}",
              style: AppTheme.clickableTermsStyle
                  .copyWith(color: AppTheme.cardTitleTxtColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${fee.sellingpoint}",
              style: AppTheme.clickableTermsStyle
                  .copyWith(color: AppTheme.locationTxtColor),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        );
      }
    });
    if (feeColumn != null) {
      return feeColumn;
    }
    return SizedBox(
      height: 100,
      width: 80,
    );
  }
}

class CollegeFees extends StatelessWidget {
  const CollegeFees({
    Key key,
    @required this.univMatch,
  }) : super(key: key);

  final Match univMatch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Tuition fee: ${univMatch.mybudget}",
          style: AppTheme.clickableTermsStyle
              .copyWith(color: AppTheme.cardTitleTxtColor),
        ),
        Text(
          "Application fee: ${univMatch.myapplicationfee}",
          style: AppTheme.clickableTermsStyle
              .copyWith(color: AppTheme.cardTitleTxtColor),
        ),
        Text(
          "Intake: ${univMatch.startmonliststr}",
          style: AppTheme.clickableTermsStyle
              .copyWith(color: AppTheme.cardTitleTxtColor),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "International Accreditations from WASC, AACSB, EQUIS, ABET, MOE-UAE 2. Internships with MNCs 3. Wide range of programs in Engineering, Health Sciences, Business",
          style: AppTheme.clickableTermsStyle
              .copyWith(color: AppTheme.locationTxtColor),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

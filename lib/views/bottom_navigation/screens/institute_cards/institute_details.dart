import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/institutes/inst_detail_bloc.dart';
import 'package:findadmissionaffiliate/helpers/shimmer_loader.dart';
import 'package:findadmissionaffiliate/models/student/student_list_res.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/application_step_one.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/dropdowns/overview.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/course_partials/courses.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/requirement_partials/mandatory_no_mandatory.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/students_card/overview_dropdown.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:findadmissionaffiliate/bloc/institutes/work_exp/work_exp_bloc.dart';

class InstituteDetails extends StatefulWidget {
  final String universityId;
  final bool fromStudentApply;
  final Studentlist student;

  InstituteDetails({this.universityId, this.fromStudentApply,this.student});

  @override
  _InstituteDetailsState createState() => _InstituteDetailsState();
}

class _InstituteDetailsState extends State<InstituteDetails> {
  InstDetailBloc _instDetailBloc;
  int offset = 0;
  int time = 800;
  int selectedPage = 0;
  List<Widget> dropDownPages;

  @override
  void initState() {
    _instDetailBloc = InstDetailBloc()
      ..add(FetchInstDetail(instId: widget.universityId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    offset += 5;
    time = time + offset;

    return Material(
        child: Scaffold(
      backgroundColor: AppTheme.greyBackground,
      body: BlocBuilder<InstDetailBloc, InstDetailState>(
          cubit: _instDetailBloc,
          // ignore: missing_return
          builder: (context, state) {
            if (state is InstDetailInitial) {
              return Shimmer.fromColors(
                  period: Duration(milliseconds: time),
                  child: ShimmerLoader(),
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100]);
            }
            if (state is InstDetailFetched) {
              final instituteResponse = state.instituteDetailRes;
              dropDownPages = [
                OverviewSection(institute: instituteResponse),
                MandatoryNoMandatoryPage(institute: instituteResponse),
                Courses(instDetailRes: instituteResponse)
              ];
              return Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  height: sizeConfig.screenHeight,
                  width: sizeConfig.screenWidth,
                  // color: AppTheme.greyBackground,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 105,
                      ),
                      Container(
                        color: Colors.white,
                        height: 390,
                        width: 520,
                        child: Stack(fit: StackFit.loose, children: [
                          Container(
                            height: 300,
                            //width: sizeConfig.screenWidth,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(instituteResponse
                                        .details.institutesCoverurl))),
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
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: sizeConfig.screenHeight * 0.12,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          sizeConfig.screenWidth * 0.14),
                                  child: Center(
                                    child: Text(
                                      instituteResponse.details.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          instituteResponse.details.countryname,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16.0),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          color: AppTheme.favouriteBtnColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: sizeConfig.screenHeight * 0.02,
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  color: AppTheme.checkBoxCheckedColor,
                                  minWidth: 150,
                                  height: 50,
                                  textColor: Colors.white,
                                  child: Text(
                                    "Apply Now",
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    workExpSubmittedRes = null;
                                    Navigator.of(context).push(
                                      CupertinoPageRoute(
                                          builder: (_) => ApplicationStepOne(
                                            student:widget.student,
                                            fromStudentApply:widget.fromStudentApply,
                                              institute: instituteResponse,
                                              univ: widget.universityId)),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: sizeConfig.isSmallScreen()
                                      ? sizeConfig.screenHeight * 0.08
                                      : sizeConfig.screenHeight * 0.05,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    height: 42,
                                    // width: 290,
                                    decoration: BoxDecoration(

                                        // color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                            color:
                                                AppTheme.checkBoxCheckedColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Center(
                                          child: OverViewDropDown(
                                        onDropDownPageChange:
                                            onDropDownPageChange,
                                      )),
                                    ),
                                  ),
                                ) /*,
                              Container(
                                  height: 50,
                                  width: sizeConfig.screenWidth,
                                  color: Colors.white,
                                  child: Center(child: Text("Overview"))),*/ /*
                            ],
                          ),
                        ),*/
                              ],
                            ),
                          ),
                        ]),
                      ),
                      dropDownPages[selectedPage],
                    ],
                  )));
            }
            if (state is InstDetailError) {
              return Center(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: AppTheme.checkBoxCheckedColor,
                  minWidth: 150,
                  height: 50,
                  textColor: Colors.white,
                  child: Text(
                    "Go Back",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              );
            }
          }),
    ));
    /*Stack(
        children: [
          Container(
            height: 280,
            width: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/malaya.jpg")
                )
            ),
          ),
          Text("College Name"),




        ],
      ),*/
  }

  void onDropDownPageChange(int value) {
    setState(() {
      selectedPage = value;
    });
  }
}

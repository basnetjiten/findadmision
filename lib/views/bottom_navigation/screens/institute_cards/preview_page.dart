import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/institutes/preview_apply/preview_apply_bloc.dart';
import 'package:findadmissionaffiliate/bloc/institutes/submit_apply/submit_bloc.dart';
import 'package:findadmissionaffiliate/dto/institutes/courses.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/institute/load_data_res.dart';
import 'package:findadmissionaffiliate/models/institute/submit_success.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/application_step_one.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/apply_success.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/doc_upload_form.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:open_file/open_file.dart';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class PreviewPage extends StatefulWidget {
  final String studentId, instId;

  PreviewPage({this.studentId, this.instId});

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  SubmitBloc submitBloc;
  final TextStyle docSubtitle = GoogleFonts.workSans(
      textStyle:
          AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400));
  final subTitleGaping = const SizedBox(height: 5.0);
  final titleGaping = const SizedBox(height: 15.0);
  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 16, fontWeight: FontWeight.w700);
  final TextStyle subTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w600);
  final TextStyle smallTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400);
  Widget previewPage;
  final SizedBox gapTen = const SizedBox(height: 10);
  PreviewApplyBloc previewApplyBloc;

  @override
  void initState() {
    previewApplyBloc = PreviewApplyBloc();
    submitBloc = SubmitBloc();
    previewApplyBloc
        .add(FetchPreviewData(stdId: widget.studentId, instID: widget.instId));
    super.initState();
  }

  @override
  void dispose() {
    previewApplyBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubmitBloc, SubmitState>(
      cubit: submitBloc,
      listener: (context, state) {
        if (state is ApplySubmitted) {
          Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => ApplySuccessPage()));
        }
      },
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        elevation: 1,
        child: BlocBuilder<PreviewApplyBloc, PreviewApplyState>(
            cubit: previewApplyBloc,
            // ignore: missing_return
            builder: (context, state) {
              if (state is PreviewApplyInitial) {
                return Center(
                  child: NutsActivityIndicator(
                    radius: 25,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.lightBlueAccent,
                    tickCount: 10,
                    startRatio: 0.5,
                    animationDuration: Duration(milliseconds: 300),
                  ),
                );
              }
              if (state is PreviewApplyFetched) {
                final preview = state.previewApplyRes;

                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                            //color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: sizeConfig.screenHeight * 0.46,
                                ),
                                Center(
                                  child: Text(
                                    "Preview",
                                    style: titleStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text(
                                    "LastStep!",
                                    style: subTitleStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Check your application before submission.",
                                    style: smallTitleStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                AppWidgetHelper.stepperContainer(
                                    step: 1, title: "Information"),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: sizeConfig.screenWidth,
                                  height: 358,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: AppTheme.containerBG,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Level of Study",
                                          style: subTitleStyle,
                                        ),
                                        subTitleGaping,
                                        Text(
                                          "Undergraduate",
                                          style: smallTitleStyle,
                                        ),
                                        titleGaping,
                                        Text(
                                          "Start Time",
                                          style: subTitleStyle,
                                        ),
                                        subTitleGaping,
                                        Text(
                                          "June 2020",
                                          style: smallTitleStyle,
                                        ),
                                        titleGaping,
                                        Text(
                                          "Application Fee",
                                          style: subTitleStyle,
                                        ),
                                        subTitleGaping,
                                        Text(
                                          "Fee",
                                          style: smallTitleStyle,
                                        ),
                                        titleGaping,
                                        Text(
                                          "Funding Source",
                                          style: subTitleStyle,
                                        ),
                                        subTitleGaping,
                                        Text(
                                          getFundingName(
                                              preview.fundingdata.selected),
                                          style: smallTitleStyle,
                                        ),
                                        titleGaping,
                                        Text(
                                          "Family or Friends Information",
                                          style: subTitleStyle,
                                        ),
                                        subTitleGaping,
                                        Text(
                                          preview.fundingdata.sponcorfname +
                                              preview.fundingdata.sponcorlname,
                                          style: smallTitleStyle,
                                        ),
                                        subTitleGaping,
                                        Text(
                                          preview.fundingdata.sponcortelephone,
                                          style: smallTitleStyle,
                                        ),
                                        subTitleGaping,
                                        Text(
                                          preview.fundingdata.sponcoremail,
                                          style: smallTitleStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                AppWidgetHelper.stepperContainer(
                                    step: 2, title: "course"),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: sizeConfig.screenWidth,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: AppTheme.containerBG,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: ListView.builder(
                                        itemCount:
                                            preview.selectedcoursearr.length,
                                        itemBuilder: (context, index) {
                                          final course =
                                              preview.selectedcoursearr[index];
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                course["name"],
                                                style: smallTitleStyle,
                                              ),
                                              subTitleGaping,
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                AppWidgetHelper.stepperContainer(
                                    step: 3, title: "Work Experience"),
                                SizedBox(
                                  height: 30,
                                ),
                                AppWidgetHelper.stepperContainer(
                                    step: 4, title: "Documents"),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Travel Document",
                                        style: titleStyle,
                                      ),
                                      gapTen,
                                      Text(
                                        "International Passport Datapage",
                                        style: docSubtitle,
                                      ),
                                      Column(
                                        children: [
                                          gapTen,
                                          MediaQuery.removePadding(
                                            context: context,
                                            removeTop: true,
                                            removeBottom: true,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: const NeverScrollableScrollPhysics(),
                                                itemCount: fileDataRes.folders.length,
                                                itemBuilder: (context, index) {
                                                  final folder = fileDataRes.folders[index];

                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 7,
                                                      ),

                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      folder.documentfoldersReqfiles.isNotEmpty
                                                          ? Text(
                                                        folder.documentfoldersName,
                                                        style: titleStyle,
                                                      )
                                                          : SizedBox(),
                                                      ListView.builder(
                                                          shrinkWrap: true,
                                                          physics:
                                                          const NeverScrollableScrollPhysics(),
                                                          itemCount:
                                                          folder.documentfoldersReqfiles.length,
                                                          // ignore: missing_return
                                                          itemBuilder: (context, index) {
                                                            final DocumentfoldersReqfile subFolder =
                                                            folder.documentfoldersReqfiles[index];
                                                            return Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Text(
                                                                  subFolder.name,
                                                                  style: subTitleStyle,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    ListView.builder(
                                                                        shrinkWrap: true,
                                                                        physics:
                                                                        const NeverScrollableScrollPhysics(),
                                                                        itemCount:
                                                                        subFolder.filesx.length,
                                                                        // ignore: missing_return
                                                                        itemBuilder:
                                                                            (context, index) {
                                                                          final remoteFile =
                                                                          subFolder.filesx[index];
                                                                          return InkWell(
                                                                            onTap: () async {
                                                                              final fileUrl = remoteFile
                                                                                  .studentfilesFilepath;
                                                                              print(remoteFile
                                                                                  .studentfilesFilepath);
                                                                              if (await canLaunch(
                                                                                  fileUrl)) {
                                                                                await launch(fileUrl);
                                                                              } else {
                                                                                OpenFile.open(
                                                                                    fileUrl);
                                                                                //throw 'Could not launch $fileUrl';
                                                                              }
                                                                              /*OpenFile.open(
                                                                  remoteFile
                                                                      .studentfilesFilepath);*/
                                                                            },
                                                                            child: Column(
                                                                              crossAxisAlignment:
                                                                              CrossAxisAlignment
                                                                                  .start,
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: 5,
                                                                                ),

                                                                                Row(
                                                                                  mainAxisSize:
                                                                                  MainAxisSize
                                                                                      .min,
                                                                                  children: [
                                                                                    Icon(Icons.check,
                                                                                        color: AppTheme
                                                                                            .instituteTextColor),
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        remoteFile
                                                                                            .studentfilesFilename,
                                                                                        style: subTitleStyle
                                                                                            .copyWith(
                                                                                            color:
                                                                                            AppTheme.instituteTextColor),
                                                                                        overflow:
                                                                                        TextOverflow
                                                                                            .ellipsis,
                                                                                        softWrap:
                                                                                        true,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),

                                                                              ],
                                                                            ),
                                                                          );
                                                                        }),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                AppWidgetHelper.divider(),
                                                              ],
                                                            );
                                                          }),
                                                    ],
                                                  );
                                                }),
                                          ),

                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: BorderSide(
                                              color:
                                                  AppTheme.checkBoxCheckedColor,
                                              width: 1.0,
                                              style: BorderStyle.solid)),
                                      minWidth: 155,
                                      height: 48,
                                      child: Text(
                                        "Back to Steps",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: AppTheme.checkBoxCheckedColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        /* .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*/
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      minWidth: 155,
                                      height: 50,
                                      color: AppTheme.checkBoxCheckedColor,
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.8),
                                      ),
                                      onPressed: () {
                                        submitBloc.add(SubmitApplication(
                                            stdId: widget.studentId,
                                            instId: widget.instId));
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: sizeConfig.screenHeight * 0.15),
                            child: Container(
                              height: 240,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          preview.details.institutesCoverurl))),
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
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: sizeConfig.screenHeight * 0.27,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: sizeConfig.screenWidth * 0.12),
                                child: Text(
                                  'International University Malaya Wales (IUMW) ',
                                  style: GoogleFonts.workSans(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
              }
            }),
      ),
    );
  }

  String getFundingName(String selected) {
    String name = '';
    if (stepOneDto.fund.fundingId == selected) {
      name = stepOneDto.fund.fundingName;
    }
    return name;
  }
}

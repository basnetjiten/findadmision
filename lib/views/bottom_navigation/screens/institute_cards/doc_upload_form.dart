import 'package:file_picker/file_picker.dart';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/institutes/doc_fetch/doc_fetch_bloc.dart';
import 'package:findadmissionaffiliate/bloc/institutes/doc_upload/doc_upload_bloc.dart';
import 'package:findadmissionaffiliate/dto/stepper_btn_cmd.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/models/institute/load_data_res.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';
LoadFileDataRes fileDataRes;
class DocUploadFormFour extends StatefulWidget {
  final String instId, stdId;
  final ValueChanged<StepperCommand> onFormFilled;
  final double adjustableHeight;

  DocUploadFormFour(
      {this.instId, this.stdId, this.adjustableHeight, this.onFormFilled});

  @override
  _DocUploadFormFourState createState() => _DocUploadFormFourState();
}

class _DocUploadFormFourState extends State<DocUploadFormFour> {
  String _extension;
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";
  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  final TextStyle subTitleStyle = GoogleFonts.workSans(
      textStyle:
          AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400));
  StepperCommand stepperCommand =
      StepperCommand(pageIndex: 3, cancelOrContinue: false);

  DocUploadBloc docUploadBloc;
  DocFetchBloc neededDocFetchBloc;


  @override
  void initState() {

    docUploadBloc = DocUploadBloc();
    neededDocFetchBloc = DocFetchBloc();
    neededDocFetchBloc
        .add(FetchDoc(stdId: widget.stdId, instId: widget.instId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DocFetchBloc, DocFetchState>(
      cubit: neededDocFetchBloc,
      listener: (context, state) {
        if (state is DocFetching) {
          // LoadingDialog.show(context);
          return Center(child: CircularProgressIndicator());
        }
        if (state is ReFetched) {
          //LoadingDialog.hide(context);
          if (state.fileDataRes.applied) {
            stepperCommand.cancelOrContinue = true;
            widget.onFormFilled(stepperCommand);
          } else {
            //LoadingDialog.hide(context);
            AppWidgetHelper.showSnackBar(
                "Please upload all the Required files", context);

            //fileDataRes = state.fileDataRes;
            return buildDocUploadContainer(context);
          }
          /* setState(() {
          neededDocFetchBloc.add(
              FetchDoc(
                  stdId:
                  widget.stdId,
                  instId: widget
                      .instId));
        });*/
        }
      },
      child: BlocBuilder<DocFetchBloc, DocFetchState>(
        cubit: neededDocFetchBloc,
        // ignore: missing_return
        builder: (context, state) {
          if (state is DocFetching) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DocFetched) {
            print("FETCHED");
            fileDataRes = state.fileDataRes;
            return buildDocUploadContainer(context);
          }

          if (state is DocFetchError) {
            return Container(
                height: 20, width: 100, child: Text("Error Go Back!"));
          }
        },
      ),
    );
  }

  Container buildDocUploadContainer(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Container(
                //color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: widget.adjustableHeight ??
                          sizeConfig.screenHeight * 0.2,
                    ),
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
                                folder.documentfoldersReqfiles.isNotEmpty
                                    ? folder.documentfoldersRequired == "*"
                                        ? Container(
                                            height: 25,
                                            //width: 100,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .errorColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 2),
                                              child: Text(
                                                "COMPULSORY",
                                                style: titleStyle.copyWith(
                                                    fontSize: 14.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        : SizedBox()
                                    : SizedBox(),
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
                                                              IconButton(
                                                                icon: Icon(
                                                                    CupertinoIcons
                                                                        .delete,
                                                                    color: AppTheme
                                                                        .errorColor),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (subFolder
                                                                        .filesx
                                                                        .isNotEmpty) {
                                                                      subFolder
                                                                          .filesx
                                                                          .removeAt(
                                                                              index);
                                                                     // print(widget.stdId + "--" + widget.instId + "--" + subFolder.id);
                                                                      docUploadBloc.add(DeleteDoc(
                                                                          id: remoteFile
                                                                              .studentfilesId,
                                                                          stdId: widget
                                                                              .stdId,
                                                                          instId:
                                                                              widget.instId));
                                                                      /*   neededDocFetchBloc.add(
                                                                                FetchDoc(
                                                                                    stdId:
                                                                                    widget.stdId,
                                                                                    instId: widget
                                                                                        .instId));*/
                                                                    }
                                                                    /*else {
                                                                            userFileList.removeWhere((element) =>
                                                                                element.studentfilesDoc ==
                                                                                subFolder.id);
                                                                          }*/
                                                                  });
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            color: Color(0xffECECEC),
                                            minWidth: 300,
                                            height: 50,
                                            textColor: Colors.white,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.file_upload,
                                                  color: AppTheme
                                                      .checkBoxCheckedColor,
                                                ),
                                                Text(
                                                  "Upload",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: AppTheme
                                                          .checkBoxCheckedColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            onPressed: () async {
                                              FilePickerResult result =
                                                  await FilePicker.platform
                                                      .pickFiles(
                                                allowMultiple: false,
                                                type: FileType.custom,
                                                allowedExtensions: [
                                                  'jpg',
                                                  'pdf'
                                                ],
                                              );

                                              if (result != null) {
                                                PlatformFile file =
                                                    result.files.first;
                                                /* print(file.name);
                                                      print(file.bytes);
                                                      print(file.size);
                                                      print(file.extension);
                                                      print(file.path);*/
                                                setState(() {
                                                  Filesx uploadedFile = Filesx(
                                                      studentfilesDoc:
                                                          subFolder.id,
                                                      studentfilesFilename:
                                                          file.name,
                                                      studentfilesFilepath:
                                                          file.path);
                                                  // if (subFolder.filesx.isNotEmpty) {
                                                  subFolder.filesx.insert(0, uploadedFile);
                                                  //}
                                                });
                                                File fileToUpload = File(
                                                    result.files.single.path);

                                                if (subFolder.id == "other") {
                                                  docUploadBloc.add(
                                                      UploadOtherDoc(
                                                          fileToUpload:
                                                              fileToUpload,
                                                          fileName: file.name,
                                                          stdId: widget.stdId,
                                                          instId: widget.instId,
                                                          docId: subFolder.id));
                                                } else {
                                                  docUploadBloc.add(UploadDoc(
                                                      fileToUpload:
                                                          fileToUpload,
                                                      fileName: file.name,
                                                      stdId: widget.stdId,
                                                      instId: widget.instId,
                                                      docId: subFolder.id));
                                                }
                                              } else {
                                                // User canceled the picker
                                              }
                                            },
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
                    Text("Want to upload multiple documents in one file ?",
                        style: AppTheme.instituteStyle.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 16.0)),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: fileDataRes.singlefolders.length,
                            // ignore: missing_return
                            itemBuilder: (context, index) {
                              final singleFile =
                                  fileDataRes.singlefolders[index];
                              return InkWell(
                                onTap: () async {
                                  final singleFileUrl =
                                      singleFile.studentfilesFilepath;
                                  print(singleFile.studentfilesFilepath);
                                  if (await canLaunch(singleFileUrl)) {
                                    await launch(singleFileUrl);
                                  } else {
                                    OpenFile.open(singleFileUrl);
                                    //throw 'Could not launch $fileUrl';
                                  }
                                  /*OpenFile.open(
                                                                  remoteFile
                                                                      .studentfilesFilepath);*/
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.check,
                                            color: AppTheme.instituteTextColor),
                                        Flexible(
                                          child: Text(
                                            singleFile.studentfilesFilename,
                                            style: subTitleStyle.copyWith(
                                                color: AppTheme
                                                    .instituteTextColor),
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(CupertinoIcons.delete,
                                              color: AppTheme.errorColor),
                                          onPressed: () {
                                            setState(() {
                                              if (fileDataRes
                                                  .singlefolders.isNotEmpty) {
                                                fileDataRes.singlefolders
                                                    .removeAt(index);
                                                print(widget.stdId +
                                                    "--" +
                                                    widget.instId +
                                                    "--" +
                                                    singleFile.studentfilesId);
                                                docUploadBloc.add(DeleteDoc(
                                                    id: singleFile
                                                        .studentfilesId,
                                                    stdId: widget.stdId,
                                                    instId: widget.instId));
                                                /*   neededDocFetchBloc.add(
                                                                                FetchDoc(
                                                                                    stdId:
                                                                                    widget.stdId,
                                                                                    instId: widget
                                                                                        .instId));*/
                                              }
                                              /*else {
                                                                            userFileList.removeWhere((element) =>
                                                                                element.studentfilesDoc ==
                                                                                subFolder.id);
                                                                          }*/
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: Color(0xffECECEC),
                          minWidth: 300,
                          height: 50,
                          textColor: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_upload,
                                color: AppTheme.checkBoxCheckedColor,
                              ),
                              Text(
                                "Upload",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: AppTheme.checkBoxCheckedColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onPressed: () async {
                            FilePickerResult result =
                                await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              type: FileType.custom,
                              allowedExtensions: ['jpg', 'pdf'],
                            );
                            if (result != null) {
                              PlatformFile file = result.files.first;
                              /* print(file.name);
                                                      print(file.bytes);
                                                      print(file.size);
                                                      print(file.extension);
                                                      print(file.path);*/

                              File fileToUpload =
                                  File(result.files.single.path);
                              docUploadBloc.add(UploadSingleDoc(
                                  fileToUpload: fileToUpload,
                                  fileName: file.name,
                                  stdId: widget.stdId,
                                  instId: widget.instId,
                                  docId: "single"));
                            } else {
                              // User canceled the picker
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                  color: AppTheme.instituteTextColor,
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          minWidth: 155,
                          height: 48,
                          textColor: Colors.white,
                          child: Text(
                            "BACK",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: AppTheme.instituteTextColor,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8),
                          ),
                          onPressed: () {
                            stepperCommand.cancelOrContinue = false;
                            widget.onFormFilled(stepperCommand);
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
                          color: AppTheme.instituteTextColor,
                          child: Text(
                            "Next",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8),
                          ),
                          onPressed: () {
                            // LoadingDialog.show(context);
                            neededDocFetchBloc.add(ReFetchDoc(
                                stdId: widget.stdId, instId: widget.instId));
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
            )));
  }
}

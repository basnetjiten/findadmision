import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/institutes/work_exp/work_exp_bloc.dart';
import 'package:findadmissionaffiliate/dto/institutes/apply/work_exp_dto.dart';
import 'package:findadmissionaffiliate/dto/stepper_btn_cmd.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/work_exp_form.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkExperienceForm extends StatefulWidget {
  final String stdId;
  final ValueChanged<StepperCommand> onFormFilled;
  final double adjustableHeight;

  WorkExperienceForm({this.stdId, this.adjustableHeight, this.onFormFilled});

  @override
  _WorkExperienceFormState createState() => _WorkExperienceFormState();
}

class _WorkExperienceFormState extends State<WorkExperienceForm> {
  WorkExpBloc workExpBloc;
  WorkExpDto workExpDto;
  List<CreateWorkExperienceForm> workExpForm = [];
  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  final TextStyle subTitleStyle = GoogleFonts.workSans(
      textStyle:
          AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400));
  StepperCommand stepperCommand =
      StepperCommand(pageIndex: 2, cancelOrContinue: false);

  @override
  void initState() {

    workExpBloc = WorkExpBloc();
    if (workExpSubmittedRes != null) {
      print("SECOR LENGTH" + workExpSubmittedRes.secor.length.toString());
      workExpSubmittedRes.secor.forEach((apiWorkExp) {
      final  localApiWorkExpDto = WorkExpDto();
        localApiWorkExpDto.studentId = apiWorkExp.workexpMember;
        localApiWorkExpDto.id = apiWorkExp.workexpId;
        localApiWorkExpDto.companyname = apiWorkExp.workexpCompany;
        localApiWorkExpDto.position = apiWorkExp.workexpPosition;
        localApiWorkExpDto.toy = int.parse(apiWorkExp.workexpTo);
        localApiWorkExpDto.fromy = int.parse(apiWorkExp.workexpFrom);
        workExpForm.add(CreateWorkExperienceForm(
          apiWorkExp: true,
          workExpDtoForm: localApiWorkExpDto,
          onDelete: () => onDelete(localApiWorkExpDto),
        ));
      });
    } else {
      workExpDto = WorkExpDto();
      workExpForm.add(CreateWorkExperienceForm(
        workExpDtoForm: workExpDto,
        onDelete: () => onDelete(workExpDto),
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return workExpSubmittedRes == null
        ? Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: workExpForm.length == 1
                    ? BlocListener<WorkExpBloc, WorkExpState>(
                        cubit: workExpBloc,
                        listener: (context, state) {
                          if (state is WorkExpSubmitted) {
                            if (state.workExpRes.status == "success") {
                              stepperCommand.cancelOrContinue = true;
                              widget.onFormFilled(stepperCommand);
                            }
                          }
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: widget.adjustableHeight ??
                                  sizeConfig.screenHeight * 0.2,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Work Experience",
                                  //style: widget.titleStyle,
                                ),
                                Text(
                                  "(Optional)",
                                  // style: widget.titleStyle,
                                ),
                                /*IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        workExpForm.removeAt(0);
                                      });
                                    })*/
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            workExpForm[0],
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      workExpForm.add(CreateWorkExperienceForm(
                                        workExpDtoForm: workExpDto,
                                        onDelete: () =>onDelete(workExpDto),
                                      ));
                                    });
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: AppTheme.checkBoxCheckedColor),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: AppTheme.checkBoxCheckedColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  "Add Work Experience",
                                  style: titleStyle.copyWith(
                                      color: AppTheme.checkBoxCheckedColor),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
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
                                    "CANCEL",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: AppTheme.instituteTextColor,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8),
                                  ),
                                  onPressed: () {
                                    //Navigator.of(context).pop();
                                    widget.onFormFilled(stepperCommand);
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
                                      final form = workExpForm[0]
                                          .state
                                          .stepThreeFormKey
                                          .currentState;
                                      if (form.saveAndValidate()) {
                                        workExpDto = WorkExpDto();
                                        workExpDto.companyname = form
                                            .fields['company']
                                            .currentState
                                            .value;
                                        workExpDto.fromy =
                                            workExpForm[0].state.yearFrom;
                                        workExpDto.toy =
                                            workExpForm[0].state.yearTo;
                                        workExpDto.position = form
                                            .fields['position']
                                            .currentState
                                            .value;

                                        workExpBloc.add(SaveWorkExperience(
                                            stdId: widget.stdId,
                                            workExpDto: workExpDto));
                                      }
                                    }),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      )
                    : BlocListener<WorkExpBloc, WorkExpState>(
                        cubit: workExpBloc,
                        listener: (context, state) {
                          if (state is WorkExpSubmitted) {
                            if (state.workExpRes.status == "success") {
                              stepperCommand.cancelOrContinue = true;
                              widget.onFormFilled(stepperCommand);
                            }
                          }
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: widget.adjustableHeight ??
                                  sizeConfig.screenHeight * 0.2,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Work Experience",
                                  //style: widget.titleStyle,
                                ),
                                Text(
                                  "(Optional)",
                                  // style: widget.titleStyle,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ...workExpForm.map((e) => e).toList(),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      workExpForm.add(CreateWorkExperienceForm(
                                        workExpDtoForm: workExpDto,
                                        onDelete: () => onDelete,
                                      ));
                                    });
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: AppTheme.checkBoxCheckedColor),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: AppTheme.checkBoxCheckedColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  "Add Work Experience",
                                  style: titleStyle.copyWith(
                                      color: AppTheme.checkBoxCheckedColor),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
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
                                      "CANCEL",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: AppTheme.instituteTextColor,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.8),
                                    ),
                                    onPressed: () {
                                      //Navigator.of(context).pop();
                                      widget.onFormFilled(stepperCommand);
                                      /* .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*/
                                    }),
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
                                      /*stepperCommand.cancelOrContinue = true;
                                      widget.onFormFilled(stepperCommand);*/

                                      workExpForm.forEach((expForm) {
                                        final form = expForm.state
                                            .stepThreeFormKey.currentState;
                                        var workExpDto = WorkExpDto();
                                        final workExpForm = expForm.state
                                            .stepThreeFormKey.currentState;
                                        if (workExpForm.saveAndValidate()) {
                                          workExpDto.companyname = form
                                              .fields['company']
                                              .currentState
                                              .value;
                                          workExpDto.position = form
                                              .fields['position']
                                              .currentState
                                              .value;
                                          workExpDto.fromy =
                                              expForm.state.yearFrom;
                                          workExpDto.toy = expForm.state.yearTo;
                                          print("GETTING FORM DATA" +
                                              workExpDto.toJson().toString());
                                          workExpBloc.add(SaveWorkExperience(
                                              stdId: widget.stdId,
                                              workExpDto: workExpDto));
                                        }
                                      });
                                    })
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
              ),
            ))
        : BlocListener<WorkExpBloc, WorkExpState>(
            cubit: workExpBloc,
            listener: (context, state) {
              if (state is WorkExpSubmitted) {
                if (state.workExpRes.status == "success") {
                  stepperCommand.cancelOrContinue = true;
                  widget.onFormFilled(stepperCommand);
                }
              }
            },
            child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: widget.adjustableHeight ??
                              sizeConfig.screenHeight * 0.2,
                        ),
                        Row(
                          children: [
                            Text(
                              "Work Experience",
                              //style: widget.titleStyle,
                            ),
                            Text(
                              "(Optional)",
                              // style: widget.titleStyle,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ...workExpForm.map((e) => e).toList(),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  workExpForm.add(CreateWorkExperienceForm(
                                    workExpDtoForm: workExpDto,
                                    onDelete: () => onDelete,
                                  ));
                                });
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: AppTheme.checkBoxCheckedColor),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: AppTheme.checkBoxCheckedColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              "Add Work Experience",
                              style: titleStyle.copyWith(
                                  color: AppTheme.checkBoxCheckedColor),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
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
                                  "CANCEL",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppTheme.instituteTextColor,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.8),
                                ),
                                onPressed: () {
                                  //Navigator.of(context).pop();
                                  widget.onFormFilled(stepperCommand);
                                  /* .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*/
                                }),
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
                                  workExpForm.forEach((expForm) {
                                    final form = expForm
                                        .state.stepThreeFormKey.currentState;
                                    var workExpDto = WorkExpDto();
                                    final workExpForm = expForm
                                        .state.stepThreeFormKey.currentState;
                                    if (workExpForm.saveAndValidate()) {
                                      workExpDto.companyname = form
                                          .fields['company'].currentState.value;
                                      workExpDto.position = form
                                          .fields['position']
                                          .currentState
                                          .value;
                                      workExpDto.fromy = expForm.state.yearFrom;
                                      workExpDto.toy = expForm.state.yearTo;
                                      print("GETTING FORM DATA" +
                                          workExpDto.toJson().toString());
                                      workExpBloc.add(SaveWorkExperience(
                                          stdId: widget.stdId,
                                          workExpDto: workExpDto));
                                    }
                                  });
                                })
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                )),
          );
  }

  Container buildDropDownContainer(Widget dropDown) {
    return Container(
      height: 50,
      width: 85,
      decoration: BoxDecoration(
          //color: Color(0xff212F3F),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: AppTheme.btnBorderColor)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: dropDown,
      ),
    );
  }

  onDelete(workExpDto) {
    if(workExpDto!=null) {
      setState(() {
        print("hellooo");
        workExpForm.forEach((element) {
          print(
              element.workExpDtoForm.id.toString() == workExpDto.id.toString());
        });

        var find = workExpForm.firstWhere(
              (it) => it.workExpDtoForm.id == workExpDto.id,
          orElse: () => null,
        );
        print((find != null).toString());
        if (find != null) workExpForm.removeAt(workExpForm.indexOf(find));
      });
    }else{
      setState(() {
        workExpForm.removeAt(0);
      });
    }
  }

/*  onDelete() {
    setState(() {
      workExpForm.removeAt(0);
    });
  }*/
}

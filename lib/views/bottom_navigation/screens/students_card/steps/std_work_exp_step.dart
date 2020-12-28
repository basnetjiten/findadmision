import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/institutes/work_exp/work_exp_bloc.dart';
import 'package:findadmissionaffiliate/dto/institutes/apply/work_exp_dto.dart';
import 'package:findadmissionaffiliate/dto/stepper_btn_cmd.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/partials/work_exp_form.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StdWorkExperienceForm extends StatefulWidget {
  final String stdId;
  final ValueChanged<StepperCommand> onFormFilled;
  final double adjustableHeight;

  StdWorkExperienceForm({this.stdId, this.adjustableHeight, this.onFormFilled});

  @override
  _StdWorkExperienceFormState createState() => _StdWorkExperienceFormState();
}

class _StdWorkExperienceFormState extends State<StdWorkExperienceForm> {
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
    workExpDto = WorkExpDto();
    workExpBloc = WorkExpBloc();
    if (workExpSubmittedRes != null) {
      print("SECOR LENGTH" + workExpSubmittedRes.secor.length.toString());
      workExpSubmittedRes.secor.forEach((apiWorkExp) {
        workExpDto = WorkExpDto();
        workExpDto.studentId = apiWorkExp.workexpMember;
        workExpDto.id = apiWorkExp.workexpId;
        workExpDto.companyname = apiWorkExp.workexpCompany;
        workExpDto.position = apiWorkExp.workexpPosition;
        workExpDto.toy = int.parse(apiWorkExp.workexpTo);
        workExpDto.fromy = int.parse(apiWorkExp.workexpFrom);
        workExpForm.add(CreateWorkExperienceForm(
          apiWorkExp: true,
          workExpDtoForm: workExpDto,
          onDelete: deleteWorkExp(workExpDto),
        ));
      });
    } else {
      workExpForm.add(CreateWorkExperienceForm(
        workExpDtoForm: workExpDto,
        onDelete: onDelete,
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
                ? Column(
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
                            onDelete: onDelete,
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
                Column(
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                              width: 0.5, color: AppTheme.btnBorderColor)),
                      // color: Colors.white,
                      minWidth: 340,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {

                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppTheme.instituteTextColor,
                      minWidth: 340,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Save and Next",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {

                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            )
                : Column(
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
                Column(
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                              width: 0.5, color: AppTheme.btnBorderColor)),
                      // color: Colors.white,
                      minWidth: 340,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {

                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppTheme.instituteTextColor,
                      minWidth: 340,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Save and Next",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {

                      },
                    ),
                  ],
                ),
               /* Row(
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
                          *//* .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*//*
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
                          stepperCommand.cancelOrContinue = true;
                          widget.onFormFilled(stepperCommand);

                          workExpForm.forEach((expForm) {
                            final form = expForm
                                .state.stepThreeFormKey.currentState;
                            var workExpDto = WorkExpDto();
                            final workExpForm = expForm
                                .state.stepThreeFormKey.currentState;
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
                ),*/
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ))
        : Container(
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
                Column(
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                              width: 0.5, color: AppTheme.btnBorderColor)),
                      // color: Colors.white,
                      minWidth: 340,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {

                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: AppTheme.instituteTextColor,
                      minWidth: 340,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Save and Next",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {

                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ));
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

  deleteWorkExp(workExpDto) {
    setState(() {
      var find = workExpForm.firstWhere(
            (it) => it.workExpDtoForm == workExpDto,
        orElse: () => null,
      );
      if (find != null) workExpForm.removeAt(workExpForm.indexOf(find));
    });
  }

  onDelete() {
    setState(() {
      workExpForm.removeAt(0);
    });

  }
}

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/institute_cards/dropdowns/years.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:findadmissionaffiliate/dto/institutes/apply/work_exp_dto.dart';

typedef OnDelete();

class CreateWorkExperienceForm extends StatefulWidget {
  final state = _CreateWorkExperienceFormState();
  final OnDelete onDelete;
  final  WorkExpDto workExpDtoForm;
  final bool apiWorkExp;

  CreateWorkExperienceForm({this.apiWorkExp,Key key, this.onDelete,this.workExpDtoForm}) : super(key: key);

  @override
  _CreateWorkExperienceFormState createState() => state;
}

class _CreateWorkExperienceFormState extends State<CreateWorkExperienceForm> {
  final GlobalKey<FormBuilderState> stepThreeFormKey =
      GlobalKey<FormBuilderState>();
  int yearTo;
  int yearFrom;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: stepThreeFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Text(
                "Name of organization / company",
                style: AppTheme.studentLabelStyle,
              ),
             IconButton(icon:Icon(Icons.delete),onPressed:(){
                setState(() {
                  widget.onDelete();
                });
              })
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            //height: 50,
            child: FormBuilderTextField(
              initialValue: widget.workExpDtoForm.companyname!=null ? widget.workExpDtoForm.companyname : "",
              autofocus: false,
              autovalidateMode: AutovalidateMode.disabled,
              attribute: "company",
              autocorrect: false,
              validators: [FormBuilderValidators.required()],
              decoration: AppWidgetHelper.buildInputDecoration(),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),


          Text(
            "Position",
            style: AppTheme.studentLabelStyle,
          ),
          SizedBox(height: 10,),
          Container(
           // height: 125,
            child: FormBuilderTextField(
              initialValue: widget.workExpDtoForm.position!=null ? widget.workExpDtoForm.position : "",
              autofocus: false,
              autovalidateMode: AutovalidateMode.disabled,
              attribute: "position",
              autocorrect: false,
              validators: [FormBuilderValidators.required()],
              decoration: AppWidgetHelper.buildInputDecoration(),
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
          ),
         SizedBox(height: 20,),
          /*  Text(
            "Job description",
            style: AppTheme.studentLabelStyle,
          ),

          SizedBox(height: 10,),
          Container(
            //height: 125,
            child: FormBuilderTextField(
              initialValue: widget.workExpDtoForm!=null ? widget.workExpDtoForm.position : "",,
              autofocus: false,
              autovalidateMode: AutovalidateMode.disabled,
              attribute: "description",
              autocorrect: false,
              validators: [FormBuilderValidators.required()],
              decoration:AppWidgetHelper.buildInputDecoration(),
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Date From",
                    style: AppTheme.studentLabelStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: sizeConfig.screenWidth / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WorkExpYearDroDown(
                        fromY:widget.workExpDtoForm.fromy,
                        onYearChange: onFromYearChange,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Date To",
                    style: AppTheme.studentLabelStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: sizeConfig.screenWidth / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WorkExpYearDroDown(
                        fromY:widget.workExpDtoForm.toy,
                        onYearChange: onToYearChange,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          AppWidgetHelper.divider(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void onFromYearChange(int value) {
    setState(() {
      yearFrom = value;
    });
  }

  void onToYearChange(int value) {
    setState(() {
      yearTo = value;
    });
  }
}

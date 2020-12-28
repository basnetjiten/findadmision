import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../application_step_one.dart';

class FriendFamilyForm extends StatefulWidget {
  final dynamic formDto;
  FriendFamilyForm({this.formDto});
  @override
  _FriendFamilyFormState createState() => _FriendFamilyFormState();
}

class _FriendFamilyFormState extends State<FriendFamilyForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("- Family or Friends information",
          style: AppTheme.studentLabelStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: AppTheme.cardTitleTxtColor)),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "First Name",
                style: AppTheme.studentLabelStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 150,
                child: FormBuilderTextField(
                  initialValue: widget.formDto.sponcorfname != null
                      ? widget.formDto.sponcorfname
                      : '',
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.disabled,
                  attribute: "fname",
                  autocorrect: false,
                  validators: [FormBuilderValidators.required(errorText: '')],
                  decoration: AppWidgetHelper.buildNoErrorInputDecoration(),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "Last Name",
                style: AppTheme.studentLabelStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 150,
                child: FormBuilderTextField(

                  initialValue: widget.formDto.sponcorlname != null
                      ? widget.formDto.sponcorlname
                      : '',
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.disabled,
                  attribute: "lname",
                  autocorrect: false,
                  validators: [FormBuilderValidators.required(errorText: '')],
                  decoration: AppWidgetHelper.buildNoErrorInputDecoration(),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "Phone Number",
        style: AppTheme.studentLabelStyle,
      ),
      SizedBox(
        height: 10,
      ),
            Container(
              height: 50,
              width: sizeConfig.screenWidth,
        child: FormBuilderTextField(
          initialValue: widget.formDto.sponcortelephone != null
              ? widget.formDto.sponcortelephone
              : '',
          autofocus: false,
          autovalidateMode: AutovalidateMode.disabled,
          attribute: "phone",
          autocorrect: false,
          validators: [FormBuilderValidators.required(errorText: '')],
          decoration: AppWidgetHelper.buildNoErrorInputDecoration(),
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.black,

        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "Email",
        style: AppTheme.studentLabelStyle,
      ),
      SizedBox(
        height: 10,
      ),
            Container(
              height: 50,
              width: sizeConfig.screenWidth,
        child: FormBuilderTextField(
          initialValue: widget.formDto.sponcoremail != null
              ? widget.formDto.sponcoremail
              : '',
          autofocus: false,
          autovalidateMode: AutovalidateMode.disabled,
          attribute: "email",
          autocorrect: false,
          validators: [FormBuilderValidators.required(errorText: ''),FormBuilderValidators.email(errorText: '')],
          decoration: AppWidgetHelper.buildNoErrorInputDecoration(),
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.black,
        ),
      ),
    ]
    ,
    );
  }
}

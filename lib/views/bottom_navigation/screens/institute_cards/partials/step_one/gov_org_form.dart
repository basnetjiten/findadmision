import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class GovOrgRadioForm extends StatefulWidget {
  @override
  _GovOrgRadioFormState createState() => _GovOrgRadioFormState();
}

class _GovOrgRadioFormState extends State<GovOrgRadioForm> {
  String govFunding = "yes";
  String evidenceOfFunding = "no";

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 200,
      // width: 500,
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.grey,
          //disabledColor: Colors.blue
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("- Detail information",
                style: AppTheme.studentLabelStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.cardTitleTxtColor)),
            SizedBox(
              height: 15,
            ),
            Text(
              "Have you applied for government funding?",
              style: AppTheme.studentLabelStyle,
            ),
            Container(
              height: 50,
              width: 200,
              child: FormBuilderRadioGroup(
                decoration: InputDecoration.collapsed(hintText: ""),
                options: [
                  FormBuilderFieldOption(
                    value: "yes",
                    child: Text("Yes", style: AppTheme.studentLabelStyle),
                  ),
                  FormBuilderFieldOption(
                    value: "no",
                    child: Text("No", style: AppTheme.studentLabelStyle),
                  )
                ],
                attribute: "govtfundapplied",
                activeColor: AppTheme.checkBoxCheckedColor,
                focusColor: Colors.grey,
                initialValue: "yes",
                onChanged: (value) {
                  /* setState(() {
                    govFunding = "yes";
                  });*/
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Are you able to provide evidence of your government funding?",
              style: AppTheme.studentLabelStyle,
            ),
            Container(
              height: 50,
              width: 200,
              child: FormBuilderRadioGroup(
                decoration: InputDecoration.collapsed(hintText: ""),
                options: [
                  FormBuilderFieldOption(
                    value: "yes",
                    child: Text("Yes", style: AppTheme.studentLabelStyle),
                  ),
                  FormBuilderFieldOption(
                    value: "no",
                    child: Text("No", style: AppTheme.studentLabelStyle),
                  )
                ],
                attribute: "govtfundev",
                activeColor: AppTheme.checkBoxCheckedColor,
                focusColor: Colors.grey,
                initialValue: "no",
                onChanged: (value) {
                  /* setState(() {
                        govFunding = "yes";
                      });*/
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

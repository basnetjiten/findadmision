import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileLastStepPreview extends StatefulWidget {
  final ValueChanged<int> onSubmitted;
  final ValueChanged<int> backToCheck;
  const ProfileLastStepPreview({
    Key key,
    this.onSubmitted,this.backToCheck
  }) : super(key: key);

  @override
  _ProfileLastStepPreviewState createState() => _ProfileLastStepPreviewState();
}

class _ProfileLastStepPreviewState extends State<ProfileLastStepPreview> {

  @override
  Widget build(BuildContext context) {

    return Container(

      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text("Review",style: AppTheme.studentLabelStyle
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w700)),
              SizedBox(
                height: 15,
              ),
              Text("Submit student’s profile to let findadmission to review.",
              style:  AppTheme.studentLabelStyle
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w400),),
              SizedBox(
                height: 30,
              ),

              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: AppTheme.checkBoxCheckedColor)
                ),
                minWidth: 340,
                height: 50,
                textColor: AppTheme.checkBoxCheckedColor,
                child: Text(
                  "Back and Check",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: AppTheme.checkBoxCheckedColor,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  widget.backToCheck(1);
                },
              ),
              SizedBox(height: 10,),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: AppTheme.checkBoxCheckedColor,
                minWidth: 340,
                height: 50,
                textColor: Colors.white,
                child: Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  widget.onSubmitted(1);
                },
              ),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewSuccess extends StatelessWidget {
  const ReviewSuccess({
    Key key,
  }) : super(key: key);

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
              Text("Success!",
                style:  AppTheme.studentLabelStyle
                    .copyWith(color:Colors.black,fontSize: 14, fontWeight: FontWeight.w400),),
              SizedBox(
                height: 15,
              ),

              Text("The application is under review. We will contact you and the student later.",
                style:  AppTheme.studentLabelStyle
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w400),),
              SizedBox(
                height: 30,
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
                  "Back to Student's Details",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
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

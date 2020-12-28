import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdmissionProgressDialog extends StatefulWidget {
  final String message;
  final Color bgColor;

  AdmissionProgressDialog(this.message,[this.bgColor]);

  @override
  _AdmissionProgressDialogState createState() => _AdmissionProgressDialogState();
}

class _AdmissionProgressDialogState extends State<AdmissionProgressDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      backgroundColor:widget.bgColor==null ? AppTheme.darkGreyBGColour :widget.bgColor,
      content: Container(
        height: 40,
        width: 60,
        child: Row(
          children: <Widget>[
            SizedBox(width: 20,),
            CircularProgressIndicator(valueColor:  AlwaysStoppedAnimation<Color>(AppTheme.instituteTextColor)),
            SizedBox(
              width: 30,
            ),
            Text(
              widget.message ?? 'Loggin in...',
              style: TextStyle(fontSize: 16.0,color: widget.bgColor==null ? Colors.white:AppTheme.cardTitleTxtColor),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:findadmissionaffiliate/views/login/reset_pw.dart';
import 'package:findadmissionaffiliate/views/signup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  final BuildContext parentContext;

  LoginFooter({this.parentContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: RichText(
                text: new TextSpan(children: [
              TextSpan(
                text: 'Forgotten your password ?',
                style: TextStyle(
                    fontFamily: 'MyRaidPro',
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => PasswordReset()));
                  },
              ),
            ])),
          ),
          SizedBox(
            height: 18,
          ),
          Divider(
            thickness: 1.2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Become a member, don\'t miss any opportunities.",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(
                    color: Colors.white, width: 1.0, style: BorderStyle.solid)),
            minWidth: 330,
            height: 50,
            textColor: Colors.white,
            child: Text(
              "Get Started",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => SignUpPage()));
            },
          ),
        ],
      ),
    );
  }
}

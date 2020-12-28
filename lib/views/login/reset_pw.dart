import 'package:findadmissionaffiliate/bloc/reset_pass_bloc/reset_password_bloc.dart';
import 'package:findadmissionaffiliate/constants/routing_constants.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/views/login/login.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  ResetPasswordBloc _resetPasswordBloc;

  @override
  void initState() {
    _resetPasswordBloc = ResetPasswordBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      cubit: _resetPasswordBloc,
      listener: (context, state) {
        if (state is ResetPasswordInitial) {
          AppWidgetHelper.showLoginDialog(context,"Requesting...");
        } else if (state is ResetPasswordSent) {

          print("RESENT");
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.of(context).pushNamed(LoginViewRoute,
              arguments:
                  _fbKey.currentState.fields['email'].currentState.value);
        }
        else if (state is ResetPasswordUnSent) {
          Navigator.of(context, rootNavigator: true).pop();
          AppWidgetHelper.showSnackBar("This email does not exists in our record.", context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xff384555),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
          child: Container(
            // height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      //width: 295.0,
                      // height: 60.0,
                      child: Text(
                        "Enter the email address you use to sign in and we\'ll send you a link to reset your password.",
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilder(
                      key: _fbKey,
                      child: FormBuilderTextField(
                        attribute: 'email',
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(errorText: 'we do not recognize that email address')
                        ],
                        decoration: AppWidgetHelper.textFieldDecoration(true),
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Color(0xff2D79AD),
                      minWidth: sizeConfig.screenWidth,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Send the New Password",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      onPressed: () {
                        if (_fbKey.currentState.saveAndValidate()) {
                          final email = _fbKey
                              .currentState.fields['email'].currentState.value;
                          _resetPasswordBloc
                              .add(ResetPasswordBtnPressed(email: email));
                        }
                      },
                    ),
                  ],
                ),
                Positioned(
                  top: -15,
                  left: -16,
                  right: 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 24.0,
                          child: Center(
                            child: Text(
                              "RESET YOUR PASSWORD",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String emailValidator(String value) {}
}

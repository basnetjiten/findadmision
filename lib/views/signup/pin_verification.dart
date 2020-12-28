import 'dart:async';

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/login_bloc/login_bloc.dart';
import 'package:findadmissionaffiliate/bloc/login_bloc/login_events.dart';
import 'package:findadmissionaffiliate/bloc/login_bloc/login_states.dart';
import 'package:findadmissionaffiliate/bloc/pinverification_bloc/pin_verification_bloc.dart';
import 'package:findadmissionaffiliate/constants/routing_constants.dart';
import 'package:findadmissionaffiliate/dto/loginpost.dart';
import 'package:findadmissionaffiliate/dto/signuppost.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/findadmision_dialog.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String email;

  PinCodeVerificationScreen({this.email});

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;
  bool disableButton = true;
  bool showTimer = true;
  int startValue = 60;
  TextEditingController textEditingController = TextEditingController();
  PinVerificationBloc _pinVerificationBloc;

  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  LoginBloc _loginBloc;
  bool _autoValidate = false;

  @override
  void initState() {
    _pinVerificationBloc = PinVerificationBloc();
   // _loginBloc = LoginBloc();
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();

    Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (startValue == 0) {
        t.cancel();
        if (mounted) {
          setState(() {
            disableButton = false;
            showTimer = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            startValue--;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    //textEditingController.dispose();
    //errorController.close();
    //_pinVerificationBloc.close();
    //_loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PinVerificationBloc, PinVerificationState>(
          cubit: _pinVerificationBloc,
          listener: (context, state) {
            /* if (state is PinVerificationInitial) {
          showLoginDialog(context);
        }*/
            if (state is PinVerificationValid) {
              final _signUpDto = getIt<SignUpPost>();
              final _loginPost = getIt<LoginPost>();
              _loginPost.email = _signUpDto.email;
              _loginPost.password = _signUpDto.password;

              _loginBloc.add(LoginButtonPressed(
                  userLoginPost: _loginPost, uniqueCode: uniqueCode));
            } else if (state is PinVerificationInvalid) {
              textEditingController.clear();
              errorController.add(
                  ErrorAnimationType.shake); // Triggering error shake animation
              setState(() {
                hasError = false;
              });

              Navigator.of(context, rootNavigator: true).pop();
              AppWidgetHelper.showSnackBar(
                  "Please enter a valid pin", context, AppTheme.errorColor);
            } else if (state is PinResentToEmail) {
              //Navigator.of(context, rootNavigator: true).pop();
              AppWidgetHelper.showSnackBar(
                  "Please check your mail to obtain the pin",
                  context,
                  AppTheme.checkBoxCheckedColor);
            } else if (state is PinVerificationValidDoLogin) {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginViewRoute, (Route<dynamic> route) => false);
              AppWidgetHelper.showSnackBar(
                  "Your affiliate application is pending approval. You will get a notification once your "
                  "application is approved.",
                  context,
                  AppTheme.errorColor);
              /* print("NAVIGATE HERE");
          final _signUpDto = getIt<SignUpPost>();
          final _loginPost = getIt<LoginPost>();
          _loginPost.email = _signUpDto.email ?? "nepazine@gmail.com";
          _loginPost.password = _signUpDto.password ?? "fkx5au";

          _loginBloc = LoginBloc()
            ..add(LoginButtonPressed(
                userLoginPost: _loginPost,
                uniqueCode: uniqueCode ?? "wnp0bl4wflirbuuybmuq"));*/
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          cubit: _loginBloc,
          listener: (context, state) {
            print(state.toString());
            if (state is LoginSuccess) {
              Navigator.of(context, rootNavigator: true).pop();
              //named routing to dashboard route

              Navigator.pushReplacementNamed(context, DashBoardRoute,
                  arguments: state.loginResponse);
            } else if (state is LoginPendingApproval) {
              print("THIS SHOULD EXECUTE");
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginViewRoute, (Route<dynamic> route) => false);
              AppWidgetHelper.showSnackBar(
                  "Your affiliate application is pending approval. You will get a notification once your "
                  "application is approved.",
                  context,
                  AppTheme.errorColor);
            } else if (state is LoginFailed) {
              Navigator.of(context, rootNavigator: true).pop();
              print("LOGIN FAILEDd");
              AppWidgetHelper.showSnackBar(
                  "Please enter a valid combination of email and password",
                  context);
            }
          },
        )
      ],
      child: Scaffold(
          backgroundColor: AppTheme.darkGreyBGColour,
          key: scaffoldKey,
          body: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 60,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 30),
                                SizedBox(height: 8),
                                Text(
                                    "We've sent a 6-digit confirmation code to ${widget.email} It will expire in few days, so enter it soon.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                SizedBox(
                                  height: 20,
                                ),
                                Form(
                                  key: formKey,
                                  child: PinCodeTextField(
                                    autoValidate: hasError,
                                    // textInputAction:TextInputAction.done,
                                    textInputType: TextInputType.number,
                                    appContext: context,
                                    pastedTextStyle: TextStyle(
                                      color: AppTheme.checkBoxCheckedColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    length: 6,
                                    obsecureText: false,
                                    animationType: AnimationType.fade,
                                    validator: _validatePin,
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5),
                                      inactiveFillColor: Colors.transparent,
                                      inactiveColor: Colors.white,
                                      disabledColor: Colors.transparent,
                                      selectedFillColor: Colors.white,
                                      selectedColor: Colors.white,
                                      fieldHeight: 50,
                                      fieldWidth: 40,
                                      activeFillColor: hasError
                                          ? Color(0xff886069)
                                          : Colors.white,
                                    ),
                                    animationDuration:
                                        Duration(milliseconds: 300),
                                    backgroundColor: Colors.transparent,
                                    enableActiveFill: true,
                                    errorAnimationController: errorController,
                                    controller: textEditingController,
                                    onCompleted: (enteredPin) {
                                      if (formKey.currentState.validate()) {
                                        showLoginDialog(context);
                                        _pinVerificationBloc
                                            .add(PinVerificationBtnPressed(
                                          email: widget.email,
                                          pin: enteredPin,
                                        ));
                                      }
                                    },
                                    // onTap: () {
                                    //   print("Pressed");
                                    // },
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        currentText = value;
                                      });
                                    },
                                    beforeTextPaste: (text) {
                                      print("Allowing to paste $text");
                                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                      return false;
                                    },
                                  ),
                                ),
                                Text(
                                  hasError
                                      ? "The code is incorrect, please try again"
                                      : "",
                                  style: TextStyle(
                                      color: Color(0xff886069),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                IgnorePointer(
                                  ignoring: disableButton,
                                  child: MaterialButton(
                                    height: 50,
                                    minWidth: 345,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        side: BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                            style: BorderStyle.solid)),
                                    onPressed: () {
                                      // conditions for validating
                                      /*if (formKey.currentState.validate()) {*/
                                      setState(() {
                                        print(widget.email);
                                        _pinVerificationBloc.add(
                                            ResendPinVerification(
                                                email: widget.email));
                                        startValue = 30;
                                        showTimer = true;
                                        disableButton = true;
                                        Timer.periodic(Duration(seconds: 1),
                                            (Timer t) {
                                          if (startValue == 0) {
                                            t.cancel();
                                            setState(() {
                                              disableButton = false;
                                              showTimer = false;
                                            });
                                          } else {
                                            if (mounted) {
                                              setState(() {
                                                startValue--;
                                              });
                                            }
                                          }
                                        });

                                        hasError = false;
                                      });
                                    } /* else {
                                          errorController.add(ErrorAnimationType
                                              .shake); // Triggering error shake animation
                                          setState(() {
                                            hasError = true;
                                          });
                                        }*/
                                    ,
                                    child: Center(
                                        child: Text(
                                      showTimer
                                          ? startValue.toString() + " Sec"
                                          : "Resend Code",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "*Remember to check your spam folder",
                                  style: TextStyle(color: Colors.white),
                                ),

                                /* Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text("Clear"),
                                    onPressed: () {
                                      textEditingController.clear();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text("Set Text"),
                                    onPressed: () {
                                      textEditingController.text = "123456";
                                    },
                                  ),
                                ],
                              )*/
                              ],
                            ),
                          ),
                        ),
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
                                width: 50,
                              ),
                              Container(
                                //width: 190.0,
                                height: 24.0,
                                child: Center(
                                  child: Text(
                                    "CHECK YOUR EMAIL",
                                    style: TextStyle(
                                        fontSize: 20.0,
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
              ))),
    );
  }

  Future showLoginDialog(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AdmissionProgressDialog('Verifying pin');
        });
  }

  String _validatePin(String value) {
    if (value.length < 6) {
      return "Please enter 6 digit code ";
    } else {
      return null;
    }
  }
}

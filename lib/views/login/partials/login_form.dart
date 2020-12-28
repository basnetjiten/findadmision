import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:findadmissionaffiliate/bloc/login_bloc/login_bloc.dart';
import 'package:findadmissionaffiliate/bloc/login_bloc/login_events.dart';
import 'package:findadmissionaffiliate/bloc/login_bloc/login_states.dart';
import 'package:findadmissionaffiliate/bloc/notification_bloc/notification_bloc.dart';
import 'package:findadmissionaffiliate/constants/routing_constants.dart';
import 'package:findadmissionaffiliate/dto/loginpost.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/findadmision_dialog.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/views/login/reset_pw.dart';
import 'package:findadmissionaffiliate/views/signup/signup.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppCheck latestAppCheck;

class LoginForm extends StatefulWidget {
  final BuildContext parentContext;

  LoginForm({this.parentContext});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _rememberMe = false;
  bool _autoValidate = false;
  String userInputEmailAddress;
  String userInputPassword;
  Color testColor = Color(0xff212F3F);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  //login bloc for login apis functionality
  LoginBloc _loginBloc;

  //loginDto
  LoginPost _loginPostDto;

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Not a valid email address';
    } else if (value.length == 0) {
      return 'This field is required';
    } else
      return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty || value == null) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  void validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      showLoginDialog(context);
      _loginPostDto.email = userInputEmailAddress;
      _loginPostDto.password = userInputPassword;
      final uniqueCode = appCheck.uniquecode;
      _loginBloc.add(LoginButtonPressed(
          userLoginPost: _loginPostDto, uniqueCode: uniqueCode));
    }
  }

  @override
  void dispose() {
    //disposing the bloc memory freeing up
    //_loginBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    _loginPostDto = getIt<LoginPost>();
    _loginBloc = LoginBloc(DashboardBloc(),NotificationBloc());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      cubit: _loginBloc,
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          //named routing to dashboard route

          Navigator.pushReplacementNamed(context, DashBoardRoute,
              arguments: state.loginResponse);
        } else if (state is LoginPendingApproval) {
          Navigator.of(context, rootNavigator: true).pop();
          AppWidgetHelper.showSnackBar(
              "Your affiliate application is pending approval. You will get a notification once your "
              "application is approved.",
              context,
              AppTheme.errorColor);
        } else if (state is LoginFailed) {
          Navigator.of(context, rootNavigator: true).pop();
          print("LOGIN FAILEDd");
          AppWidgetHelper.showSnackBar(state.errorMessage, context);
        } else if (state is VerifyEmail) {
          Navigator.of(context, rootNavigator: true).pop();
          AppWidgetHelper.showSnackBar(state.message, context);
          Navigator.pushReplacementNamed(context, PinVerificationRoute,arguments: userInputEmailAddress);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: AppTheme.helperLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autofocus: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) {
                userInputEmailAddress = value;
              },
              autocorrect: false,
              decoration: AppWidgetHelper.textFieldDecoration(!_autoValidate),
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.white,
              validator: emailValidator,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Password",
              style: AppTheme.helperLabelStyle,
            ),
            SizedBox(
              height: 10,
            ),

            TextFormField(
              autofocus: false,
              obscureText: _passwordVisible,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: passwordValidator,
              onSaved: (value) {
                userInputPassword = value;
              },
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  // errorMaxLines: 2,
                  errorMaxLines: 1,
                  //errorStyle: TextStyle(height: 0),
                  isDense: true,
                  helperText: '   ',
                  filled: true,
                  errorStyle: TextStyle(
                    fontSize: 10.0,
                    color: Color(0xff886069),
                  ),
                  fillColor: AppTheme.darkGreyBGColour,
                  contentPadding: EdgeInsets.fromLTRB(10, 10.0, 0, 23.0),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    borderSide: BorderSide(width: 1, color: Color(0xff886069)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    borderSide: BorderSide(width: 1, color: Color(0xff886069)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      borderSide: BorderSide(width: 0, color: Colors.green))),
            ),
            SizedBox(
              height: 0,
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                      activeColor: AppTheme.checkBoxCheckedColor,
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value;
                        });
                      }),
                ),
                Text(
                  "Remember Me",
                  style: AppTheme.helperLabelStyle,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Color(0xff2D79AD),
              minWidth: 350,
              height: 50,
              textColor: Colors.white,
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                //login post carrying all the form data

                /*uncomment for api usages*/
                //_loginPostDto.emailAddress=userInputEmailAddress;
                // _loginPostDto.password=userInputPassword;
                //_loginBloc.add(LoginButtonPressed(userLoginPost: _loginPostDto));
                validateForm();
                //progress Dialog

                //showLoginDialog(context);
                //Navigator.pushReplacementNamed(context, DashBoardRoute);
                /*Navigator.of(context).pushReplacement(CupertinoPageRoute(
                    builder: (context) => BottomNavigationPage()));*/
              },
            ),
            SizedBox(
              height: 18,
            ),
            LoginFooter(
              widget: widget,
              appCheck: appCheck,
            )
          ],
        ),
      ),
    );
  }

/* textFieldDecoration(bool validation,Color color) {
    setState(() {
      return validation
          ? InputDecoration(
          filled: true,
          errorStyle: TextStyle(color: Color(0xff886069)),
          fillColor: color ?? Color(0xff212F3F),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 25.0, 23.0),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)))
          : InputDecoration(
          errorStyle: TextStyle(color: Color(0xff886069)),
          fillColor: Color(0xff886069),
          prefix: SizedBox(
            width: 20,
          ),
          contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 25.0, 23.0),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(width: 1, color: Colors.transparent),
          ),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)));
    });
  }*/

  Future showLoginDialog(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AdmissionProgressDialog('Loggin in..');
        });
  }
}

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    this.appCheck,
    Key key,
    @required this.widget,
  }) : super(key: key);

  final LoginForm widget;
  final AppCheck appCheck;

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
                    fontSize: 14.0,
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
            style: TextStyle(color: Colors.white, fontSize: 15.0),
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
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) =>
                      SignUpPage(parentContext: context, appCheck: appCheck)));
            },
          ),
        ],
      ),
    );
  }
}

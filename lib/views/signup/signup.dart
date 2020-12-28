import 'dart:async';
import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/signup_bloc.dart';
import 'package:findadmissionaffiliate/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:findadmissionaffiliate/constants/routing_constants.dart';
import 'package:findadmissionaffiliate/dto/signuppost.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/findadmision_dialog.dart';
import 'package:findadmissionaffiliate/helpers/get_it.dart';
import 'package:findadmissionaffiliate/models/app_check.dart';
import 'package:findadmissionaffiliate/utils/affiliate_methods.dart';
import 'package:findadmissionaffiliate/views/signup/dropdowns/country_dropdown.dart';
import 'package:findadmissionaffiliate/views/signup/dropdowns/gender_dropdown.dart';
import 'package:findadmissionaffiliate/views/signup/dropdowns/phone_code_dropdown.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpPage extends StatefulWidget {
  final BuildContext parentContext;
  final AppCheck appCheck;

  SignUpPage({this.parentContext, this.appCheck});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  SignUpFormBloc formBloc;
  TextEditingController wPhoneController = TextEditingController();
  Timer timeHandle;
  String selectedPhoneCode;
  String whatsAppPhoneCode;
  String holdSelectedPhoneCode;
  bool phoneDropDownError = false;
  List<Country> countryList = [];
  bool onCopyChecked = false;
  bool _autoValidate = false;
  String userInputEmailAddress;
  String userInputPassword;
  Color testColor = Color(0xff212F3F);
  SignUpBloc _signUpBloc;
  bool isEmailExists = false;
  String selectedCountry;
  String selectedGender;
  bool _passwordVisible = false;
  bool _vPasswordVisible = false;

  void onWhatsappDropDownChange(String value) {
    setState(() {
      whatsAppPhoneCode = value;
    });
  }

  void onPhoneCodeDropDownChange(String value) {
    setState(() {
      print(value);
      selectedPhoneCode = value;
    });
  }

  // SignUpFormBloc _signUpForm;

  final verticalSpacing = const SizedBox(
    height: 20,
  );
  final labelGaping = const SizedBox(
    height: 10,
  );

  final TextStyle headerTextStyle =
      AppTheme.helperLabelStyle.copyWith(fontWeight: FontWeight.w500);

  /*String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Not a valid email address';
    } else if (value.length == 0) {
      return 'This field is required';
    } else
      return null;
  }*/

  String passwordValidator(String value) {
    if (value.isEmpty || value == null) {
      return 'This is required field';
    } else {
      return null;
    }
  }

  /* void validateForm() {
    if (_fbKey.currentState.saveAndValidate()) {
      */ /*print(_fbKey.currentState.value["fname"]);*/ /*
      print(_fbKey.currentState.value);
      // print(firstName);

    }
  }*/

  @override
  void initState() {
    countryList = appCheck.country;
    _signUpBloc = SignUpBloc(SignUpInitial());

    super.initState();
  }

  @override
  void dispose() {
    wPhoneController.dispose();
    // _signUpBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = sizeConfig.screenHeight * 0.07;

    return BlocProvider(
        create: (context) => SignUpFormBloc(),
        child: Builder(builder: (context) {
          formBloc = context.bloc<SignUpFormBloc>();
          return BlocListener<SignUpBloc, SignUpState>(
              cubit: _signUpBloc,
              listener: (context, state) {
                /*if (state is SignUpInitial) {
                   showSignUpDialog(context);
                } else*/
                if (state is SignUpSuccess) {
                  Navigator.of(context, rootNavigator: true).pop();
                  final String email = formBloc.emailAddress.value;
                  Navigator.pushReplacementNamed(context, PinVerificationRoute,
                      arguments: email);
                } else if (state is SignUpFailure) {
                  Navigator.of(context, rootNavigator: true).pop();
                  AppWidgetHelper.showSnackBar(state.message, context);
                }
              },
              child: Scaffold(
                  resizeToAvoidBottomPadding: true,
                  resizeToAvoidBottomInset: true,
                  backgroundColor: Color(0xff384555),
                  body: Padding(
                    padding: EdgeInsets.fromLTRB(sizeConfig.screenWidth * 0.06,
                        topPadding, sizeConfig.screenWidth * 0.06, 0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 60,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: SingleChildScrollView(
                              child: FormBuilder(
                                key: _fbKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "First Name",
                                      style: headerTextStyle,
                                    ),
                                    labelGaping,
                                    FormBuilderTextField(
                                      autofocus: false,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      attribute: "fname",
                                      autocorrect: false,
                                      validators: [
                                        FormBuilderValidators.required()
                                      ],
                                      decoration:
                                          AppWidgetHelper.textFieldDecoration(
                                              false),
                                      style: TextStyle(color: Colors.white),
                                      keyboardType: TextInputType.text,
                                      cursorColor: Colors.white,
                                    ),
                                    verticalSpacing,
                                    Text(
                                      "Last Name",
                                      style: headerTextStyle,
                                    ),
                                    labelGaping,
                                    Container(
                                      child: FormBuilderTextField(
                                        autofocus: false,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        validators: [
                                          FormBuilderValidators.required()
                                        ],
                                        attribute: "lname",
                                        style: TextStyle(color: Colors.white),
                                        keyboardType: TextInputType.text,
                                        cursorColor: Colors.white,
                                        decoration:
                                            AppWidgetHelper.textFieldDecoration(
                                                false),
                                      ),
                                    ),
                                    verticalSpacing,
                                    Text(
                                      "Email",
                                      style: headerTextStyle,
                                    ),
                                    labelGaping,
                                    Container(
                                      child: TextFieldBlocBuilder(
                                        getImmediateSuggestions: false,
                                        textFieldBloc: formBloc.emailAddress,
                                        debounceSuggestionDuration:
                                            Duration(seconds: 100),
                                        style: TextStyle(color: Colors.white),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        cursorColor: Colors.white,
                                        decoration:
                                            AppWidgetHelper.textFieldDecoration(
                                                false),
                                      ),
                                    ),
                                    verticalSpacing,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          //mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Password",
                                              style: headerTextStyle,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width:
                                                  sizeConfig.screenWidth / 2.4,
                                              child: FormBuilderTextField(
                                                autofocus: false,
                                                obscureText: _passwordVisible,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                attribute: "pass",
                                                validators: [
                                                  FormBuilderValidators
                                                      .required()
                                                ],
                                                style: TextStyle(
                                                    color: Colors.white),
                                                keyboardType:
                                                    TextInputType.text,
                                                cursorColor: Colors.white,
                                                decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: Icon(
                                                        // Based on passwordVisible state choose the icon
                                                        _passwordVisible
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off,
                                                        color: Colors.white,
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          _passwordVisible =
                                                              !_passwordVisible;
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
                                                    fillColor: AppTheme
                                                        .darkGreyBGColour,
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 10.0, 0, 23.0),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.0)),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xff886069)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.0)),
                                                      borderSide: BorderSide(
                                                          width: 0,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.0)),
                                                      borderSide: BorderSide(
                                                          width: 0,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.0)),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xff886069)),
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    7.0)),
                                                        borderSide: BorderSide(
                                                            width: 0,
                                                            color:
                                                                Colors.green))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Confirm Password",
                                              style: headerTextStyle,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width:
                                                  sizeConfig.screenWidth / 2.4,
                                              child: FormBuilderTextField(
                                                autofocus: false,
                                                obscureText: _vPasswordVisible,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                validators: [
                                                  (val) {
                                                    if (_fbKey
                                                            .currentState
                                                            .fields['pass']
                                                            .currentState
                                                            .value !=
                                                        val) {
                                                      return "Password miss-matched";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  FormBuilderValidators
                                                      .required(),
                                                ],
                                                attribute: "vpass",
                                                style: TextStyle(
                                                    color: Colors.white),
                                                keyboardType:
                                                    TextInputType.text,
                                                cursorColor: Colors.white,
                                                decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      icon: Icon(
                                                        // Based on passwordVisible state choose the icon
                                                        _vPasswordVisible
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off,
                                                        color: Colors.white,
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          _vPasswordVisible =
                                                              !_vPasswordVisible;
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
                                                    fillColor: AppTheme
                                                        .darkGreyBGColour,
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 10.0, 0, 23.0),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.0)),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xff886069)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.0)),
                                                      borderSide: BorderSide(
                                                          width: 0,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.0)),
                                                      borderSide: BorderSide(
                                                          width: 0,
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.0)),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xff886069)),
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    7.0)),
                                                        borderSide: BorderSide(
                                                            width: 0,
                                                            color:
                                                                Colors.green))),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          //height: 100,
                                          //width: sizeConfig.screenWidth / 2.4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Country",
                                                style: headerTextStyle,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                // height: 55,
                                                width: sizeConfig.screenWidth /
                                                    2.3,
                                                decoration: BoxDecoration(
                                                    // color: Color(0xff212F3F),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: CountryDropDown(
                                                      countryCode:
                                                          appCheck.countrycode,
                                                      countryChange:
                                                          onCountryDropDownChange,
                                                      countryList: countryList,
                                                      dropDownTxtStyle: AppTheme
                                                          .dropDownTextStyle
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Gender",
                                                style: headerTextStyle,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                //height: 55,
                                                width: sizeConfig.screenWidth /
                                                    2.4,
                                                decoration: BoxDecoration(
                                                    // color: Color(0xff212F3F),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: GenderDropDown(
                                                    lightTheme: false,
                                                      onGenderChange:
                                                          onGenderChanged,
                                                      dropDownTxtStyle: AppTheme
                                                          .dropDownTextStyle
                                                          .copyWith(
                                                              color: Colors
                                                                  .white)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    verticalSpacing,
                                    Text(
                                      "Company",
                                      style: headerTextStyle,
                                    ),
                                    labelGaping,
                                    Container(
                                      child: FormBuilderTextField(
                                        autofocus: false,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        attribute: "company",
                                        validators: [
                                          FormBuilderValidators.required()
                                        ],
                                        style: TextStyle(color: Colors.white),
                                        keyboardType: TextInputType.text,
                                        cursorColor: Colors.white,
                                        decoration:
                                            AppWidgetHelper.textFieldDecoration(
                                                false),
                                      ),
                                    ),
                                    verticalSpacing,
                                    Text(
                                      "Phone",
                                      style: headerTextStyle,
                                    ),
                                    Container(
                                      //padding: const EdgeInsets.only(bottom: 20),
                                      //  height: 96,
                                      //color: Colors.redAccent,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: Container(
                                              // height: 55,
                                              width: sizeConfig.screenWidth / 3,
                                              decoration: BoxDecoration(
                                                  // color: Color(0xff212F3F),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: PhoneCodeDropDown(
                                                    userCountryCode:
                                                        appCheck.countrycode,
                                                    onDropDownChange:
                                                        onPhoneCodeDropDownChange,
                                                    countryList: countryList,
                                                    selectedPhoneCode:
                                                        selectedPhoneCode,
                                                    dropDownTxtStyle: AppTheme
                                                        .dropDownTextStyle
                                                        .copyWith(
                                                            color:
                                                                Colors.white)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // height: 55,
                                            width: sizeConfig.screenWidth / 2,
                                            child: FormBuilderTextField(
                                              autofocus: false,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              attribute: "phone",
                                              validators: [
                                                FormBuilderValidators.required(
                                                    errorText:
                                                        'This field is required')
                                              ],
                                              style: TextStyle(
                                                  color: Colors.white),
                                              keyboardType:
                                                  TextInputType.number,
                                              cursorColor: Colors.white,
                                              decoration: AppWidgetHelper
                                                  .textFieldDarkIssueDecoration(
                                                      false),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 122,
                                      width: sizeConfig.screenWidth,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: -10,
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 18.0),
                                                          child: Text(
                                                            "Whatsapp Number",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16.0),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              top: 18.0,
                                                              bottom: 5,
                                                              left: MediaQuery.of(
                                                                              context)
                                                                          .textScaleFactor >
                                                                      1.1
                                                                  ? 25
                                                                  : 45),
                                                          child: Text(
                                                            "Copy from above",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    key: holdSelectedPhoneCode !=
                                                            null
                                                        ? ValueKey<String>(
                                                            holdSelectedPhoneCode)
                                                        : ValueKey<String>(
                                                            "nobuild"),
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 20.0),
                                                        child: Container(
                                                          // height: 50,
                                                          width: sizeConfig
                                                                  .screenWidth /
                                                              3,
                                                          decoration:
                                                              BoxDecoration(
                                                                  // color: Color(0xff212F3F),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              5))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child:
                                                                PhoneCodeDropDown(
                                                              userCountryCode:
                                                                  appCheck
                                                                      .countrycode,
                                                              onDropDownChange:
                                                                  onWhatsappDropDownChange,
                                                              selectedPhoneCode: onCopyChecked
                                                                  ? getSelectedDlKey(
                                                                      holdSelectedPhoneCode)
                                                                  : getSelectedDlKey(
                                                                      whatsAppPhoneCode),
                                                              countryList:
                                                                  countryList,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        // height: 50,
                                                        width: sizeConfig
                                                                .screenWidth /
                                                            2,
                                                        child: TextFormField(
                                                          autofocus: false,
                                                          controller:
                                                              wPhoneController,
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .disabled,
                                                          validator:
                                                              passwordValidator,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          cursorColor:
                                                              Colors.white,
                                                          decoration:
                                                              AppWidgetHelper
                                                                  .textFieldDarkIssueDecoration(
                                                                      false),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: -sizeConfig.screenHeight * 0.1,
                                            left: 0,
                                            right: 15,
                                            bottom: 0,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Transform.scale(
                                                scale: 1.1,
                                                child: Checkbox(
                                                    activeColor: AppTheme
                                                        .checkBoxCheckedColor,
                                                    value: onCopyChecked,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if (!onCopyChecked) {
                                                          holdSelectedPhoneCode =
                                                              selectedPhoneCode;
                                                          onCopyChecked = value;
                                                          wPhoneController
                                                                  .text =
                                                              _fbKey
                                                                  .currentState
                                                                  .fields[
                                                                      'phone']
                                                                  .currentState
                                                                  .value;
                                                        } else {
                                                          whatsAppPhoneCode =
                                                              null;
                                                          holdSelectedPhoneCode =
                                                              null;
                                                          onCopyChecked = value;
                                                          wPhoneController
                                                              .text = '';
                                                        }
                                                      });
                                                    }),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    RichText(
                                        textAlign: TextAlign.justify,
                                        text: new TextSpan(children: [
                                          TextSpan(
                                            text:
                                                'By clicking "Create Account", you are indicating you agree to our ',
                                            style: AppTheme.termsInfoText,
                                          ),
                                          TextSpan(
                                            text: 'Terms of Service ',
                                            style: AppTheme.clickableTermsStyle,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                _launchURL(
                                                    'https://www.findadmission.com/institute/terms');
                                              },
                                          ),
                                          TextSpan(
                                            text: ' and',
                                            style: AppTheme.termsInfoText,
                                          ),
                                          TextSpan(
                                            text: ' Privacy Policy',
                                            style: AppTheme.clickableTermsStyle,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                _launchURL(
                                                    'https://www.findadmission.com/institute/privacy');
                                              },
                                          ),
                                          TextSpan(
                                            text:
                                                ' and also agree to receiving news and tips via email or push notification.',
                                            style: AppTheme.termsInfoText,
                                          ),
                                        ])),
                                    SizedBox(
                                      height: 40,
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
                                        "Create Account",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white),
                                      ),
                                      onPressed: () {
                                        print(formBloc
                                            .emailAddress.state.hasError);

                                        if (_fbKey.currentState
                                                .saveAndValidate() &&
                                            !(formBloc
                                                .emailAddress.state.hasError)) {
                                          prepareSignUpData();
                                        } else {
                                          AppWidgetHelper.showSnackBar(
                                              "Please fill up the required fields.",
                                              context,
                                              AppTheme.errorColor);
                                        }

                                        //_signUpForm.submit();
                                        // validateForm();

                                        /* Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) =>
                                      PinCodeVerificationScreen("9844604448")));*/
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
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
                                    width: sizeConfig.screenWidth / 2,
                                    height: 28.0,
                                    child: Center(
                                      child: Text(
                                        "SIGN UP",
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
                  )));
        }));
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void prepareSignUpData() {
    formBloc.submit();
    final SignUpPost _signUpDto = getIt<SignUpPost>();
    _signUpDto.fname = _fbKey.currentState.fields['fname'].currentState.value;
    _signUpDto.lname = _fbKey.currentState.fields['lname'].currentState.value;
    _signUpDto.email = formBloc.emailAddress.value;
    _signUpDto.password = _fbKey.currentState.fields['pass'].currentState.value;
    _signUpDto.country = selectedCountry ??
        AffiliateMethods.getUserDefaultCountry(appCheck.countrycode);
    _signUpDto.uniquecode = uniqueCode;
    _signUpDto.vpassword =
        _fbKey.currentState.fields['vpass'].currentState.value;
    _signUpDto.gender = selectedGender[0].toLowerCase();
    _signUpDto.companyname =
        _fbKey.currentState.fields['company'].currentState.value;
    _signUpDto.dialingcode = selectedPhoneCode ??
        AffiliateMethods.getUserDefaultDialingCode(appCheck.countrycode);
    _signUpDto.phone = _fbKey.currentState.fields['phone'].currentState.value;
    _signUpDto.wadialingcode = onCopyChecked
        ? holdSelectedPhoneCode
        : whatsAppPhoneCode != null
            ? whatsAppPhoneCode
            : holdSelectedPhoneCode;
    _signUpDto.waphone = wPhoneController.text ??
        _fbKey.currentState.fields['phone'].currentState.value;
    //if (_fbKey.currentState.saveAndValidate()) {
    //print((json.encode(_signUpDto)).toString());
    showSignUpDialog(context);
    _signUpBloc.add(
        SignUpButtonPressed(signUpPost: _signUpDto, uniqueCode: uniqueCode));
    //}
  }

  void onCountryDropDownChange(String value) {
    setState(() {
      selectedCountry = value;
    });
  }

  void onGenderChanged(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  String getSelectedDlKey(String phoneCode) {
    String selectedPhoneCode;
    countryList.forEach((element) {
      if (element.countryDialingcode == phoneCode) {
        selectedPhoneCode = element.dlkey;
        print(selectedPhoneCode);
      }
    });
    return selectedPhoneCode;
  }

  Future showSignUpDialog(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AdmissionProgressDialog('Signing up...');
        });
  }
}

import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/setting_account_bloc/account_setting_bloc.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/loading_indicator_dialog.dart';
import 'package:findadmissionaffiliate/models/home/setting.dart';
import 'package:findadmissionaffiliate/views/signup/dropdowns/phone_code_dropdown.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EditAccount extends StatefulWidget {
  final Map<String, dynamic> account;
  final AccountSettingBloc accountBloc;

  EditAccount({this.account, this.accountBloc});

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final subTitleGaping = const SizedBox(height: 5.0);
  final titleGaping = const SizedBox(height: 15.0);
  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  final TextStyle subTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w600);
  final TextStyle smallTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400);
  Widget accountEditPage;
  final GlobalKey<FormBuilderState> _accountEditFormKey =
      GlobalKey<FormBuilderState>();
  AccountSettingBloc _acccountSettingBloc;
  String selectedPhoneDCode, selectedWaPhoneDCode;
  Map<String, String> formData;

  @override
  void initState() {
    _acccountSettingBloc = widget.accountBloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountSettingBloc, AccountSettingState>(
      cubit: _acccountSettingBloc,
      listener: (context, state) {
        if (state is AccountSettingUpdated) {
          if (state.updated) {
            LoadingDialog.hide(context);
            _acccountSettingBloc.add(FetchAccountSetting());

            ///Navigator.of(context).pop(formData);
            AppWidgetHelper.showSnackBar("Setting updated successfully",
                context, AppTheme.checkBoxCheckedColor);
          } else {
            LoadingDialog.hide(context);
            AppWidgetHelper.showSnackBar("Error updating setting", context,
                AppTheme.checkBoxCheckedColor);
          }
        }
      },
      child: Container(
        color: AppTheme.greyBackground,
        child: Padding(
            padding:
                EdgeInsets.fromLTRB(15, sizeConfig.screenHeight * 0.15, 15, 15),
            child: Material(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              elevation: 1,
              child: Container(
                width: sizeConfig.screenWidth,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        left: -15,
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(CupertinoIcons.back),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Icon(
                                Icons.settings,
                                color: AppTheme.greyBackground,
                                size: 30,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Edit Account",
                                style: titleStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: SingleChildScrollView(
                          child: FormBuilder(
                            key: _accountEditFormKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Company Name",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue:
                                      widget.account["partner_companyname"],
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode: AutovalidateMode.disabled,
                                  attribute: "cname",
                                  decoration:
                                      AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                titleGaping,
                                Text(
                                  "First Name",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue: widget.account["partner_fname"],
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode: AutovalidateMode.disabled,
                                  attribute: "fName",
                                  decoration:
                                      AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                titleGaping,
                                Text(
                                  "Last Name",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue: widget.account["partner_lname"],
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode: AutovalidateMode.disabled,
                                  attribute: "lName",
                                  decoration:
                                      AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                titleGaping,
                                Text(
                                  "Email",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue: widget.account["partner_email"],
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode: AutovalidateMode.disabled,
                                  attribute: "email",
                                  decoration:
                                      AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                titleGaping,
                                Text(
                                  "Phone",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Container(
                                        height: 55,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            //color: Color(0xff212F3F),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                color:
                                                    AppTheme.btnBorderColor)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: PhoneCodeDropDown(
                                            onDropDownChange:
                                                onPhoneCodeChanged,
                                            userCountryCode:
                                                appCheck.countrycode,
                                            countryList: appCheck.country,
                                            dropDownTxtStyle: AppTheme
                                                .dropDownTextStyle
                                                .copyWith(),
                                            dropDownColor:
                                                AppTheme.cardTitleTxtColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      // height: 55,
                                      width: sizeConfig.screenWidth / 2,
                                      child: FormBuilderTextField(
                                        autofocus: false,
                                        initialValue:
                                            widget.account["partner_phone"],
                                        validators: [
                                          FormBuilderValidators.required(
                                              errorText: "")
                                        ],
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        attribute: "phone",
                                        decoration: AppWidgetHelper
                                            .buildNoErrorInputDecoration(),
                                        style: TextStyle(color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        cursorColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                titleGaping,
                                Text(
                                  "Whatsapp Phone",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Container(
                                        height: 55,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            //color: Color(0xff212F3F),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                color:
                                                    AppTheme.btnBorderColor)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: PhoneCodeDropDown(
                                            onDropDownChange:
                                                onWaPhoneCodeChanged,
                                            userCountryCode:
                                                appCheck.countrycode,
                                            countryList: appCheck.country,
                                            dropDownTxtStyle: AppTheme
                                                .dropDownTextStyle
                                                .copyWith(),
                                            dropDownColor:
                                                AppTheme.cardTitleTxtColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      // height: 55,
                                      width: sizeConfig.screenWidth / 2,
                                      child: FormBuilderTextField(
                                        autofocus: false,
                                        initialValue:
                                            widget.account["partner_waphone"],
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        attribute: "waPhone",
                                        decoration: AppWidgetHelper
                                            .buildNoErrorInputDecoration(),
                                        style: TextStyle(color: Colors.black),
                                        keyboardType: TextInputType.text,
                                        cursorColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                titleGaping,
                                AppWidgetHelper.divider(),
                                titleGaping,
                                Container(
                                  child: Text(
                                    "Bank Account",
                                    style: titleStyle.copyWith(fontSize: 15),
                                  ),
                                ),
                                titleGaping,
                                Text(
                                  "Bank Name",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue: widget.account["partner_bank"],
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode: AutovalidateMode.disabled,
                                  attribute: "bankName",
                                  decoration:
                                      AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                titleGaping,
                                Text(
                                  "Bank Address",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue:
                                      widget.account["partner_bankaddress"],
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode: AutovalidateMode.disabled,
                                  attribute: "bankAddress",
                                  decoration:
                                      AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                titleGaping,
                                Text(
                                  "Account Holder Name",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue:
                                      widget.account["partner_accholder"],
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode: AutovalidateMode.disabled,
                                  attribute: "holderName",
                                  decoration:
                                      AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                titleGaping,
                                Text(
                                  "Account No.",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue: widget.account["partner_accno"],
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode: AutovalidateMode.disabled,
                                  attribute: "accNo",
                                  decoration:
                                      AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                titleGaping,
                                Text(
                                  "Account Swift",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue:
                                      widget.account["partner_accswift"],
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode: AutovalidateMode.disabled,
                                  attribute: "accountSwift",
                                  decoration:
                                      AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                titleGaping,
                                Text(
                                  "Routing No.",
                                  style: subTitleStyle,
                                ),
                                subTitleGaping,
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue:
                                      widget.account["partner_routing"],
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode: AutovalidateMode.disabled,
                                  attribute: "routingNo",
                                  decoration:
                                      AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                titleGaping,
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: BorderSide(
                                          color: AppTheme.instituteTextColor,
                                          width: 1.0,
                                          style: BorderStyle.solid)),
                                  minWidth: sizeConfig.screenWidth,
                                  height: 48,
                                  textColor: Colors.white,
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: AppTheme.instituteTextColor,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.8),
                                  ),
                                  onPressed: () {
                                    if (_accountEditFormKey.currentState
                                        .saveAndValidate()) {
                                      LoadingDialog.show(context);                                      formData = {
                                        "partner_companyname":
                                            _accountEditFormKey
                                                .currentState
                                                .fields['cname']
                                                .currentState
                                                .value,
                                        "partner_fname": _accountEditFormKey
                                            .currentState
                                            .fields['fName']
                                            .currentState
                                            .value,
                                        "partner_lname": _accountEditFormKey
                                            .currentState
                                            .fields['lName']
                                            .currentState
                                            .value,
                                        "partner_countrycode":
                                            selectedPhoneDCode ??
                                                appCheck.countrycode,
                                        "partner_phone": _accountEditFormKey
                                            .currentState
                                            .fields['phone']
                                            .currentState
                                            .value,
                                        "partner_wacountrycode":
                                            selectedWaPhoneDCode ?? "",
                                        "partner_waphone": _accountEditFormKey
                                                .currentState
                                                .fields['waPhone']
                                                .currentState
                                                .value ??
                                            "",
                                        "partner_bank": _accountEditFormKey
                                            .currentState
                                            .fields['bankName']
                                            .currentState
                                            .value,
                                        "partner_bankaddress":
                                            _accountEditFormKey
                                                .currentState
                                                .fields['bankAddress']
                                                .currentState
                                                .value,
                                        "partner_accholder": _accountEditFormKey
                                            .currentState
                                            .fields['holderName']
                                            .currentState
                                            .value,
                                        "partner_accno": _accountEditFormKey
                                            .currentState
                                            .fields['accNo']
                                            .currentState
                                            .value,
                                        "partner_accswift": _accountEditFormKey
                                            .currentState
                                            .fields['accountSwift']
                                            .currentState
                                            .value,
                                        "partner_routing": _accountEditFormKey
                                            .currentState
                                            .fields['routingNo']
                                            .currentState
                                            .value,
                                      };
                                      _acccountSettingBloc.add(
                                          UpdateAccountSetting(
                                              formData: formData));
                                    } else {
                                      AppWidgetHelper.showSnackBar(
                                          "Please fill up the required fields",
                                          context);
                                    }
                                    // Navigator.of(context).pop();
                                    // widget.onCoursesStatusChanged(stepperCommand);
                                    /* .push(CupertinoPageRoute(builder: (context) => SignUpPage()));*/
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  void onPhoneCodeChanged(String value) {
    setState(() {
      selectedPhoneDCode = value;
    });
  }

  void onWaPhoneCodeChanged(String value) {
    setState(() {
      selectedWaPhoneDCode = value;
    });
  }
}

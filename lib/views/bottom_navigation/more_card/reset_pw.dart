import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/setting/setting_bloc.dart';
import 'package:findadmissionaffiliate/dto/change_pw_dto.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/loading_indicator_dialog.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final subTitleGaping = const SizedBox(height: 5.0);
  final titleGaping = const SizedBox(height: 15.0);
  final TextStyle titleStyle = AppTheme.studentLabelStyle
      .copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  final TextStyle subTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w600);
  final TextStyle smallTitleStyle =
      AppTheme.studentLabelStyle.copyWith(fontWeight: FontWeight.w400);
  SettingBloc settingBloc;
  final GlobalKey<FormBuilderState> settingFormKey =
      GlobalKey<FormBuilderState>();

  @override
  void initState() {
    settingBloc = SettingBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingBloc,SettingState>(
      cubit: settingBloc,
      listener:(context,state){
        if(state is PasswordChanged){
          LoadingDialog.hide(context);
          AppWidgetHelper.showSnackBar(state.message, context,AppTheme.checkBoxCheckedColor);
        }
        else if (state is PasswordChangeError){
          LoadingDialog.hide(context);
          AppWidgetHelper.showSnackBar(state.message, context,AppTheme.errorColor);

        }
      },
      child: Container(
        child: Padding(
            padding:
                EdgeInsets.fromLTRB(20, sizeConfig.screenHeight * 0.01, 20, 15),
            child: SingleChildScrollView(
              child: FormBuilder(
                key: settingFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Old Password",
                      style: AppTheme.studentLabelStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.disabled,
                      attribute: "oldpass",
                      autocorrect: false,
                      validators: [FormBuilderValidators.required()],
                      decoration: AppWidgetHelper.buildInputDecoration(),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "New Password",
                      style: AppTheme.studentLabelStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.disabled,
                      attribute: "newpass",
                      autocorrect: false,
                      validators: [FormBuilderValidators.required()],
                      decoration: AppWidgetHelper.buildInputDecoration(),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Confirm Password",
                      style: AppTheme.studentLabelStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.disabled,
                      attribute: "confirmpass",
                      autocorrect: false,
                      validators: [
                        FormBuilderValidators.required(),
                        (val) {
                          if (val !=
                              settingFormKey.currentState.fields['newpass']
                                  .currentState.value) {
                            return "Password did not matched.";
                          }
                        },
                      ],
                      decoration: AppWidgetHelper.buildInputDecoration(),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      minWidth: sizeConfig.screenWidth,
                      height: 50,
                      color: AppTheme.instituteTextColor,
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8),
                      ),
                      onPressed: () {
                        if (settingFormKey.currentState.saveAndValidate()) {
                          LoadingDialog.show(context);
                          final oldPass = settingFormKey
                              .currentState.fields['oldpass'].currentState.value;
                          final newPass = settingFormKey
                              .currentState.fields['newpass'].currentState.value;
                          print(oldPass+ "--"+newPass);
                          ChangePwDto changePwDto = ChangePwDto(newpass: newPass,oldpass: oldPass);
                          settingBloc.add(ChangePassword(passDto:changePwDto));
                        }
                      },
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

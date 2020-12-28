import 'package:findadmissionaffiliate/Theme/apptheme.dart';
import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/office_list_bloc/office_list_bloc.dart';
import 'package:findadmissionaffiliate/dto/add_office.dart';
import 'package:findadmissionaffiliate/helpers/appwidget_helper.dart';
import 'package:findadmissionaffiliate/helpers/loading_indicator_dialog.dart';
import 'package:findadmissionaffiliate/models/home/office_list.dart';
import 'package:findadmissionaffiliate/utils/affiliate_methods.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/screens/home_cards/office_list_max_3.dart';
import 'package:findadmissionaffiliate/views/signup/dropdowns/country_dropdown.dart';
import 'package:findadmissionaffiliate/views/signup/dropdowns/phone_code_dropdown.dart';
import 'package:findadmissionaffiliate/views/splashes/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EditOffice extends StatefulWidget {
  final OfficeList office;

  EditOffice({this.office});

  @override
  _EditOfficeState createState() => _EditOfficeState();
}

class _EditOfficeState extends State<EditOffice> {
  final bool _autoValidator = false;
  final formLabelTextStyle = AppTheme.studentLabelStyle;

  //final formLabelTextStyle = AppTheme.interTextStyle;
  final GlobalKey<FormBuilderState> _officeEditFormKey =
      GlobalKey<FormBuilderState>();

  Widget addOfficeWidget;
  final headingGap = const SizedBox(
    height: 20,
  );
  String selectedCountry, selectedDialCode;
  String officeName, country, city, address, contact;
  OfficeListBloc _officeListBloc;

  @override
  void initState() {
    _officeListBloc = OfficeListBloc();
    print(widget.office.partnerOfficeAddress);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OfficeListBloc, OfficeListState>(
      listener: (context, state) {
        if (state is OfficeListFetched) {
          LoadingDialog.hide(context);
          officeList.clear();
          officeList.addAll(state.officeListResponse.officeList);
          Navigator.of(context).pop(officeList);
        } else if (state is OfficeListEmpty) {}
      },
      cubit: _officeListBloc,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.greyBackground,
        body: Padding(
          padding:
              EdgeInsets.fromLTRB(15, sizeConfig.screenHeight * 0.15, 15, 15),
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
            elevation: 1,
            child: Container(
              child: Stack(
                children: [
                  Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: FormBuilder(
                          key: _officeEditFormKey,
                          child: Container(
                            height: sizeConfig.isMediumScreen()
                                ? sizeConfig.screenHeight * 0.75
                                : sizeConfig.screenHeight * 0.85,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Office Name",
                                  style: formLabelTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  onSaved: (office) {
                                    officeName = office;
                                  },
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  decoration:
                                  AppWidgetHelper.buildInputDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.black,
                                ),*/
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /* SizedBox(
                                      height: 10,
                                    ),*/
                                    Text(
                                      "Country",
                                      style: formLabelTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 55,
                                      decoration: BoxDecoration(
                                          //color: Color(0xff212F3F),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: AppTheme.btnBorderColor)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CountryDropDown(
                                          countryChange: onCountrySelected,
                                          countryCode: appCheck.countrycode,
                                          countryList: appCheck.country,
                                          dropDownTxtStyle: AppTheme
                                              .dropDownTextStyle
                                              .copyWith(),
                                          dropDownColor:
                                              AppTheme.cardTitleTxtColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "City ",
                                  style: formLabelTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                FormBuilderTextField(
                                  autofocus: false,
                                  initialValue: widget.office.partnerOfficeCity,
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  attribute: "city",
                                  decoration: AppWidgetHelper
                                      .textFieldLightIssueDecoration(true),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Address",
                                  style: formLabelTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                FormBuilderTextField(
                                  initialValue:
                                      widget.office.partnerOfficeAddress,
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  autofocus: false,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  attribute: "address",
                                  autocorrect: false,
                                  decoration: AppWidgetHelper
                                      .textFieldLightIssueDecoration(true),
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.black,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Contact Number",
                                  style: formLabelTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
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
                                        initialValue:
                                            widget.office.partnerOfficeContact,
                                        autofocus: false,
                                        validators: [
                                          FormBuilderValidators.required()
                                        ],
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        attribute: "phone",
                                        autocorrect: false,
                                        decoration: AppWidgetHelper
                                            .textFieldLightIssueDecoration(
                                                false),
                                        style: TextStyle(color: Colors.black),
                                        keyboardType: TextInputType.number,
                                        cursorColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  color: AppTheme.checkBoxCheckedColor,
                                  minWidth: 340,
                                  height: 50,
                                  textColor: Colors.white,
                                  child: Text(
                                    "Update Office",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    validateForm();
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Text(
                            "Add new office detail",
                            style: AppTheme.studentLabelStyle.copyWith(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onCountrySelected(String value) {
    setState(() {
      selectedCountry = value;
    });
  }

  void validateForm() {
    if (_officeEditFormKey.currentState.saveAndValidate()) {
      AddOfficePostData addOfficePost = AddOfficePostData();
      String dlKey = selectedDialCode ??
          AffiliateMethods.getUserDefaultDialingCode(appCheck.countrycode);
      addOfficePost.contact = dlKey +
          _officeEditFormKey.currentState.fields["phone"].currentState.value;
      addOfficePost.country = selectedCountry ??
          AffiliateMethods.getUserDefaultCountry(appCheck.countrycode);
      addOfficePost.city =
          _officeEditFormKey.currentState.fields["city"].currentState.value;
      addOfficePost.address =
          _officeEditFormKey.currentState.fields["address"].currentState.value;
      _officeListBloc.add(UpdateOfficeEvent(addOfficePostData: addOfficePost));
      LoadingDialog.show(context);
    }
  }

  void onPhoneCodeChanged(String value) {
    setState(() {
      selectedDialCode = value;
    });
  }
}

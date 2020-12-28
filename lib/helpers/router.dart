import 'file:///D:/New%20folder/findadmission_affiliate/lib/constants/routing_constants.dart';
import 'package:findadmissionaffiliate/models/login/login_response.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/bottom_nav.dart';
import 'package:findadmissionaffiliate/views/bottom_navigation/more_card/office_cards/add_office.dart';
import 'package:findadmissionaffiliate/views/login/login.dart';
import 'package:findadmissionaffiliate/views/login/partials/login_form.dart';
import 'package:findadmissionaffiliate/views/signup/pin_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Here we'll handle all the routing

  switch (settings.name) {
    case LoginViewRoute:
      final passwordRequestMail = (settings.arguments);

      return CupertinoPageRoute(
          builder: (context) => LoginPage(passwordRequestMail));
      break;
    case LoginFormRoute:
      return CupertinoPageRoute(builder: (context) => LoginForm());
      break;
    case DashBoardRoute:
      final LoginResponse loginResponse = settings.arguments;
      return CupertinoPageRoute(
          builder: (context) =>
              BottomNavigationPage(loginResponse: loginResponse));
      break;

    case PinVerificationRoute:
      final String email = settings.arguments;
      return CupertinoPageRoute(
          builder: (context) => PinCodeVerificationScreen(email: email));
      break;
    case AddOfficeRoute:
      return CupertinoPageRoute(builder: (_) => AddOffice());
      break;
  }
}

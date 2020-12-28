import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';

class AffiliateMethods{

  static String getStudentCountryCode(String countryName) {
    String userCountry;
    appCheck.country.forEach((country) {
      if (country.countryName == countryName) {
        userCountry = country.countryId;
      }
    });

    return userCountry;
  }
  static String getUserDefaultCountry(String userCountryCode) {
    String userCountry;
    appCheck.country.forEach((country) {
      if (country.countryShortcode == userCountryCode) {
        userCountry = country.countryId;
      }
    });

    return userCountry;
  }

  static String getUserDefaultDialingCode(String userCountryCode) {
    String userDialingCode;
    appCheck.country.forEach((country) {
      if (country.countryShortcode == userCountryCode) {
        userDialingCode = country.countryDialingcode;
      }
    });
    return userDialingCode;
  }

  static String getCountryFromCode(int countryCode) {
    String countryName;
    appCheck.country.forEach((country) {
      if (country.countryId == countryCode.toString()) {
        countryName = country.countryName;
      }
    });
    return countryName;
  }
}
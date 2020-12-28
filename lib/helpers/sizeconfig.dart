import 'package:flutter/material.dart';

class SizeConfig {
  MediaQueryData _mediaQueryData;
  double screenHeight;
  double screenWidth;
  double textScaleFactor;

  double devicePhysicalPixelHeight;
  double devicePixelRatio;

  SizeConfig(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    textScaleFactor = _mediaQueryData.textScaleFactor;
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    devicePixelRatio = _mediaQueryData.devicePixelRatio;
    devicePhysicalPixelHeight = screenHeight * devicePixelRatio;
  }

  //Large screen is any screen whose width is more than 1200 pixels
  bool isLargeScreen() {
    return screenHeight > 1200;
  }

//Small screen is any screen whose width is less than 800 pixels
  bool isSmallScreen() {
    return screenHeight < 800;
  }

//Medium screen is any screen whose width is less than 1200 pixels,
  //and more than 800 pixels
  bool isMediumScreen() {
    return screenHeight > 800 && screenHeight < 1200;
  }
}

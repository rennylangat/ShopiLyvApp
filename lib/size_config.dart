import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

double getProportionateScreenHeight(double initHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (initHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double initHeight) {
  double screenWidth = SizeConfig.screenHeight;
  return (initHeight / 375.0) * screenWidth;
}

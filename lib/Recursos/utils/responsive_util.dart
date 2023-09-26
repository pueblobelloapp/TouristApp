import 'package:flutter/material.dart';

class ResponsiveUtil {
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static double _blockWidth = 0;
  static double _blockHeigth = 0;

  static double screenWidth = 0;
  static double screenHeight = 0;

  static double fontMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;

      screenWidth = _screenWidth;
      screenHeight = _screenHeight;

      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
      screenWidth = _screenWidth;
      screenHeight = _screenHeight;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeigth = _screenHeight / 100;

    fontMultiplier = _blockHeigth;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeigth;
    widthMultiplier = _blockWidth;
  }
}

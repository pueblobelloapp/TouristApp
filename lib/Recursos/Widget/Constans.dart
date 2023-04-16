import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Constants {
  static ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      backgroundColor: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)));

  static Color colorPrimary = Colors.white38;

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData google_plus_g =
      IconData(0xf0d5, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  static InputDecoration decarationTextBox = const InputDecoration(
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(16.0),
      fillColor: Colors.grey,
      hintText: 'Titulo informativo',
      hintStyle: TextStyle(color: Colors.white),
      prefixIcon: Padding(
        padding: EdgeInsets.all(12.0),
        child: FaIcon(
          FontAwesomeIcons.houseUser,
          color: Colors.green,
        ),
      ));

  static ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.black87,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );
}

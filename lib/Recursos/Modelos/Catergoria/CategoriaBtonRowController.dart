import 'package:app_turismo_usuario/Recursos/Modelos/Catergoria/CategoriaBton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoryButtonRowController extends GetxController {
  final buttons = <CategoryButton>[
    CategoryButton(
        icon: const FaIcon(
          FontAwesomeIcons.locationDot,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
    CategoryButton(
        icon: const FaIcon(
          FontAwesomeIcons.award,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
    CategoryButton(
        icon: const FaIcon(
          FontAwesomeIcons.sun,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
    CategoryButton(
        icon: const FaIcon(
          FontAwesomeIcons.mugHot,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
    CategoryButton(
        icon: const FaIcon(
          FontAwesomeIcons.calendar,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
    CategoryButton(
        icon: const FaIcon(
          FontAwesomeIcons.user,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
  ];
}

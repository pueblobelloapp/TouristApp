import 'package:app_turismo_usuario/Recursos/Modelos/Catergoria/CategoriaBton.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryButtonRowController extends GetxController {
  final buttons = <CategoryButton>[
    CategoryButton(
        icon: const Icon(
          BootstrapIcons.geo_alt_fill,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
    CategoryButton(
        icon: const Icon(
          BootstrapIcons.award,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
    CategoryButton(
        icon: const Icon(
          BootstrapIcons.sun,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
    CategoryButton(
        icon: const Icon(
          BootstrapIcons.cup_hot,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
    CategoryButton(
        icon: const Icon(
          BootstrapIcons.calendar,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
    CategoryButton(
        icon: const Icon(
          BootstrapIcons.person,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        onPressed: () {}),
  ];
}

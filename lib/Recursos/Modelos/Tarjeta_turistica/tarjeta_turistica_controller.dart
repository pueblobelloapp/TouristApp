import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TarjetaTuristicaController extends GetxController {
  var mostrarMasSitios = false.obs;

  void mostrarSitios() {
    mostrarMasSitios.toggle();
  }
}

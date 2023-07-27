import 'package:app_turismo_usuario/Recursos/DataSource/DataFirebaseInformationSites.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryInformationSites.dart';
import 'package:app_turismo_usuario/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RepositorySitioTuristico _repositorySitioTuristico = getIt();

  TextEditingController search = TextEditingController();

  Stream<QuerySnapshot> selectSites() {
    return _repositorySitioTuristico.selectSitioTuristicos();
  }
}

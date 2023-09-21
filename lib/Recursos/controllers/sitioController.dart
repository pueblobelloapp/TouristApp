import 'package:app_turismo_usuario/Recursos/Repository/sitioRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Entity/sitio.dart';

class SitioController extends GetxController {
  final SitioRepository repository;

  SitioController(this.repository);

  bool esBuscar = false;
  String titulo = '';
  TextEditingController search = TextEditingController();
  FocusNode? focusNode;
  final textBuscar = ''.obs;

  @override
  void onInit() {
    if (Get.arguments['esBuscar'] != null) {
      esBuscar = Get.arguments["esBuscar"];
      if (!esBuscar) {
        titulo = Get.arguments["titulo"];
      } else {
        focusNode = FocusNode();
        focusNode!.requestFocus();
      }
    }

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Stream<Sitio?> cargarSitio() {
    return repository.getId(Get.arguments['id']);
  }

  Stream<Map?> obtenerUsuario(id) {
    return repository.getUsuario(id);
  }

  Stream<List<Sitio?>?> listarSitios() {
    return repository.getAll();
  }

  agregarComentarios(idSitio, nuevaPuntuacion) async {
    return await repository.addComentario(idSitio, nuevaPuntuacion);
  }
}

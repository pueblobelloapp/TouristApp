import 'dart:io';
import 'package:app_turismo_usuario/Recursos/DataSource/DataFirebaseLogin.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilController extends GetxController {

  final controllerLogin = Get.put<FirebaseLogin>(FirebaseLogin());

  TextEditingController emailControllerP = TextEditingController();
  TextEditingController nameControllerP = TextEditingController();
  TextEditingController birthdateControllerP = TextEditingController();

  void saveChanges() {
    // Obtengo los valores de los campos de texto
    String correo = emailControllerP.text;
    String nombre = nameControllerP.text;
    String fechaNacimiento = birthdateControllerP.text;

    Get.back();

    Get.snackbar(
      'Exito',
      'Cambios guardados',
      backgroundColor: AppBasicColors.green,
      colorText: AppBasicColors.white,
    );
  }

  Future<void> dataPerfil() async {
    Stream<QuerySnapshot> usuarioLogin = controllerLogin.getUser();
    print("Usuario iniciado: ${usuarioLogin}");
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2006),
        lastDate: DateTime.now());
  }
}

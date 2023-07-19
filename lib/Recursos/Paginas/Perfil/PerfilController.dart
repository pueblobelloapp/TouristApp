import 'dart:io';
import 'package:app_turismo_usuario/Recursos/DataSource/DataFirebaseLogin.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:app_turismo_usuario/Recursos/utils/PhotoLoad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilController extends GetxController {

  final controllerLogin = Get.put<FirebaseLogin>(FirebaseLogin());
  final controllerPhoto = Get.put<PhotoLoad>(PhotoLoad());

  TextEditingController emailControllerP = TextEditingController();
  TextEditingController nameControllerP = TextEditingController();
  TextEditingController birthdateControllerP = TextEditingController();

  String imgUrlPerfil = "";

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
    Stream<QuerySnapshot<Map<String, dynamic>>> usuarioLogin = controllerLogin.getUser();
    print("Mostrando elementos");

    usuarioLogin.forEach((element) {
      print('${element.docs[0]['uid']}');
      birthdateControllerP.text = '${element.docs[0]['birthDate']}';
      emailControllerP.text = '${element.docs[0]['email']}';
      nameControllerP.text = '${element.docs[0]['name']}';
      imgUrlPerfil = '${element.docs[0]['image']}';
      print( '${element.docs[0]['image']}');
    });
    //print("Usuario iniciado: ${usuarioLogin}");
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2006),
        lastDate: DateTime.now());
  }
}

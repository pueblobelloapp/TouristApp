import 'dart:io';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilController extends GetxController {
  TextEditingController emailControllerP = TextEditingController();
  TextEditingController nameControllerP = TextEditingController();
  TextEditingController birthdateControllerP = TextEditingController();

  // Variable para guardar la foto
  File? selectedPhoto;

  // Método para seleccionar una foto
  void selectPhoto() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      selectedPhoto = File(pickedImage.path);
      update();
    }
  }

  void saveChanges() {
    // Obtengo los valores de los campos de texto
    String correo = emailControllerP.text;
    String nombre = nameControllerP.text;
    String fechaNacimiento = birthdateControllerP.text;

    Get.back(); // Cierra el diálogo

    Get.snackbar(
      'Exito',
      'Cambios guardados',
      backgroundColor: AppBasicColors.green,
      colorText: AppBasicColors.white,
    );
  }
}

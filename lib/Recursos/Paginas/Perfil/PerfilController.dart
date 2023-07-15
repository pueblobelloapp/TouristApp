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
  var selectedPhoto = XFile('').obs;
  var imagePerfilUrl = ''.obs;

  // Método para seleccionar una foto
  void selectPhoto() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      selectedPhoto.value = pickedImage;
      update();
    }
  }

  void saveChanges() {
    // Obtengo los valores de los campos de texto
    String correo = emailControllerP.text;
    String nombre = nameControllerP.text;
    String fechaNacimiento = birthdateControllerP.text;

    // Verifica si hay cambios realizados
    /*bool changesMade = false;
    if (correo.isNotEmpty || nombre.isNotEmpty || fechaNacimiento.isNotEmpty) {
      changesMade = true;
    }*/

    // Si no hay cambios realizados, no muestra la notificación
    /*if (!changesMade) {
      Get.back();
      return;
    }*/

    Get.back(); // Cierra el diálogo

    Get.snackbar(
      'Exito',
      'Cambios guardados',
      backgroundColor: AppBasicColors.green,
      colorText: AppBasicColors.white,
    );
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2006),
        lastDate: DateTime.now());
  }
}

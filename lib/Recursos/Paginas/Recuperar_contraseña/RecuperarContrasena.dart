import 'package:app_turismo_usuario/Recursos/Paginas/Recuperar_contrase%C3%B1a/RecuperarContrasenaController.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Widget/Constans.dart';

class RecoveryPassword extends GetView<RecoveryPasswordController> {
  const RecoveryPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put<RecoveryPasswordController>(RecoveryPasswordController());
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: 350.0,
          //height: 267.0,
          child: Column(
            children: [
              _textFormFielWidget(
                  controller.currentPasswordController,
                  const Icon(
                    BootstrapIcons.lock,
                    color: AppBasicColors.black,
                  ),
                  'Clave actual',
                  true,
                  '',
                  TextInputType.text),
              const SizedBox(height: 10.0),
              _textFormFielWidget(
                  controller.newPasswordController,
                  const Icon(
                    BootstrapIcons.lock,
                    color: AppBasicColors.black,
                  ),
                  'Nueva clave',
                  true,
                  '',
                  TextInputType.text),
              const SizedBox(height: 10.0),
              _textFormFielWidget(
                  controller.confirmPasswordController,
                  const Icon(
                    BootstrapIcons.lock,
                    color: AppBasicColors.black,
                  ),
                  'Confirmar clave',
                  true,
                  '',
                  TextInputType.text),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                    style: Constants.buttonPrimary,
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'Guardar cambios',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _textFormFielWidget(
    TextEditingController controlador,
    Icon icono,
    String textGuide,
    bool estate,
    String msgError,
    TextInputType textInputType) {
  return TextFormField(
    controller: controlador,
    keyboardType: textInputType,
    obscureText: estate,
    decoration: InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 6.0, top: 0.0, right: 6.0),
        child: icono,
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      fillColor: const Color.fromRGBO(223, 230, 233, 1),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0)),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        //borderRadius: BorderRadius.circular(5.0)
      ),
      hintText: textGuide,
      disabledBorder: InputBorder.none,
      contentPadding: const EdgeInsets.all(16.0),
      hintStyle: const TextStyle(color: Colors.black26),
      //labelStyle: const TextStyle(color: Colors.green),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return msgError;
      }
    },
    cursorColor: Colors.black,
  );
}

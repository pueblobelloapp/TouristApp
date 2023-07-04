import 'package:app_turismo_usuario/Recursos/Widget/custom_textFormField.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/Constans.dart';
import 'RecuperarContrasenaController.dart';

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
              //textFormField clave actual
              CustomTextFormField(
                controller: controller.currentPasswordController,
                icon: const Icon(
                  BootstrapIcons.lock,
                  color: AppBasicColors.black,
                ),
                textGuide: 'Clave actual',
                obscureText: true,
                textInputType: TextInputType.text,
                fillColor: AppBasicColors.colorTextFormField,
              ),
              const SizedBox(height: 10.0),
              CustomTextFormField(
                controller: controller.newPasswordController,
                icon: const Icon(
                  BootstrapIcons.lock,
                  color: AppBasicColors.black,
                ),
                textGuide: 'Nueva clave',
                obscureText: true,
                textInputType: TextInputType.text,
                fillColor: AppBasicColors.colorTextFormField,
              ),
              const SizedBox(height: 10.0),
              CustomTextFormField(
                controller: controller.confirmPasswordController,
                icon: const Icon(
                  BootstrapIcons.lock,
                  color: AppBasicColors.black,
                ),
                textGuide: 'Confirmar clave',
                obscureText: true,
                textInputType: TextInputType.text,
                fillColor: AppBasicColors.colorTextFormField,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
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

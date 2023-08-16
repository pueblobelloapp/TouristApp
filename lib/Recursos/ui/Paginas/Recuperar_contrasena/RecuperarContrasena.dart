import 'package:app_turismo_usuario/Recursos/controllers/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/Custom_elevated_button.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/custom_textFormField.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'RecuperarContrasenaController.dart';

class RecoveryPassword extends GetView<RecoveryPasswordController> {
  final _formkey = GlobalKey<FormState>();
  ControllerLogin controllerLogin = Get.find();

  RecoveryPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put<RecoveryPasswordController>(RecoveryPasswordController());
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 380.0,
          //height: 267.0,
          child: Column(
            children: [
              const Text(
                'Ingresa tu correo electrónico',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              //textFormField correo
              CustomTextFormField(
                controller: controller.emailRecoveryPassword,
                icon: const Icon(
                  BootstrapIcons.envelope,
                  color: AppBasicColors.black,
                ),
                textGuide: 'Ingrese Correo',
                obscureText: false,
                textInputType: TextInputType.emailAddress,
                fillColor: AppBasicColors.colorTextFormField,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                height: 45.0,
                child: CustomElevatedButton(
                    color: AppBasicColors.rgb,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    onPressed: () {
                      validateEmail(context);
                      //print('OK');
                      //Get.back();
                    },
                    text: 'Reestablecer Contraseña'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateEmail(BuildContext context) {
    final bool isValidEmail =
        EmailValidator.validate(controller.emailRecoveryPassword.text);
    if (isValidEmail) {
      controllerLogin
          .recuperarPassword(controller.emailRecoveryPassword.text.trim())
          .then((value) => {
                Get.back(),
                controller.notificationMessage.message =
                    "enviado para verificación",
                controller.notificationMessage.shouldTransform = false,
                controller.notificationMessage.showNotification(context),
              })
          .catchError((onError) {
        if (onError == "user-not-found") {
          controller.notificationMessage.imagePath = 'Assets/Img/error.gif';
          controller.notificationMessage.message =
              "Correo invalido, no se encuentra registrado";
        } else if (onError == "inválid-email") {
          controller.notificationMessage.imagePath = 'Assets/Img/error.gif';
          controller.notificationMessage.message =
              "Correo inválido, Digita un correo válido";
        }
        controller.notificationMessage.showNotification(context);
      });
    } else {
      controller.notificationMessage.imagePath = 'Assets/Img/error.gif';
      controller.notificationMessage.message =
          "Verifique el correo electrónico";
      controller.notificationMessage.showNotification(context);
    }
    controller.emailRecoveryPassword.clear();
  }
}

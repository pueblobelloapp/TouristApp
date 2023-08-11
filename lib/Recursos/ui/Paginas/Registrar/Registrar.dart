import 'dart:io';

import 'package:app_turismo_usuario/Recursos/ui/Widget/Constans.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/Custom_elevated_button.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/custom_textFormField.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';
import '../../../utils/PhotoLoad.dart';
import 'RegistrarController.dart';
import 'package:intl/intl.dart';

class Registrar extends GetView<RegistrarController> {
  const Registrar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('Assets/Img/background-login.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.srcOver)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              child: Row(
                children: [
                  _btnArrowBack(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  _title(),
                  const SizedBox(
                    height: 20,
                  ),
                  _containerPhoto(),
                  _formRegistration(context),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _btnArrowBack() {
  return SafeArea(
      minimum: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 11.0),
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
            height: 30.0,
            width: 30.0,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(178, 190, 195, 1),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: const Center(
              child: Icon(
                BootstrapIcons.arrow_left,
                color: AppBasicColors.black,
                size: 20.0,
              ),
            )),
      ));
}

Widget _title() {
  return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        children: const [
          Center(
            child: Text(
              'IKU',
              style: TextStyle(
                  color: AppBasicColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 72.0),
            ),
          ),
        ],
      ));
}

Widget _containerPhoto() {
  final controller = Get.put<RegistrarController>(RegistrarController());
  final controllerPhoto = Get.put<PhotoLoad>(PhotoLoad());
  return GestureDetector(
      onTap: () => controllerPhoto.selectPhoto(),
      child: Obx(() => Container(
            width: 148.0,
            height: 151.0,
            decoration: BoxDecoration(
                color: controllerPhoto.selectedPhoto.value.path == ""
                    ? AppBasicColors.rgb
                    : AppBasicColors.rgbTransparent,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: controllerPhoto.selectedPhoto.value.path != ""
                  ? Image.memory(
                      File(controllerPhoto.selectedPhoto.value.path)
                          .readAsBytesSync(),
                      fit: BoxFit.cover)
                  : const Icon(
                      BootstrapIcons.person,
                      size: 60.0,
                      color: AppBasicColors.white,
                    ),
            ),
          )));
}

Widget _formRegistration(BuildContext context) {
  final controller = Get.put<RegistrarController>(RegistrarController());
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 29, 10, 0),
    child: Form(
        key: controller.formKey,
        child: Column(
          children: <Widget>[
            //TextFormField Email
            CustomTextFormField(
              controller: controller.emailR,
              icon: const Icon(
                BootstrapIcons.envelope,
                color: AppBasicColors.black,
              ),
              textGuide: 'Correo',
              obscureText: false,
              msgError: 'Error,digite un correo',
              textInputType: TextInputType.emailAddress,
              fillColor: AppBasicColors.colorTextFormField,
            ),
            const SizedBox(
              height: 13.0,
            ),
            //TextFormField Contraseña
            CustomTextFormField(
              controller: controller.passwordR,
              icon: const Icon(
                BootstrapIcons.lock,
                color: AppBasicColors.black,
              ),
              textGuide: 'Contraseña',
              obscureText: true,
              msgError: 'Error, 6 caracteres minimo.',
              textInputType: TextInputType.text,
              fillColor: AppBasicColors.colorTextFormField,
            ),
            const SizedBox(
              height: 13,
            ),
            //TextFormField confirmar Contraseña
            CustomTextFormField(
              controller: controller.passwordConfR,
              icon: const Icon(
                BootstrapIcons.lock,
                color: AppBasicColors.black,
              ),
              textGuide: 'Confirmar contraseña',
              obscureText: true,
              msgError: 'Error,digite una Contraseña',
              textInputType: TextInputType.text,
              fillColor: AppBasicColors.colorTextFormField,
            ),
            const SizedBox(
              height: 13,
            ),
            //TextFormField Nombre Completo
            CustomTextFormField(
              controller: controller.nameR,
              icon: const Icon(
                BootstrapIcons.person,
                color: AppBasicColors.black,
              ),
              textGuide: 'Nombre completo',
              obscureText: false,
              msgError: 'Error,digite nombre completo',
              textInputType: TextInputType.text,
              fillColor: AppBasicColors.colorTextFormField,
            ),
            const SizedBox(
              height: 13,
            ),
            //TextFormField fecha de nacimiento
            CustomTextFormField(
              controller: controller.dateOfBirthR,
              icon: const Icon(
                BootstrapIcons.calendar_week,
                color: AppBasicColors.black,
              ),
              textGuide: 'Fecha de Nacimiento',
              obscureText: false,
              msgError: 'Error,digite fecha de nacimiento',
              textInputType: TextInputType.text,
              fillColor: AppBasicColors.colorTextFormField,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await controller.selectDate(context);

                if (pickedDate != null) {
                  print(pickedDate);

                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);

                  controller.dateOfBirthR.text = formattedDate;
                }
              },
            ),
            const SizedBox(
              height: 35.0,
            ),
            _btonRegistration(context),
            //_btonRegistration(context)
          ],
        )),
  );
}

Widget _btonRegistration(BuildContext context) {
  final controller = Get.put<RegistrarController>(RegistrarController());
  return SizedBox(
    width: double.infinity,
    height: 50.0,
    child: CustomElevatedButton(
      color: AppBasicColors.rgb,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      onPressed: () {
        if (controller.formKey.currentState!.validate()) {
          print("Valido campos");
          Map<String, String> dataRegister = {
            "name": controller.nameR.text,
            "email": controller.emailR.text,
            "pass": controller.passwordR.text,
            "passVerify": controller.passwordConfR.text,
            "birthDate": controller.dateOfBirthR.text
          };
          controller.validateRegisterUser(dataRegister, context);
        } else {
          print("Error validaciones");
        }
      },
      text: 'Registrarme',
      child: controller.isLoading
          ? Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  SizedBox(
                      height: 20.0,
                      width: 20.0,
                      child: CircularProgressIndicator(color: Colors.white)),
                  SizedBox(width: 10.5),
                  Text("Cargando datos")
                ]))
          : Center(child: Text("Registrarme")),
    ),
  );
}

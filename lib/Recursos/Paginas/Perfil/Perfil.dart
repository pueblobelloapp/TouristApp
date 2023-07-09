import 'package:app_turismo_usuario/Recursos/Paginas/Perfil/PerfilController.dart';
import 'package:app_turismo_usuario/Recursos/Widget/custom_textFormField.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Widget/Constans.dart';

class ProfileDialog extends GetView<PerfilController> {
  const ProfileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<PerfilController>(PerfilController());
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      content: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: 350.0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => controller.selectPhoto(),
                    child: Container(
                      width: 148.0,
                      height: 151.0,
                      color: AppBasicColors.rgb,
                      child: Center(
                        child: controller.selectedPhoto != null
                            ? Image.file(
                                controller.selectedPhoto!,
                                fit: BoxFit.cover,
                              )
                            : const Icon(
                                BootstrapIcons.person,
                                size: 60.0,
                                color: AppBasicColors.white,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35.0),
                  //textFormFiel correo
                  CustomTextFormField(
                    controller: controller.emailControllerP,
                    icon: const Icon(
                      BootstrapIcons.envelope,
                      color: AppBasicColors.black,
                    ),
                    textGuide: 'Correo',
                    obscureText: false,
                    msgError: 'Error, compruebe el correo',
                    textInputType: TextInputType.emailAddress,
                    fillColor: AppBasicColors.colorTextFormField,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  //textFormFiel nombre completo
                  CustomTextFormField(
                    controller: controller.nameControllerP,
                    icon: const Icon(
                      BootstrapIcons.person,
                      color: AppBasicColors.black,
                    ),
                    textGuide: 'Nombre completo',
                    obscureText: false,
                    msgError: 'Error, compruebe el nombre',
                    textInputType: TextInputType.text,
                    fillColor: AppBasicColors.colorTextFormField,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  //textFormFiel fecha de nacimiento
                  CustomTextFormField(
                    controller: controller.birthdateControllerP,
                    icon: const Icon(
                      BootstrapIcons.calendar_week,
                      color: AppBasicColors.black,
                    ),
                    textGuide: 'Fecha de nacimiento',
                    obscureText: false,
                    msgError: 'Error, compruebe la fecha de nacimiento',
                    textInputType: TextInputType.datetime,
                    fillColor: AppBasicColors.colorTextFormField,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate =
                          await controller.selectDate(context);

                      if (pickedDate != null) {
                        print(pickedDate);

                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        controller.birthdateControllerP.text = formattedDate;
                      }
                    },
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    height: 40.0,
                    child: ElevatedButton(
                        style: Constants.buttonPrimary,
                        onPressed: controller.saveChanges,
                        child: const Text(
                          'Guardar cambios',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        )),
                  )
                ],
              ),
            ),
            Positioned(
              right: 50.0,
              bottom: 250.0,
              child: Container(
                width: 59.0,
                height: 59.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppBasicColors.lightGrey,
                ),
                child: const Icon(
                  BootstrapIcons.camera_fill,
                  color: AppBasicColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

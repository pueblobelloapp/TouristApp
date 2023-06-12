import 'package:app_turismo_usuario/Recursos/Paginas/Perfil/PerfilController.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Widget/Constans.dart';

class ProfileDialog extends GetView<PerfilController> {
  const ProfileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<PerfilController>(PerfilController());
    return AlertDialog(
        /*title: const Text(
          'Perfil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),*/
        content: SingleChildScrollView(
      child: Container(
        width: 350.0,
        //height: 367.0,
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
                      : const FaIcon(
                          FontAwesomeIcons.user,
                          size: 50.0,
                          color: AppBasicColors.white,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            // Campo de texto para el correo
            _textFormFielWidget(
                controller.emailControllerP,
                const FaIcon(
                  FontAwesomeIcons.envelope,
                  color: AppBasicColors.black,
                ),
                'Correo',
                false,
                'Error, compruebe correo',
                TextInputType.emailAddress),
            const SizedBox(height: 10.0),
            // Campo de texto para nombre completo
            _textFormFielWidget(
                controller.nameControllerP,
                const FaIcon(
                  FontAwesomeIcons.user,
                  color: AppBasicColors.black,
                ),
                'Nombre Completo',
                false,
                'Error, compruebe nombre completo',
                TextInputType.name),
            const SizedBox(height: 10.0),
            // Campo de texto para la fecha de nacimiento
            _textFormFielWidget(
                controller.birthdateControllerP,
                const FaIcon(
                  FontAwesomeIcons.calendar,
                  color: AppBasicColors.black,
                ),
                'Fecha de nacimiento',
                false,
                'Error, compruebe correo',
                TextInputType.datetime),
            const SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              height: 40.0,
              child: ElevatedButton(
                  style: Constants.buttonPrimary,
                  onPressed: controller.saveChanges,
                  child: const Text(
                    'Guardar cambios',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}

Widget _textFormFielWidget(
    TextEditingController controlador,
    FaIcon icono,
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

import 'package:app_turismo_usuario/Recursos/Widget/custom_back_button.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Constans.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_theme.dart';
import 'RegistrarController.dart';

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
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      _btnArrowBack(),
                    ],
                  ),
                  _title(),
                  _containerPhoto(),
                  _formRegistration()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _btnArrowBack() {
  return CustomBackButton(onPressed: () {
    Get.back();
  });
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
  return Center(
      child: Container(
          width: 148.0,
          height: 151.0,
          color: AppBasicColors.rgb,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                BootstrapIcons.person,
                color: AppBasicColors.white,
                size: 50.0,
              ),
            ],
          )));
}

Widget _formRegistration() {
  final controller = Get.put<RegistrarController>(RegistrarController());
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 29, 10, 0),
    child: Form(
        child: Column(
      children: <Widget>[
        //TextFormField Email
        _textFormFielWidget(
            controller.emailR,
            const Icon(
              BootstrapIcons.envelope,
              color: AppBasicColors.black,
            ),
            'Correo',
            false,
            'Error,digite un correo',
            TextInputType.emailAddress),
        const SizedBox(
          height: 13,
        ),
        //TextFormField contraseña
        _textFormFielWidget(
            controller.passwordR,
            const Icon(
              BootstrapIcons.lock,
              color: AppBasicColors.black,
            ),
            'Contraseña',
            true,
            'Error,digite una Contraseña',
            TextInputType.text),
        const SizedBox(
          height: 13,
        ),
        //TextFormField confirmar Contraseña
        _textFormFielWidget(
            controller.passwordConfR,
            const Icon(
              BootstrapIcons.lock,
              color: AppBasicColors.black,
            ),
            'Confirmar contraseña',
            true,
            'Error,digite una Contraseña',
            TextInputType.text),
        const SizedBox(
          height: 13,
        ),
        //TextFormField Nombre Completo
        _textFormFielWidget(
            controller.nameR,
            const Icon(
              BootstrapIcons.person,
              color: AppBasicColors.black,
            ),
            'Nombre completo',
            false,
            'Error,digite nombre completo',
            TextInputType.text),
        const SizedBox(
          height: 13,
        ),
        //TextFormField fecha de nacimiento
        _textFormFielWidget(
            controller.dateOfBirthR,
            const Icon(
              BootstrapIcons.calendar2_day,
              color: AppBasicColors.black,
            ),
            'Fecha de nacimiento',
            false,
            'Error,digite fecha de nacimiento',
            TextInputType.datetime),
        const SizedBox(
          height: 45.0,
        ),
        _btonRegistration()
      ],
    )),
  );
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
        padding: const EdgeInsets.all(12.0),
        child: icono,
      ),
      fillColor: const Color(0xFFDFE6E9),
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
      labelStyle: const TextStyle(color: Colors.green),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return msgError;
      }
    },
    cursorColor: Colors.black,
  );
}

Widget _btonRegistration() {
  return Container(
    width: double.infinity,
    height: 50.0,
    child: ElevatedButton(
        style: Constants.buttonPrimary,
        onPressed: () {},
        child: const Text(
          'Registrarme',
          style: TextStyle(fontSize: 20.0),
        )),
  );
}

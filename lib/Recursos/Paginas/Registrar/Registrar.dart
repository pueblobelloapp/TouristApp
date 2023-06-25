import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Login/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Constans.dart';
import 'package:app_turismo_usuario/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../theme/app_theme.dart';
import 'RegistrarController.dart';

class Registrar extends GetView<RegistrarController> {
  Registrar({super.key});

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
                  const SizedBox(
                    height: 10.0,
                  ),
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
  return SafeArea(
      minimum: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 11.0),
      child: Container(
        height: 28.0,
        width: 28.0,
        //padding: const EdgeInsets.only(left: 11.0),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(178, 190, 195, 1),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: 15.0,
            )),
      ));
}

Widget _title() {
  return SafeArea(
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
              FaIcon(
                FontAwesomeIcons.user,
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
        key: controller.formKey,
        child: Column(
      children: <Widget>[
          _textFormFielWidget(
            controller.emailR,
            const FaIcon(
              FontAwesomeIcons.user,
              color: AppBasicColors.black,
            ),
            'Correo',
            false,
            TextInputType.emailAddress),
          const SizedBox(height: 13),
        //TextFormField contraseña
          _textFormFielWidget(
            controller.passwordR,
            const FaIcon(FontAwesomeIcons.lock, color: AppBasicColors.black),
            'Contraseña', true,
            TextInputType.text),
          const SizedBox(height: 13),
        //TextFormField confirmar Contraseña
          _textFormFielWidget(
            controller.passwordConfR,
            const FaIcon(
              FontAwesomeIcons.lock,
              color: AppBasicColors.black,
            ),
            'Confirmar contraseña',
            true,
            TextInputType.text),
          const SizedBox(height: 13),
        //TextFormField Nombre Completo
          _textFormFielWidget(
            controller.nameR,
            const FaIcon(
              FontAwesomeIcons.user,
              color: AppBasicColors.black,
            ),
            'Nombre completo',
            false,
            TextInputType.text),
          const SizedBox(height: 13),
        //TextFormField fecha de nacimiento
          _textFormFielWidget(
            controller.dateOfBirthR,
            const FaIcon(
              FontAwesomeIcons.calendar,
              color: AppBasicColors.black,
            ),
            'Fecha de nacimiento',
            false,
            TextInputType.datetime),
          const SizedBox(height: 45.0),
           _btonRegistration()
      ],
    )),
  );
}

Widget _textFormFielWidget(
    TextEditingController controlador,
    FaIcon icono,
    String textGuide,
    bool estate,
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
    cursorColor: Colors.black,
  );
}

Widget _btonRegistration() {
  return SizedBox(
    width: double.infinity,
    height: 50.0,
    child: ElevatedButton(
        style: Constants.buttonPrimary,
        onPressed: () {

          final controller = Get.put<RegistrarController>(RegistrarController());
          final ControllerLogin _controllerLogin = getIt();

          print("Valido campos");
          Map<String, String> dataRegister = {
            "name" : controller.nameR.text,
            "email" : controller.emailR.text,
            "pass" : controller.passwordR.text,
            "passVerify" : controller.passwordConfR.text,
            "birthDate" : controller.dateOfBirthR.text
          };

          _controllerLogin.validateRegisterUser(dataRegister);


          //Modificar la captura de la fecha
          //Validar registro. ---En ejecucion
          //Validar mensajes de error personales
        },
        child: const Text(
          'Registrarme',
          style: TextStyle(fontSize: 20.0),
        )),
  );
}

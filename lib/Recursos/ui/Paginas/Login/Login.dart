import 'package:app_turismo_usuario/Recursos/Entity/Usuario.dart';
import 'package:app_turismo_usuario/Recursos/controllers/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/Custom_elevated_button.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/custom_textFormField.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_theme.dart';
import '../Registrar/Registrar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String mensajeNotificacion = "Error";

  final ControllerLogin _controllerLogin = Get.find();

  Usuario userLogin = Usuario();
  String mensajeNotification = "Error";
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyLogin(),
    );
  }

  Widget bodyLogin() {
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage(
                        'Assets/Img/background-login.png',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          AppBasicColors.black.withOpacity(0.5),
                          BlendMode.darken))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.4,
                    child: titleLogin(),
                  ),
                  SizedBox(
                      // height: screenHeight * 0.4,
                      child: _formLogin()),
                  SizedBox(
                    // height: screenHeight * 0.2,
                    child: _btnGoogle(),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget titleLogin() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(94.0, 70.0, 94.0, 0),
      child: Column(
        children: [
          Text(
            'IKU',
            style: TextStyle(
                color: AppBasicColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 72.0),
          ),
          Text(
            'Pueblo Bello',
            style: TextStyle(
                color: AppBasicColors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 24.0),
          )
        ],
      ),
    );
  }

  Widget _formLogin() {
    // final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Form(
          key: _controllerLogin.formKey,
          child: Column(
            children: [
              //TextFormField correo
              CustomTextFormField(
                  controller: _controllerLogin.emailL,
                  icon: const Icon(
                    BootstrapIcons.envelope,
                    color: AppBasicColors.black,
                  ),
                  textGuide: 'Correo',
                  obscureText: false,
                  msgError: 'Error, compruebe el correo',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 13,
              ),
              //TextFormField Contraseña
              CustomTextFormField(
                  controller: _controllerLogin.passwordL,
                  icon: const Icon(
                    BootstrapIcons.lock,
                    color: AppBasicColors.black,
                  ),
                  textGuide: 'Contraseña',
                  obscureText: true,
                  msgError: 'Error, Digite una contraseña',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 13,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: CustomElevatedButton(
                    color: AppBasicColors.rgb,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (builder) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 200,
                                width: Get.width,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Cargando'),
                                  ],
                                ),
                              ),
                            );
                          });

                      bool resp = await _controllerLogin.getLoginUser(context);

                      if (resp) {
                        Get.back();
                        Get.back();
                      } else {
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    text: 'Iniciar sesion',
                  )),
              const SizedBox(height: 18.0),
              _optionSesion()
            ],
          )),
    );
  }

  Widget _btnGoogle() {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 90, 10, 0),
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppBasicColors.rgb, width: 2.0)),
        child: CustomElevatedButton(
          color: AppBasicColors.transparent,
          fontSize: 14,
          borderRadius: 0,
          onPressed: () {
            Get.find<ControllerLogin>().signInWithGoogle(context);
          },
          text: 'Iniciar con Google',
          textColor: AppBasicColors.rgb,
        ));
  }

  Widget _optionSesion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: () {
            Get.to(() => const Registrar());
          },
          child: const Text(
            'Registrarme',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppBasicColors.white,
                fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}

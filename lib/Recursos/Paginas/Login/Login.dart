// ignore_for_file: sized_box_for_whitespace

import 'package:app_turismo_usuario/Recursos/Paginas/Login/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Navigation_bar/navigation_bar.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Principal/principal.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Constans.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Gradient_Header.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../theme/app_theme.dart';
import '../Registrar/Registrar.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailL = TextEditingController();
  TextEditingController _passwordL = TextEditingController();
  ControllerLogin controllerLogin = Get.find();
  String mensajeNotificacion = "Error";

  bool _processing = false;

  @override
  void dispose() {
    _emailL.dispose();
    _passwordL.dispose();
    super.dispose();
  }

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
      child: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              _tituloLogin(),
              _formLogin(),
            ],
          ),
        )
      ]),
    ));
  }

  /*Widget _imagenLogo() {
    return Container(
      child: Image.asset(
        'Assets/Img/background-login.png',
        //width: MediaQuery.of(context).size.width * 0.85,
        width: 260,
        height: 260,
      ),
    );
  }*/

  Widget _tituloLogin() {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
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
    ));
  }

  Widget _formLogin() {
    return Container(
      child: Form(
          key: _formkey,
          child: Container(
            //color: Colors.white,
            margin: const EdgeInsets.fromLTRB(10, 240, 10, 0),
            child: Column(
              children: <Widget>[
                //TextFormField Email
                _textFormFielWidget(
                    _emailL,
                    const Icon(
                      BootstrapIcons.envelope_check,
                      color: AppBasicColors.black,
                    ),
                    'Correo',
                    false,
                    'Error, compruebe el correo',
                    TextInputType.emailAddress),
                const SizedBox(
                  height: 13,
                ),
                //TextFormField Contraseña
                _textFormFielWidget(
                    _passwordL,
                    const Icon(
                      BootstrapIcons.lock,
                      color: AppBasicColors.black,
                    ),
                    'Contraseña',
                    true,
                    'Error, Digite una contraseña',
                    TextInputType.text),
                const SizedBox(
                  height: 13,
                ),
                //boton login
                Container(
                  //color: Colors.white,
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                      style: Constants.buttonPrimary,
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          controllerLogin
                              .getLogin(_emailL.text, _passwordL.text)
                              .then((value) => {
                                    if (controllerLogin.email !=
                                            'Sin Registro' &&
                                        controllerLogin.password != "")
                                      {Get.to(const Principal())}
                                    else
                                      {
                                        _messageInformation(
                                            'Validación de usuario',
                                            'No se encuentra registrado',
                                            const Icon(Icons.person),
                                            Colors.red)
                                      }
                                  })
                              .catchError((onerror) {
                            print('Recibido: ' + onerror);
                            if (onerror == 'wrong-password') {
                              mensajeNotificacion = 'Contraseña incorrecta';
                            } else if (onerror == 'user-not-founf') {
                              mensajeNotificacion = "Email no existe";
                            }
                            _messageInformation('Ups!', mensajeNotificacion,
                                const Icon(Icons.error), Colors.white);
                          });
                        }
                      },
                      child: const Text(
                        'Iniciar',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  children: [_optionSesion()],
                ),
                Positioned(child: _btnGoogle())
                /* const SizedBox(
                  height: 95.0,
                ),*/
              ],
            ),
          )),
    );
  }

  Widget _btnGoogle() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 90, 0, 0),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppBasicColors.rgb, width: 2.0)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
        ),
        onPressed: () {},
        child: const Text('Iniciar con Google'),
      ),
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
        fillColor: Colors.grey.shade200,
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

  Widget _optionSesion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: () {
            Get.to(const Registrar());
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

  void _messageInformation(
      String titulo, String mensaje, Icon icono, Color color) {
    Get.showSnackbar(GetSnackBar(
      title: titulo,
      message: mensaje,
      icon: icono,
      duration: const Duration(seconds: 4),
      backgroundColor: color,
    ));
  }
}

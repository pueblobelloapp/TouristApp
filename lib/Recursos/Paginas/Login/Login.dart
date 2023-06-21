// ignore_for_file: sized_box_for_whitespace

import 'package:app_turismo_usuario/Recursos/DataSource/DataFirebaseLogin.dart';
import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Login/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Navigation_bar/navigation_bar.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Principal/principal.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Constans.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Gradient_Header.dart';
import 'package:app_turismo_usuario/Recursos/utils/GextUtils.dart';
import 'package:app_turismo_usuario/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  final FirebaseLogin _firebaseLogin = getIt();
  UserLogin userLogin = UserLogin();
  String mensajeNotification = "Error";
  bool isLoading = false;

  final GetxUtils messageController = Get.put(GetxUtils());

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
      body: bodyLogin(),
    );
  }

  Widget bodyLogin() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/Img/background-login.png'),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: titleLogin(),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: _formLogin()),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: _btnGoogle(),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget titleLogin() {
    return Column(
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
    );
  }

  Widget _formLogin() {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            _textFormFielWidget(
                _emailL,
                const FaIcon(
                  FontAwesomeIcons.envelope,
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
                const FaIcon(
                  FontAwesomeIcons.lock,
                  color: AppBasicColors.black,
                ),
                'Contraseña',
                true,
                'Error, Digite una contraseña',
                TextInputType.text),
            const SizedBox(
              height: 13,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                  style: Constants.buttonPrimary,
                  onPressed: () {
                    getLoginUser(_emailL.text, _passwordL.text);
                  },
                  child: isLoading
                      ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 20.0,
                            width: 20.0,
                            child: CircularProgressIndicator(
                                color: Colors.white),
                          ),
                          SizedBox(width: 10.5),
                          Text("Iniciando sesion")
                        ],
                      ))
                      : Center(child: Text("Iniciar"))),
            ),
            _optionSesion()
          ],
        ));
  }

  getLoginUser(String correo, String contrasena) {
    final bool isValidEmail = EmailValidator.validate(correo);

    if (_formkey.currentState!.validate() && isValidEmail) {
      setState(() {
        isLoading = true;
      });

      userLogin.correo = correo;
      userLogin.contrasena = contrasena;
      _firebaseLogin.getLogin(userLogin)
          .then((value) => {
        print("Inicio de sesion Correcto.")

      })
          .catchError((onError) {
        if (onError == "wrong-password") {
          mensajeNotification = "Contraseña incorrecta";
        } else if (onError == "user-not-found") {
          mensajeNotification = "Email no existe.";
        } else {
          mensajeNotification = onError.toString();
        }

        print("Error: $onError");
        messageController.messageError("Validacion", mensajeNotification);
      });
    }

    setState(() {
      isLoading = false;
    });
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

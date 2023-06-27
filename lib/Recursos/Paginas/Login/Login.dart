import 'package:app_turismo_usuario/Recursos/Entity/UserLogin.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Login/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Home/home.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Constans.dart';
import 'package:app_turismo_usuario/Recursos/utils/GextUtils.dart';
import 'package:app_turismo_usuario/main.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_theme.dart';
import '../Registrar/Registrar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailL = TextEditingController();
  final TextEditingController _passwordL = TextEditingController();

  String mensajeNotificacion = "Error";

  final ControllerLogin _controllerLogin = getIt();
  UserLogin userLogin = UserLogin();
  String mensajeNotification = "Error";
  bool isLoading = false;

  final GetxUtils messageController = Get.put(GetxUtils());

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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage(
                        'Assets/Img/background-login.png',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: titleLogin(),
                  ),
                  SizedBox(
                      //width: MediaQuery.of(context).size.width * 0.9,
                      child: _formLogin()),
                  SizedBox(
                    //width: MediaQuery.of(context).size.width * 0.9,
                    child: _btnGoogle(),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget titleLogin() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(94.0, 70.0, 94.0, 0),
      child: Column(
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
      ),
    );
  }

  Widget _formLogin() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Form(
          key: _formkey,
          child: Column(
            children: [
              _textFormFielWidget(
                  _emailL,
                  BootstrapIcons.envelope,
                  'Correo',
                  false,
                  'Error, compruebe el correo',
                  TextInputType.emailAddress),
              const SizedBox(
                height: 13,
              ),
              //TextFormField Contraseña
              _textFormFielWidget(_passwordL, BootstrapIcons.lock, 'Contraseña',
                  true, 'Error, Digite una contraseña', TextInputType.text),
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
                      Get.to(const Home());
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
                        : const Center(child: Text("Iniciar"))),
              ),
              const SizedBox(height: 18.0),
              _optionSesion()
            ],
          )),
    );
  }

  getLoginUser(String correo, String contrasena) {
    final bool isValidEmail = EmailValidator.validate(correo);

    if (_formkey.currentState!.validate() && isValidEmail) {
      setState(() {
        isLoading = true;
      });

      userLogin.email = correo;
      userLogin.password = contrasena;
      _controllerLogin
          .validateLoginUser(userLogin)
          .then((value) => {print("Inicio de sesion Correcto.")})
          .catchError((onError) {
        if (onError == "wrong-password") {
          mensajeNotification = "Contraseña incorrecta";
        } else if (onError == "user-not-found") {
          mensajeNotification = "Email no existe.";
        } else {
          mensajeNotification = onError.toString();
        }

        messageController.messageError("Validacion", mensajeNotification);
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  Widget _btnGoogle() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 90, 10, 0),
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
      IconData icono,
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
            child: Icon(
              icono,
              color: AppBasicColors.black,
            ),
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
          errorStyle: const TextStyle(color: AppBasicColors.white)),
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

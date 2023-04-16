import 'package:app_turismo_usuario/Recursos/Paginas/Login/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Menu/Menu.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Constans.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Gradient_Header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
        body: Stack(
      children: [
        const GradientHeader(),
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              _tituloLogin(),
              _imagenLogo(),
              _formLogin()
            ],
          ),
        )
      ],
    ));
  }

  Widget _imagenLogo() {
    return SafeArea(
      top: false,
      child: Image.asset(
        'Assets/Img/Logo.png',
        //width: MediaQuery.of(context).size.width * 0.85,
        width: 260,
        height: 260,
      ),
    );
  }

  Widget _tituloLogin() {
    return const SafeArea(
      //minimum: EdgeInsets.only(top: 20.0,),
      child: Text(
        'App Turismo',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      ),
    );
  }

  Widget _formLogin() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        shadowColor: Colors.black,
        child: Form(
          key: _formkey,
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Bienvenido',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Digite datos para Iniciar Sesión',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                //Titulo email
                Row(
                  children: const [
                    Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                //TextFormField Email
                _textFormFielWidget(
                    _emailL,
                    const FaIcon(
                      FontAwesomeIcons.envelope,
                      color: Colors.green,
                    ),
                    'Ingrese Email',
                    false,
                    'Error, compruebe el correo',
                    TextInputType.emailAddress),
                const SizedBox(
                  height: 8.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //titulo contraseña
                Row(
                  children: const [
                    Text('Contraseña',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                //TextFormField contraseña
                _textFormFielWidget(
                    _passwordL,
                    const FaIcon(
                      FontAwesomeIcons.lock,
                      color: Colors.green,
                    ),
                    'Ingrese la contraseña',
                    true,
                    'Error, Digite una contraseña',
                    TextInputType.text),
                const SizedBox(
                  height: 5.0,
                ),
                //registrarme y olvido contraseña
                _optionSesion(),
                const SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                    style: Constants.buttonPrimary,
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        controllerLogin
                            .getLogin(_emailL.text, _passwordL.text)
                            .then((value) => {
                                  if (controllerLogin.email != 'Sin Registro' &&
                                      controllerLogin.password != "")
                                    {Get.to(() => Menu())}
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
                              const Icon(Icons.error), Colors.red);
                        });
                      }
                    },
                    child: const Text('Iniciar Sesión')),
                const Padding(padding: EdgeInsets.all(10)),
              ],
            ),
          ),
        ),
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
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
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
      cursorColor: Colors.green.shade300,
    );
  }

  Widget _optionSesion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: () {
            // Get.to(Registrar());
          },
          child: const Text(
            'Registrarme',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
        const InkWell(
          onTap: null,
          child: Text(
            '¿Olvidaste contraseña?',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
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

    /* Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        //border: Border.all(color: Colors.green, width: 0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: _textFormFielWidget(
                        _passwordL,
                        const FaIcon(
                          FontAwesomeIcons.lock,
                          color: Colors.green,
                        ),
                        'Ingrese la contraseña',
                        true,
                        'Error, Digite una contraseña',
                        TextInputType.text))*/

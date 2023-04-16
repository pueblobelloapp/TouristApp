import 'package:app_turismo_usuario/Recursos/Paginas/Login/LoginControllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  ControllerLogin controllerLogin = Get.find();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(),
    );
  }
}

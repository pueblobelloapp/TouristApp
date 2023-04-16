import 'package:app_turismo_usuario/Recursos/Paginas/myApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Recursos/Paginas/Login/LoginControllers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ControllerLogin());
  runApp(MyApp());
}

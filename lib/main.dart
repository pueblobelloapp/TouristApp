import 'package:app_turismo_usuario/Recursos/DataSource/DataFirebaseLogin.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/myApp.dart';
import 'package:app_turismo_usuario/Recursos/Repository/Implementacion/RepositoryLoginImp.dart';
import 'package:app_turismo_usuario/Recursos/Repository/RepositoryLogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Recursos/Paginas/Login/LoginControllers.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await injectDependencies();
  Get.put(ControllerLogin());
  runApp(MyApp());
}

Future<void> injectDependencies() async {
  //Data Source
  getIt.registerLazySingleton(() => FirebaseLogin());

  //Controllers
  getIt.registerLazySingleton(() => ControllerLogin());

  //Repositorios
  getIt.registerLazySingleton<RepositoryLogin>(() => RepositoryLoginImp());
}
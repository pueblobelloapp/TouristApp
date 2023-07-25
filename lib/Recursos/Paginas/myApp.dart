import 'package:app_turismo_usuario/Recursos/Paginas/Home/home.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Login/Login.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Mapa/Mapa.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/My_location/my_location.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/SplashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

//import 'Sitios_turistico/sitios_turistico.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Turismo',
      theme: ThemeData(fontFamily: 'Century'),
      initialRoute: 'Home',
      routes: {
        'SplashScreen': (context) => SplashScreen(),
        'MyLocation': (context) => MyLocation(),
        'Login': (context) => Login(),
        'Home': (context) => Home(),
        'Mapa': (context) => MapaPage(),
        //'Arhuaco': (context) => ArhuacoPage(),
        //'Sitio Turistico': (context) => SitiosTuristicoPage()
      },
    );
  }
}

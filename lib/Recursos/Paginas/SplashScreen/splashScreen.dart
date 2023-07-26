// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'package:app_turismo_usuario/Recursos/Paginas/My_location/my_location.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // late Timer _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // Creamos una animación Tween que va de 0 a 1, y la vinculamos al controlador de animación.
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 2), () {
            _onShowLogin();
          });
        }
      });
    _animationController.forward();

    //_timer = Timer(const Duration(seconds: 3), _onShowLogin);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _animationController.dispose();
    //_timer.cancel();
  }

  void _onShowLogin() {
    if (mounted) {
      Get.to(
        MyLocation(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppBasicColors.rgb,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.scale(
                scale: _animation == null ? 0.3 : _animation.value,
                child: const Text(
                  'IKU',
                  style: TextStyle(fontSize: 60, 
                  fontWeight: FontWeight.bold, 
                  color: AppBasicColors.white //color negro cambiado a blanco
                  ),
                ),
              ),
              Transform.scale(
                scale: _animation == null ? 1.0 : _animation.value,
                child: const Text('Pueblo Bello',
                    style: TextStyle(
                      fontSize: 20, //fontWeight:FontWeight.bold
                      color: AppBasicColors.white//color negro cambiado a blanco
                    )),
              )
            ],
          ),
        ));
  }
}

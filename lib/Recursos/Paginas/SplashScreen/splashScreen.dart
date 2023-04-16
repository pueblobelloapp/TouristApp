import 'dart:async';

import 'package:app_turismo_usuario/Recursos/Paginas/My_location/my_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          Future.delayed(const Duration(seconds: 4), () {
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
    _animationController.dispose();
    //_timer.cancel();
  }

  void _onShowLogin() {
    if (mounted) {
      Get.to(MyLocation());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(125, 164, 83, 9.0),
          Color.fromRGBO(242, 238, 237, 0.0)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            children: [
              Center(
                  child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.symmetric(vertical: 110)),
                  Transform.scale(
                    scale: _animation == null ? 1.0 : _animation.value,
                    child: const Text(
                      'Turismo App',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 4),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.all(00.0),
                    width: _animation == null
                        ? MediaQuery.of(context).size.width * 0.85
                        : _animation.value *
                            MediaQuery.of(context).size.width *
                            0.85,
                    height: _animation == null
                        ? MediaQuery.of(context).size.width * 0.85
                        : _animation.value *
                            MediaQuery.of(context).size.width *
                            0.85,
                    decoration: const BoxDecoration(
                        //color: Colors.amber,
                        image: DecorationImage(
                            image: AssetImage(
                              'Assets/Img/Logo.png',
                            ),
                            fit: BoxFit.contain)),
                  ),
                  const SizedBox(height: 40),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

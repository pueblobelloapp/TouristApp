import 'package:app_turismo_usuario/Recursos/Paginas/My_location/my_location_controller.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Constans.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Widget/Gradient_Header.dart';

class MyLocation extends StatefulWidget {
  MyLocation({super.key});

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put<MyLocationController>(MyLocationController());
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            const GradientHeader(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.locationDot,
                    size: 60,
                    color: AppBasicColors.green,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Obx(
                      () => Text(
                        controller.message.value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                      style: Constants.buttonPrimary,
                      onPressed: () {
                        controller.activeteLocation();
                      },
                      child: const Text('Solicitar acceso'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

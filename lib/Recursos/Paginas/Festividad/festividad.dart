import 'package:app_turismo_usuario/Recursos/Paginas/Festividad/festividad_controller.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Gradient_Header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/CustomHeader.dart';

class FestividadPage extends GetView<FestividadController> {
  const FestividadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const GradientHeader(),
        _headerImage(),
        const Center(
          child: Text('Festividad Page'),
        )
      ],
    ));
  }

  Widget _headerImage() {
    return Container(
      height: 100,
      child: CustomHeader(100),
    );
  }
}

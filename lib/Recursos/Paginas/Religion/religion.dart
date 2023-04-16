import 'package:app_turismo_usuario/Recursos/Paginas/Religion/religion_controller.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Gradient_Header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/CustomHeader.dart';

class ReligionPage extends GetView<ReligionController> {
  const ReligionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const GradientHeader(),
        _headerImage(),
        const Center(
          child: Text('Religion Page'),
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

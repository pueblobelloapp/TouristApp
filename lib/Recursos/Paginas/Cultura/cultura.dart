import 'package:app_turismo_usuario/Recursos/Paginas/Cultura/cultura_controller.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Gradient_Header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Widget/CustomHeader.dart';

class CulturaPage extends GetView<CulturaController> {
  const CulturaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: const Text(
          'Cultura',
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.black87,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          //const GradientHeader(),
          _headerImage(),
          const Center(
            child: Text('Cultura Page'),
          )
        ],
      ),
    );
  }

  Widget _headerImage() {
    return Container(
      height: 100,
      child: CustomHeader(100),
    );
  }
}

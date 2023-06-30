import 'package:app_turismo_usuario/Recursos/Modelos/Card/card_image_list.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Mapa/Mapa.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Sitio/sitio_controller.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Bton_heart_container.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Widget/Constans.dart';
//import '../../Widget/CustomHeader.dart';
import '../Mapa/MapaController.dart';

class SitioPage extends GetView<SitioController> {
  SitioPage({super.key});

  final MapaController mapaController = Get.put(MapaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            BootstrapIcons.arrow_left,
            color: AppBasicColors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Turismo App',
          style: TextStyle(
              color: AppBasicColors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              // _headerImage(),
            ],
          ),
          const CardImageList(),
          Align(
              alignment: Alignment.bottomCenter,
              child: _descripcionSitio(context))
        ],
      ),
    );
  }

  Widget _descripcionSitio(context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 410.0,
        decoration: const BoxDecoration(
          color: AppBasicColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Text(
                      'Casa Campo Helenita',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Icon(
                      BootstrapIcons.geo,
                      color: AppBasicColors.lightGreen,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const Expanded(
                      child: Text(
                        'Pueblo Bello',
                        style: TextStyle(
                            color: AppBasicColors.lightGrey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    _btonStars(),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare felis tristique semper mi, ultrices feugiat',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Tipo de Turismo:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Rural',
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Actividades:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      ' Lorem ipsum dolor sit amet',
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                /* Row(
                  children: const [
                    Text(
                      'Ubicación:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '41° 24' '´' '12.2' '°N2°10' '26.5' 'E ',
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),*/
                Row(
                  children: const [
                    Text(
                      'Gerente:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Roberto Amaris',
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Contacto:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '3025681423',
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _btonIrSitio(),
                ),
              ],
            ),
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(MediaQuery.of(context).size.width * 0.9 - 30.0, -25.0),
        child: Transform.scale(scale: 1.2, child: const ButtonHeartContainer()),
      )
    ]);
  }

  Widget _btonIrSitio() {
    return ElevatedButton(
        style: Constants.buttonPrimary,
        onPressed: () {
          // mapaController.goToLocation(const LatLng(10.4127663, -73.5866711));
          Get.to(MapaPage());
        },
        child: const Text('Ir al sitio'));
  }

  Widget _btonStars() {
    final stars = Container(
      //color: Colors.black38,
      margin: const EdgeInsets.only(top: 0, right: 3.0),
      child: const Icon(
        Icons.star,
        color: AppBasicColors.hellow,
      ),
    );

    final star_border = Container(
      //color: Colors.black38,
      margin: const EdgeInsets.only(top: 0.0, right: 3.0),
      child: const Icon(
        Icons.star_border,
        color: AppBasicColors.hellow,
      ),
    );

    return Row(
      children: [stars, stars, stars, stars, star_border],
    );
  }

  /*Widget _headerImage() {
    return Container(
      height: 100,
      child: CustomHeader(100),
    );
  }*/
}

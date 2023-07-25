import 'package:app_turismo_usuario/Recursos/Modelos/Card/card_image_list.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Mapa/Mapa.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Opinion/Opinion.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Sitio/sitio_controller.dart';
import 'package:app_turismo_usuario/Recursos/Widget/ContainerText.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Custom_person_container.dart';
import 'package:app_turismo_usuario/Recursos/Widget/custom_back_button.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../Mapa/MapaController.dart';

class SitioPage extends GetView<SitioController> {
  SitioPage({super.key});

  final MapaController mapaController = Get.put(MapaController());

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'Assets/Img/sitiocard.png',
      'Assets/Img/Helenita.jpeg',
      'Assets/Img/sitiocard.png',
      'Assets/Img/Helenita.jpeg'
    ];

    return Scaffold(
      body: Column(
        children: [
          _containerPhoto(imagePaths),
          Expanded(
              child: SingleChildScrollView(
            child: _containerDescripcion(context),
          ))
        ],
      ),
      floatingActionButton: SpeedDial(
        //animatedIcon: AnimatedIcons.view_list,
        activeIcon: BootstrapIcons.x_lg,
        activeBackgroundColor: AppBasicColors.redInst,
        closeManually: true,
        //buttonSize: 55.0,
        children: [
          SpeedDialChild(
              child: const Icon(
                BootstrapIcons.whatsapp,
                color: AppBasicColors.white,
              ),
              backgroundColor: AppBasicColors.greenWhat,
              onTap: () {}),
          SpeedDialChild(
              child: const Icon(BootstrapIcons.instagram,
                  color: AppBasicColors.white),
              backgroundColor: AppBasicColors.redInst,
              onTap: () {}),
          SpeedDialChild(
              child: const Icon(
                BootstrapIcons.messenger,
                color: AppBasicColors.white,
              ),
              backgroundColor: AppBasicColors.blueMess,
              onTap: () {}),
          SpeedDialChild(
              child: const Icon(
                BootstrapIcons.facebook,
                color: AppBasicColors.white,
              ),
              backgroundColor: AppBasicColors.purpFace,
              onTap: () {}),
          SpeedDialChild(
              child: const Icon(
                BootstrapIcons.twitter,
                color: AppBasicColors.white,
              ),
              backgroundColor: AppBasicColors.blueTwit,
              onTap: () {})
        ],
        backgroundColor: AppBasicColors.rgb,
        child: const Icon(
          BootstrapIcons.telephone,
          color: AppBasicColors.white,
        ),
      ),
    );
  }

  Widget _containerPhoto(List<String> imagePaths) {
    return Stack(
      children: [
        SafeArea(
            child: CardImageList(
          imageList: imagePaths,
        )),
        _btnArrowBack()
      ],
    );
  }

  Widget _btnArrowBack() {
    return CustomBackButton(onPressed: () {
      Get.back();
    });
  }

  Widget _containerDescripcion(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Título',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta dignissimos numquam hic deserunt asperiores id obcaecati dicta repudiandae nihil magnam neque nostrum laborum, ullam distinctio voluptatem tenetur eveniet blanditiis ducimus.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          _myLocation(),
          WidgetText(
            text: 'Opiniones',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const Align(
                        //alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                            widthFactor: 15.0, child: Opinion()));
                  });
            },
            buttonText: 'Calificar',
            buttonFontSize: 20.0,
          ),
          const CustomPersonContainer(
              icon: BootstrapIcons.person,
              name: 'Nombre completo',
              starCount: 5,
              containerIconColor: AppBasicColors.colorButtonCancelar,
              starColor: AppBasicColors.yellow),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta dignissimos numquam hic deserunt asperiores id obcaecati dicta repudiandae nihil magnam neque nostrum laborum, ullam distinctio voluptatem tenetur eveniet blanditiis ducimus.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const CustomPersonContainer(
              icon: BootstrapIcons.person,
              name: 'Nombre completo',
              starCount: 5,
              containerIconColor: AppBasicColors.colorButtonCancelar,
              starColor: AppBasicColors.yellow),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta dignissimos numquam hic deserunt asperiores id obcaecati dicta repudiandae nihil magnam neque nostrum laborum, ullam distinctio voluptatem tenetur eveniet blanditiis ducimus.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _myLocation() {
    return SizedBox(
      width: 450.0,
      height: 273.0,
      child: MapaPage(),
    );
  }

}

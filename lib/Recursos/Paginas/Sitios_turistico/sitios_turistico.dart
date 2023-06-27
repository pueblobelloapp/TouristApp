import 'package:app_turismo_usuario/Recursos/Modelos/Card_model/Card_model.dart';
import 'package:app_turismo_usuario/Recursos/Modelos/Card_model/card_model_sitio.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Sitio/sitio.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Sitios_turistico/sitios_turistico_Controller.dart';
import 'package:app_turismo_usuario/Recursos/Widget/CustomHeader.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SitiosTuristicoPage extends GetView<SitiosTuristicoController> {
  SitiosTuristicoPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CardModel> cardModel = [
      CardModel(
          imagenPath: 'Assets/Img/Helenita.jpeg',
          titulo: 'Helenita',
          icono: BootstrapIcons.eye,
          onPreseed: (() {
            Get.to(() => SitioPage());
          })),
      CardModel(
          imagenPath: 'Assets/Img/Bonita.jpeg',
          titulo: 'Bonita',
          icono: BootstrapIcons.eye,
          onPreseed: (() {})),
      CardModel(
          imagenPath: 'Assets/Img/Bonita.jpeg',
          titulo: 'Hostal',
          icono: BootstrapIcons.eye,
          onPreseed: (() {})),
      CardModel(
          imagenPath: 'Assets/Img/Bonita.jpeg',
          titulo: 'Hostal',
          icono: BootstrapIcons.eye,
          onPreseed: (() {}))
    ];

    return Scaffold(
        appBar: AppBar(
          //foregroundColor: Colors.transparent,
          backgroundColor: Colors.green.shade600,
          //automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              BootstrapIcons.arrow_left,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text(
            'Sitios Turistico',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Stack(
          //alignment: Alignment.bottomCenter,
          children: [
            _headerImage(),
            _listCardModelSitio(cardModel),
            const SizedBox(
              height: 25.0,
            ),
            //_btonAtras()
          ],
        ));
  }
}

Widget _listCardModelSitio(cardModel) {
  return Container(
    width: double.infinity,
    child: Expanded(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ...cardModel
              .map((cardModel) => CardModelWidget(cardModel: cardModel))
              .toList(),
        ],
      ),
    ),
  );
}

/*Widget _listTitle(
    Image image, String titulo, String subtitulo, IconButton iconButton) {
  return ListTile(
    leading: image,
    title: Text(
      titulo,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      subtitulo,
      textAlign: TextAlign.center,
    ),
    trailing: iconButton,
    iconColor: Colors.green.shade600,
  );
}*/

Widget _headerImage() {
  return Container(
    height: 100,
    child: CustomHeader(100),
  );
}

import 'package:app_turismo_usuario/Recursos/Paginas/Cultura/Cultura.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Festividad/festividad.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Gastronom%C3%ADa/gastronomia.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Religion/religion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Modelos/Card_model/card_model_list.dart';
import '../../Widget/CustomHeader.dart';
import '../../Widget/Gradient_Header.dart';
import '../Sitios_turistico/sitios_turistico.dart';
import 'HomeController.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    List<CardModelList> cardModelslist = [
      CardModelList(
          title: 'Sitio Turistico',
          iconData: FontAwesomeIcons.chevronDown,
          onPressed: () {
            Get.to(() => SitiosTuristicoPage());
          }),
      CardModelList(
          title: 'Cultura',
          iconData: FontAwesomeIcons.chevronDown,
          onPressed: (() {
            Get.to(() => const CulturaPage());
          })),
      CardModelList(
          title: 'Gastronomía',
          iconData: FontAwesomeIcons.chevronDown,
          onPressed: (() {
            Get.to(() => const GastronomiaPage());
          })),
      CardModelList(
          title: 'Festividad',
          iconData: FontAwesomeIcons.chevronDown,
          onPressed: (() {
            Get.to(() => const FestividadPage());
          })),
      CardModelList(
          title: 'Religión',
          iconData: FontAwesomeIcons.chevronDown,
          onPressed: (() {
            Get.to(() => const ReligionPage());
          }))
    ];

    return Scaffold(
        //backgroundColor: Colors.grey.shade200,
        body: Stack(
      children: [
        const GradientHeader(),
        _headerImage(),
        __cardList(cardModelslist),
        // _ListaCardTipoTurismo()
      ],
    ));
  }

  Widget __cardList(cardModelsList) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const SizedBox(
          height: 100.0,
        ),
        ...cardModelsList.map((cardModel) => CardList(
              cardModelList: cardModel,
            ))
      ],
    );
  }

  Widget _headerImage() {
    return Container(
      height: 100,
      child: CustomHeader(100),
    );
  }
}

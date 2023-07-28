import 'package:app_turismo_usuario/Recursos/Paginas/Lista_sitio/Site_listController.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Custom_elevated_button.dart';
import 'package:app_turismo_usuario/Recursos/Widget/custom_back_button.dart';
import 'package:app_turismo_usuario/Recursos/Widget/custom_textFormField.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Modelos/Tarjeta_turistica/tarjeta_turistica.dart';
import '../../Modelos/Tarjeta_turistica/tarjeta_turistica_controller.dart';
import '../../Widget/PopUpMenuUsuario.dart';

class SiteList extends GetView<SiteListController> {

  final bool esBuscar;
  final controller = Get.put<SiteListController>(SiteListController());

  SiteList({super.key, this.esBuscar = false, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: SizedBox(
                        height: 30.0,
                        child: CustomTextFormField(
                          icon: const Icon(
                            BootstrapIcons.search,
                            color: AppBasicColors.white,
                            size: 15.0,
                          ),
                          controller: controller.search,
                          textGuide: 'Buscar...',
                          obscureText: false,
                          contentPadding:const EdgeInsets.only(top: 8, bottom: 6),
                          fillColor: const Color.fromRGBO(178, 190, 195, 1),
                        ))),
                const SizedBox(
                  width: 5.0,
                ),
                Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(45, 52, 54, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: const PopUpMenuPerfil()),
              ],
            ),
          ),
        ),
      ),
        //backgroundColor: AppBasicColors.greyMun,
        body: Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 9.0),
          //   child: __bodyContainer(context),
          // ),
          Expanded(
              child: SingleChildScrollView(
            child: _listTurismo(esBuscar: esBuscar),
          ))
          /* Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 145.0,
              child: SingleChildScrollView(child: _listTurismo()),
            ),
          )*/
        ],
      ),
    ));
  }
}

// Widget __bodyContainer(BuildContext context) {
//   final controller = Get.put<SiteListController>(SiteListController());

//   return Stack(children: [
//     SafeArea(
//         child: Column(
//       children: [
//         Row(
//           children: <Widget>[
//             Expanded(
//                 child: SizedBox(
//               height: 30.0,
//               child: CustomTextFormField(
//                 controller: controller.search,
//                 icon: const Icon(
//                   BootstrapIcons.search,
//                   color: AppBasicColors.white,
//                   size: 15.0,
//                 ),
//                 textGuide: 'Buscar...',
//                 obscureText: false,
//                 textInputType: TextInputType.name,
//                 contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
//                 fillColor: const Color.fromRGBO(178, 190, 195, 1),
//               ),
//             )),
//             const SizedBox(
//               width: 5.0,
//             ),
//             Container(
//                 height: 30.0,
//                 width: 30.0,
//                 decoration: const BoxDecoration(
//                   color: Color.fromRGBO(45, 52, 54, 1),
//                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                 ),
//                 child: const PopUpMenuPerfil())
//           ],
//         ),
//         // const SizedBox(height: 12.0),
//         // _buildButtonRow(),
//         // const SizedBox(height: 12.0),
//       ],
//     )),
//   ]);
// }

Widget _listTurismo({bool esBuscar = false }) {
  final TarjetaTuristicaController tarjetaTuristicaController =
      Get.put(TarjetaTuristicaController());

  return Column(
    children: [
      Row(
        children: [
          CustomBackButton(onPressed: () {
            Get.back();
          }),
          Container(
            margin: const EdgeInsets.only(top: 0, left: 5.0),
            child: Text(
              esBuscar ? 'Buscar' :'Nombre de la categoria',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 5.0,
      ),
      const SizedBox(
        child: TarjetaTuristica(
            titulo: 'Titulo',
            icono: BootstrapIcons.star_fill,
            descripcion:
                'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            imageUrl: 'Assets/Img/sitiocard.png'),
      ),
      const SizedBox(
        child: TarjetaTuristica(
            titulo: 'Titulo',
            icono: BootstrapIcons.star_fill,
            descripcion:
                'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            imageUrl: 'Assets/Img/sitiocard.png'),
      ),
      const SizedBox(
        child: TarjetaTuristica(
            titulo: 'Titulo',
            icono: BootstrapIcons.star_fill,
            descripcion:
                'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            imageUrl: 'Assets/Img/sitiocard.png'),
      ),
      const SizedBox(
        child: TarjetaTuristica(
            titulo: 'Titulo',
            icono: BootstrapIcons.star_fill,
            descripcion:
                'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            imageUrl: 'Assets/Img/sitiocard.png'),
      ),
    ],
  );
}


Widget _buildButtonRow() {
  final buttons = [
    CustomElevatedButton(
        fontWeight: FontWeight.bold,
        fixedSize: true,
        text: 'Sub Categoría',
        onPressed: () {}),
    const SizedBox(
      width: 10.0,
    ),
    CustomElevatedButton(
        fontWeight: FontWeight.bold,
        fixedSize: true,
        text: 'Sub Categoría',
        onPressed: () {}),
    /* CustomRowButton(
      color: AppBasicColors.blue,
      //icon: BootstrapIcons.book,
      text: 'Sub Categoría',
      //textSize: 24.0,
      textColor: AppBasicColors.white,
      onPressed: () {},
    ),*/

    /*CustomRowButton(
      color: AppBasicColors.blue,
      //icon: BootstrapIcons.brightness_alt_high,
      text: 'Sub Categoría',
      // textSize: 24.0,
      textColor: AppBasicColors.white,
      onPressed: () {},
    ),*/
  ];
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: buttons.map((button) => button).toList()),
  );
}

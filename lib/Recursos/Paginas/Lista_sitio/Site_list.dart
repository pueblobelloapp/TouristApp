import 'dart:math';

import 'package:app_turismo_usuario/Recursos/Paginas/Lista_sitio/Site_listController.dart';
import 'package:app_turismo_usuario/Recursos/Widget/custom_back_button.dart';
import 'package:app_turismo_usuario/Recursos/Widget/custom_textFormField.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Modelos/Tarjeta_turistica/tarjeta_turistica.dart';
import '../../Modelos/Tarjeta_turistica/tarjeta_turistica_controller.dart';
import '../../Widget/ContainerText.dart';
import '../../Widget/Custom_row_button.dart';
import '../Perfil/Perfil.dart';
import '../Recuperar_contrasena/RecuperarContrasena.dart';

class SiteList extends GetView<SiteListController> {
  const SiteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: AppBasicColors.greyMun,
        body: Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: __bodyContainer(context),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 145.0,
              child: SingleChildScrollView(child: _listTurismo()),
            ),
          )
        ],
      ),
    ));
  }
}

Widget __bodyContainer(BuildContext context) {
  final controller = Get.put<SiteListController>(SiteListController());

  return SafeArea(
      child: Column(
    children: [
      Row(
        children: <Widget>[
          Expanded(
              child: Container(
            height: 30.0,
            child: CustomTextFormField(
              controller: controller.search,
              icon: const Icon(
                BootstrapIcons.search,
                color: AppBasicColors.white,
                size: 15.0,
              ),
              textGuide: 'Buscar...',
              obscureText: false,
              textInputType: TextInputType.name,
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
              fillColor: const Color.fromRGBO(178, 190, 195, 1),
            ),
          )),
          const SizedBox(
            width: 5.0,
          ),
          Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(45, 52, 54, 1),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: _popupMenuProfile(context))
        ],
      ),
      const SizedBox(height: 12.0),
      _buildButtonRow()
    ],
  ));
}

Widget _listTurismo() {
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
            margin: const EdgeInsets.only(top: 12),
            child: const Text(
              'Nombre de la categoria',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
          )
        ],
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

Widget _popupMenuProfile(BuildContext context) {
  return PopupMenuButton(
    icon: Transform.scale(
      scale: 1.6,
      child: const Icon(
        BootstrapIcons.person,
        color: AppBasicColors.white,
      ),
    ),
    iconSize: 14.0,
    itemBuilder: (BuildContext context) {
      return <PopupMenuEntry>[
        PopupMenuItem(
          value: 1,
          child: Container(
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: ListTile(
              leading: Container(
                height: 30.0,
                width: 30.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(45, 52, 54, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: const Icon(
                  BootstrapIcons.person,
                  color: AppBasicColors.white,
                  //size: 15.0,
                ),
              ),
              title: const Text(
                'Mi perfil',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Container(
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: ListTile(
              leading: Container(
                height: 30.0,
                width: 30.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(45, 52, 54, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: const Icon(
                  BootstrapIcons.lock,
                  color: AppBasicColors.white,
                ),
              ),
              title: const Text(
                'Cambiar clave',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Container(
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: ListTile(
              leading: Container(
                height: 30.0,
                width: 30.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(45, 52, 54, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: const Icon(
                  BootstrapIcons.power,
                  color: AppBasicColors.white,
                ),
              ),
              title: const Text(
                'Cerrar sesión',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ];
    },
    onSelected: (value) {
      switch (value) {
        case 1:
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ProfileDialog();
              });
          break;
        case 2:
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const RecoveryPassword();
              });
          break;
        case 3:
          //ControllerLogin().logout();
          //Get.find<ControllerLogin>().logout();
          break;
      }
    },
  );
}

Widget _buildButtonRow() {
  final buttons = [
    CustomRowButton(
      color: AppBasicColors.blue,
      //icon: BootstrapIcons.book,
      text: 'Sub Categoría',
      //textSize: 24.0,
      textColor: AppBasicColors.white,
      onPressed: () {},
    ),
    const SizedBox(
      width: 10.0,
    ),
    CustomRowButton(
      color: AppBasicColors.blue,
      //icon: BootstrapIcons.brightness_alt_high,
      text: 'Sub Categoría',
      // textSize: 24.0,
      textColor: AppBasicColors.white,
      onPressed: () {},
    ),
    const SizedBox(
      width: 10.0,
    ),
  ];
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: buttons.map((button) => button).toList()),
  );
}

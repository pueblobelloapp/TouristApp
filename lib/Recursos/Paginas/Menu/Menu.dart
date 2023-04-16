import 'package:app_turismo_usuario/Recursos/Paginas/Arhuaco/arhuaco.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Menu/MenuController.dart';

import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Widget/CustomHeader.dart';
import '../Home/Home.dart';
import '../Mapa/Mapa.dart';
import '../Perfil/Perfil.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MenuController menuController = Get.put(MenuController());
    return GetBuilder<MenuController>(builder: (controller) {
      return Scaffold(
        /*appBar: AppBar(
          backgroundColor: Colors.green.shade600,
          elevation: 0.0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                )),
          ],
          title: const Text(
            'App Turismo',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        )*/
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomePage(),
              MapaPage(),
              ArhuacoPage(),
              PerfilPage(),
            ],
          ),
        ),
        bottomNavigationBar: FloatingNavbar(
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          items: [
            FloatingNavbarItem(icon: FontAwesomeIcons.house, title: 'Inicio'),
            FloatingNavbarItem(
                icon: FontAwesomeIcons.mapLocationDot, title: 'Mapa'),
            FloatingNavbarItem(
                icon: FontAwesomeIcons.featherPointed, title: 'Arhuaco'),
            FloatingNavbarItem(icon: FontAwesomeIcons.userGear, title: 'Perfil')
          ],
          backgroundColor: AppBasicColors.green, //Colors.green.shade300, //
          borderRadius: 30,
          itemBorderRadius: 25,
          selectedBackgroundColor: AppBasicColors.lightWhite,
          selectedItemColor: AppBasicColors.white,
          unselectedItemColor: AppBasicColors.lightBlack,
          iconSize: 20,
        ),
        /*bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.house), label: 'Inicio'),
                BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.mapLocationDot), label: 'Mapa'),
                BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.featherPointed),
                    label: 'Arhuaco'),
                BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.userGear), label: 'Perfil')
              ],
              currentIndex: controller.tabIndex,
              onTap: controller.changeTabIndex,
              backgroundColor: const Color(0xFFAED581),
            )*/
      );
      // SafeArea(child: _headerImage()),
    });
  }
}

Widget _headerImage() {
  return Container(
    height: 100,
    child: CustomHeader(100),
  );
}

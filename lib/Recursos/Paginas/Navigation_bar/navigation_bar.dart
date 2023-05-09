import 'package:app_turismo_usuario/Recursos/Paginas/Arhuaco/arhuaco.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Home/Home.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Mapa/Mapa.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Navigation_bar/NavigationController.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Perfil/Perfil.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class navigationBar extends StatefulWidget {
  //const navigationBar({super.key});

  @override
  State<navigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<navigationBar> {
  final NavigationController navigationController =
      Get.put(NavigationController());

  final bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth < 600 ? 24.0 : 32.0;
    final fontSize = screenWidth < 600 ? 11.0 : 12.0;
    return GetBuilder<NavigationController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomePage(),
            MapaPage(),
            ArhuacoPage(),
            PerfilPage(),
          ],
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Stack(children: [
          Container(
            decoration: BoxDecoration(
                color: AppBasicColors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppBasicColors.lightGrey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0.5,
                    offset: const Offset(0, -5),
                  ),
                ]),
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(alignment: Alignment.centerRight, children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 24.0
                              : 28.0,
                          bottom: 68.0),
                      width: 28,
                      child: Positioned(
                          //bottom: 66,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                                color: controller.tabIndex == 0
                                    ? AppBasicColors.lightGreen
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ),
                    MaterialButton(
                      minWidth: 0,
                      height: MediaQuery.of(context).size.width / 4,
                      onPressed: () {
                        setState(() {
                          controller.tabIndex = 0;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.house,
                              size: iconSize,
                              color: controller.tabIndex == 0
                                  ? AppBasicColors.lightGreen
                                  : AppBasicColors.lightGrey,
                            ),
                            Text(
                              'Inicio',
                              style: TextStyle(
                                  fontSize: fontSize,
                                  color: controller.tabIndex == 0
                                      ? AppBasicColors.green
                                      : AppBasicColors.lightGrey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 0.5
                              : 0.5,
                          bottom: 68.0),
                      width: 28,
                      child: Positioned(
                          //bottom: 66,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                                color: controller.tabIndex == 1
                                    ? AppBasicColors.lightGreen
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ),
                    MaterialButton(
                      minWidth: 0,
                      height: 60,
                      onPressed: () {
                        setState(() {
                          controller.tabIndex = 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.mapLocation,
                              size: iconSize,
                              color: controller.tabIndex == 1
                                  ? AppBasicColors.lightGreen
                                  : AppBasicColors.lightGrey,
                            ),
                            Text(
                              'Mapa',
                              style: TextStyle(
                                  fontSize: fontSize,
                                  color: controller.tabIndex == 1
                                      ? AppBasicColors.green
                                      : AppBasicColors.lightGrey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 0
                              : 0,
                          bottom: 68.0),
                      width: 28,
                      child: Positioned(
                          //bottom: 66,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                                color: controller.tabIndex == 2
                                    ? AppBasicColors.lightGreen
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ),
                    MaterialButton(
                      minWidth: 0,
                      height: 60,
                      onPressed: () {
                        setState(() {
                          controller.tabIndex = 2;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.featherPointed,
                              size: iconSize,
                              color: controller.tabIndex == 2
                                  ? AppBasicColors.lightGreen
                                  : AppBasicColors.lightGrey,
                            ),
                            Text(
                              'Arhuaco',
                              style: TextStyle(
                                  fontSize: fontSize,
                                  color: controller.tabIndex == 2
                                      ? AppBasicColors.green
                                      : AppBasicColors.lightGrey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 68.0),
                      width: 28,
                      child: Positioned(
                          //bottom: 66,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                                color: controller.tabIndex == 3
                                    ? AppBasicColors.lightGreen
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                          )),
                    ),
                    MaterialButton(
                      minWidth: 0,
                      height: 60,
                      onPressed: () {
                        setState(() {
                          controller.tabIndex = 3;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.userGear,
                              size: iconSize,
                              color: controller.tabIndex == 3
                                  ? AppBasicColors.lightGreen
                                  : AppBasicColors.lightGrey,
                            ),
                            Text(
                              'Perfil',
                              style: TextStyle(
                                  fontSize: fontSize,
                                  color: controller.tabIndex == 3
                                      ? AppBasicColors.green
                                      : AppBasicColors.lightGrey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ]),
      );
    });
  }
}

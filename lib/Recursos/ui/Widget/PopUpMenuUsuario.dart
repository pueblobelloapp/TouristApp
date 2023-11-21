import 'package:app_turismo_usuario/Recursos/controllers/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/utils/GextUtils.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Paginas/Login/login.dart';
import '../Paginas/Perfil/Perfil.dart';
import '../Paginas/Recuperar_contrasena/RecuperarContrasena.dart';
import '../../theme/app_theme.dart';

class PopUpMenuPerfil extends StatelessWidget {
  //final ControllerLogin _login = Get.find();

  const PopUpMenuPerfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              showDialog(
                  barrierColor: AppBasicColors.transparent,
                  //barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return Stack(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Positioned(
                          top: 1,
                          right: 1,
                          //bottom: 0,
                          child: CustomDropdownMenu())
                    ]);
                  });
            },
            icon: const Icon(
              BootstrapIcons.person,
              color: AppBasicColors.white,
            )));
  }
}

class CustomDropdownMenu extends StatefulWidget {
  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  final ControllerLogin _login = Get.find();

  late GetxUtils controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<GetxUtils>();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 250.0,
        height: 310.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppBasicColors.rgb, //const Color.fromRGBO(45, 52, 54, 1),
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomMenuItem(
              icon: BootstrapIcons.person,
              title: 'Mi perfil',
              titleStyle: const TextStyle(fontWeight: FontWeight.bold),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ProfileDialog();
                    });
              },
            ),
            CustomMenuItem(
              icon: BootstrapIcons.lock,
              title: 'Cambiar clave',
              titleStyle: const TextStyle(fontWeight: FontWeight.bold),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return RecoveryPassword();
                    });
              },
            ),
            CustomMenuItem(
              icon: BootstrapIcons.power,
              title: 'Cerrar sesión',
              titleStyle: const TextStyle(fontWeight: FontWeight.bold),
              onTap: () async {
                await _login.logout();
              },
            ),
            const Divider(
              height: 1,
              color: AppBasicColors.black,
              thickness: 1.5,
              indent: 15.0,
              endIndent: 15.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Universidad Popular del Cesar',
              style: TextStyle(
                  fontSize: 12.5,
                  color: AppBasicColors.lightGrey,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              'Alcaldía Municipal de Pueblo Bello - Cesar',
              style: TextStyle(
                  fontSize: 12.5,
                  color: AppBasicColors.lightGrey,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.getAppInfo(),
                  style: const TextStyle(
                      fontSize: 13.0,
                      color: AppBasicColors.lightGrey,
                      fontWeight: FontWeight.bold),
                ),
                /*Text(
                  '2.4.0',
                  style: TextStyle(
                      fontSize: 12.5,
                      color: AppBasicColors.lightGrey,
                      fontWeight: FontWeight.bold),
                ),*/
                const SizedBox(
                  height: 10.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomMenuItem extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;
  final TextAlign? textAlign;

  const CustomMenuItem({
    Key? key,
    this.icon,
    this.title,
    this.onTap,
    this.textAlign,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          //color: const Color.fromRGBO(255, 255, 255, 1),
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: icon != null
                ? Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(45, 52, 54, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Icon(
                      icon,
                      color: AppBasicColors.white,
                    ),
                  )
                : null,
            title: Text(
              title!,
              style: titleStyle,
              textAlign: textAlign,
            ),
          ),
        ));
  }
}

/*PopupMenuButton(
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
          /*_buildMenuItem(
              icon: BootstrapIcons.person,
              title: 'Mi perfil',
              titleStyle: const TextStyle(fontWeight: FontWeight.bold),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ProfileDialog();
                    });
              }),
          _buildMenuItem(
              icon: BootstrapIcons.lock,
              title: 'Cambiar clave',
              titleStyle: const TextStyle(fontWeight: FontWeight.bold),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return RecoveryPassword();
                    });
              }),
          _buildMenuItem(
              icon: BootstrapIcons.power,
              title: 'Cerrar sesión',
              titleStyle: const TextStyle(fontWeight: FontWeight.bold),
              onTap: () async {
                await _login.logout();
              }),*/
          //_buildMenuItem(title: ''),
          /* PopupMenuItem(
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
                  ),
                ),
                title: const Text(
                  'Mi perfil',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),*/
          /* PopupMenuItem(
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
          ),*/
          /* PopupMenuItem(
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
          ),*/
          /*const PopupMenuItem(
            //padding: EdgeInsets.all(20.0),
            child: Divider(
              height: 1,
              color: AppBasicColors.black,
              thickness: 1.5,
              //indent: 6.0,
              //endIndent: 6.0,
            ),
          ),*/
          /* _buildMenuItem(
              title: 'Universidad Popular Del Cesar',
              titleStyle: const TextStyle(
                  fontSize: 12.5,
                  color: AppBasicColors.lightGrey,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify),
          _buildMenuItem(
              title: 'Alcaldía Municipal de Pueblo bello',
              titleStyle: const TextStyle(
                  fontSize: 12.5,
                  color: AppBasicColors.lightGrey,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),*/
          /*const PopupMenuItem(
              child: ListTile(
                  contentPadding: EdgeInsets.only(top: 5.0, bottom: -35.0),
                  title: Text(
                    'Universidad Popular Del Cesar',
                    style: TextStyle(
                        fontSize: 12.5,
                        color: AppBasicColors.lightGrey,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ))),*/
          /*const PopupMenuItem(
              child: ListTile(
                  contentPadding: EdgeInsets.only(top: 0.0),
                  title: Text(
                    'Alcaldia Municipal de pueblo bello - cesar',
                    style: TextStyle(
                        fontSize: 12.5,
                        color: AppBasicColors.lightGrey,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ))),*/
          /*const PopupMenuItem(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'IKU: ',
                    style: TextStyle(
                        fontSize: 12.5,
                        color: AppBasicColors.lightGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '2.4.0',
                    style: TextStyle(
                        fontSize: 12.5,
                        color: AppBasicColors.lightGrey,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ))*/
        ];
      },
      /*onSelected: (value) {
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
                  return RecoveryPassword();
                });
            break;
          case 3:
            _login.logout();
            break;
        }
      },*/
    );*/
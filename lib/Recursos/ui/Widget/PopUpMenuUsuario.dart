import 'package:app_turismo_usuario/Recursos/controllers/LoginControllers.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Paginas/Login/Login.dart';
import '../Paginas/Perfil/Perfil.dart';
import '../Paginas/Recuperar_contrasena/RecuperarContrasena.dart';
import '../../theme/app_theme.dart';

class PopUpMenuPerfil extends StatelessWidget {
  final ControllerLogin _login = Get.find();

  PopUpMenuPerfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  return RecoveryPassword();
                });
            break;
          case 3:
            _login.logout();
            break;
        }
      },
    );
  }
}

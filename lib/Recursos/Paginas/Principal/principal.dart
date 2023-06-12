import 'package:app_turismo_usuario/Recursos/Paginas/Login/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Perfil/Perfil.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Principal/principalController.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Recuperar_contrase%C3%B1a/RecuperarContrasena.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Principal extends GetView<PrincipalController> {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: _search(context),
            )
          ],
        ),
      ),
    );
  }
}

Widget _search(BuildContext context) {
  final controller = Get.put<PrincipalController>(PrincipalController());
  return SafeArea(
      child: Row(
    children: <Widget>[
      Expanded(
        child: Container(
          height: 30.0,
          /*decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),*/
          child: _textFormFielWidget(
              controller.search,
              const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: AppBasicColors.white,
                size: 15.0,
              ),
              'Buscar...',
              false,
              TextInputType.name),
        ),
      ),
      const SizedBox(
        width: 5.0,
      ),
      Container(
          height: 30.0,
          width: 30.0,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(45, 52, 54, 1),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: _popupMenuProfile(context)),
    ],
  ));
}

Widget _popupMenuProfile(context) {
  return PopupMenuButton(
    icon: const FaIcon(FontAwesomeIcons.user,
        color: AppBasicColors.white, size: 15.0),
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
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.user,
                      color: AppBasicColors.white,
                      size: 15.0,
                    ),
                  )),
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
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.lock,
                      color: AppBasicColors.white,
                      size: 15.0,
                    ),
                  )),
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
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.powerOff,
                      color: AppBasicColors.white,
                      size: 15.0,
                    ),
                  )),
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

Widget _textFormFielWidget(TextEditingController controlador, FaIcon icono,
    String textGuide, bool estate, TextInputType textInputType) {
  return TextFormField(
    controller: controlador,
    keyboardType: textInputType,
    obscureText: estate,
    decoration: InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 6.0, top: 0.0, right: 6.0),
        child: icono,
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      fillColor: const Color.fromRGBO(178, 190, 195, 1),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0)),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        //borderRadius: BorderRadius.circular(5.0)
      ),
      hintText: textGuide,
      //disabledBorder: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
      isCollapsed: true,
      hintStyle: const TextStyle(color: AppBasicColors.white),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        //return msgError;
      }
    },
    cursorColor: Colors.black,
  );
}

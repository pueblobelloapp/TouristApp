import 'package:app_turismo_usuario/Recursos/Paginas/Perfil/Perfil.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Principal/principalController.dart';
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
              child: _search(),
            )
          ],
        ),
      ),
    );
  }
}

Widget _search() {
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
        child: IconButton(
            icon: const FaIcon(FontAwesomeIcons.user,
                color: AppBasicColors.white, size: 15.0),
            onPressed: () {
              Get.to(PerfilPage());
            }),
      ),
    ],
  ));
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

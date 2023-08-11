import 'package:app_turismo_usuario/Recursos/controllers/LoginControllers.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_theme.dart';
import '../Paginas/Login/Login.dart';
import 'PopUpMenuUsuario.dart';
import 'custom_back_button.dart';

class AppbarPersonalizada extends StatelessWidget {
  final ControllerLogin _login = Get.find();

  final Function()? onTapBuscar;
  final TextEditingController? controller;
  final bool readOnly;
  final bool mostrarBotonAtras;
  final FocusNode? focusNode;
  final Function(String str)? accionBuscar;

  AppbarPersonalizada(
      {Key? key,
      this.focusNode,
      this.onTapBuscar,
      this.controller,
      this.readOnly = true,
      this.mostrarBotonAtras = false,
      this.accionBuscar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Row(
          children: <Widget>[
            mostrarBotonAtras
                ? CustomBackButton(onPressed: () => Get.back())
                : const SizedBox(),
            SizedBox(width: mostrarBotonAtras ? 5 : 0),
            Expanded(
                child: Container(
                    height: 30.0,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(178, 190, 195, 1),
                        borderRadius: BorderRadius.circular(5)),
                    // padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      focusNode: focusNode,
                      onChanged: accionBuscar,
                      readOnly: readOnly,
                      onTap: onTapBuscar,
                      controller: controller,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Buscar...',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0)),
                    ))),
            const SizedBox(
              width: 5.0,
            ),
            Obx(
              () => Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(45, 52, 54, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: _login.usuario.value.id.isEmpty
                      ? IconButton(
                          onPressed: () => Get.to(const Login()),
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            BootstrapIcons.person,
                            color: AppBasicColors.white,
                          ))
                      : PopUpMenuPerfil()),
            )
          ],
        ),
      ),
    );
  }
}

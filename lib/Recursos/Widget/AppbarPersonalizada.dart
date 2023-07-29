import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';
import 'PopUpMenuUsuario.dart';
import 'custom_back_button.dart';
import 'custom_textFormField.dart';

class AppbarPersonalizada extends StatelessWidget {

  final Function()? onTapBuscar;
  final TextEditingController? controller;
  final bool readOnly;
  final bool mostrarBotonAtras;

  const AppbarPersonalizada({
    Key? key,
    this.onTapBuscar,
    this.controller,
    this.readOnly = true,
    this.mostrarBotonAtras = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Row(
          children: <Widget>[
            mostrarBotonAtras ? CustomBackButton(onPressed: ()=>Get.back()) : const SizedBox(),
            SizedBox(width: mostrarBotonAtras ? 5:0),
            Expanded(
                child: SizedBox(
                    height: 30.0,
                    child: CustomTextFormField(
                      readOnly: readOnly,
                      icon: const Icon(
                        BootstrapIcons.search,
                        color: AppBasicColors.white,
                        size: 15.0,
                      ),
                      textGuide: 'Buscar...',
                      obscureText: false,
                      onTap: onTapBuscar,
                      controller: controller,
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
    );
  }
}

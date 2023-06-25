import 'package:app_turismo_usuario/Recursos/Paginas/Sitio/sitio.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import 'tarjeta_turistica_controller.dart';

class TarjetaTuristica extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final String descripcion;
  final String imageUrl;

  const TarjetaTuristica(
      {super.key,
      required this.titulo,
      required this.icono,
      required this.descripcion,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final TarjetaTuristicaController tarjetaTuristicaController = Get.find();

    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(SitioPage());
          },
          child: Stack(children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Positioned(
                left: 16.0,
                bottom: 16.0,
                child: Opacity(
                  opacity: 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: AppBasicColors.white),
                      ),
                      Row(
                        children: [
                          Icon(
                            icono,
                            color: AppBasicColors.hellow,
                            size: 20.0,
                          ),
                          Icon(
                            icono,
                            color: AppBasicColors.hellow,
                            size: 20.0,
                          ),
                          Icon(
                            icono,
                            color: AppBasicColors.hellow,
                            size: 20.0,
                          ),
                          Icon(
                            icono,
                            color: AppBasicColors.hellow,
                            size: 20.0,
                          ),
                          Icon(
                            icono,
                            color: AppBasicColors.hellow,
                            size: 20.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 330,
                        child: Expanded(
                          child: Text(
                            descripcion,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontSize: 12.0, color: AppBasicColors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ]),
        )
      ],
    ));
  }
}

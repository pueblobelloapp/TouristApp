import 'package:app_turismo_usuario/Recursos/Paginas/Sitio/sitio.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
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
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //verticalDirection: VerticalDirection.down,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(SitioPage());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        AppBasicColors.black.withOpacity(0.5),
                        BlendMode.darken),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: 365, //double.infinity,
                      height: 203,
                    ),
                  ),
                  Positioned(
                      left: 16.0,
                      bottom: 16.0,
                      child: Opacity(
                        opacity: 1.0,
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
                                  color: AppBasicColors.yellow,
                                  size: 20.0,
                                ),
                                Icon(
                                  icono,
                                  color: AppBasicColors.yellow,
                                  size: 20.0,
                                ),
                                Icon(
                                  icono,
                                  color: AppBasicColors.yellow,
                                  size: 20.0,
                                ),
                                Icon(
                                  icono,
                                  color: AppBasicColors.yellow,
                                  size: 20.0,
                                ),
                                Icon(
                                  icono,
                                  color: AppBasicColors.yellow,
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
                                      fontSize: 12.0,
                                      color: AppBasicColors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ]),
              ),
            )
          ],
        ));
  }
}

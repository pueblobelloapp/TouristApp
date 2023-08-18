import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Entity/sitio.dart';
import '../../routes/app_pages.dart';

class TarjetaTuristica extends StatelessWidget {

  final Sitio sitio;

  const TarjetaTuristica({
    super.key,
    required this.sitio
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ()=>Get.toNamed(Routes.Sitio, arguments: {'id': sitio.id}),
      child: Container(
        height: 200,
        width: Get.width-20,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: .5,
            image: NetworkImage(sitio.fotos[0]),
            fit: BoxFit.cover
          ),
          color: AppBasicColors.black,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sitio.titulo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppBasicColors.white
              ),
            ),
            const SizedBox(height: 5,),
            Row(
              children: List.generate(
                5, 
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Icon(
                    BootstrapIcons.star_fill, 
                    color: index < sitio.calificacion ? AppBasicColors.yellow : AppBasicColors.greyRgba,
                    size: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              sitio.descripcion,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 12.0,
                color: AppBasicColors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}

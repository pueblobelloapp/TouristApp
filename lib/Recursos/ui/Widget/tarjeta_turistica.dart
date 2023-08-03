import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class TarjetaTuristica extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final String descripcion;
  final String imageUrl;
  final String id;

  const TarjetaTuristica({
    super.key,
    required this.titulo,
    required this.icono,
    required this.descripcion,
    required this.imageUrl, 
    required this.id
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ()=>Get.toNamed(Routes.Sitio, arguments: {'id': id}),
      child: Container(
        height: 200,
        width: Get.width-20,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: .5,
            image: NetworkImage(imageUrl),
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
              titulo,
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
              children: [
                for(int i=0; i<5; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Icon(
                      icono,
                      color: AppBasicColors.yellow,
                      size: 20.0,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 5,),
            Text(
              descripcion,
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

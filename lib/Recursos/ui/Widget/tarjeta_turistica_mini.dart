import 'package:app_turismo_usuario/Recursos/routes/app_pages.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TarjetaTuristicaMini extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String descripcion;
  final int rating;
  final String id;

  const TarjetaTuristicaMini({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.descripcion,
    required this.rating, 
    required this.id
  });

  @override
  Widget build(BuildContext context) {    
    return GestureDetector(
      onTap: ()=>Get.toNamed(Routes.Sitio, arguments: {'id': id}),
      child: Card(
        color: AppBasicColors.greyMun,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: ColorFiltered(
                  colorFilter: ColorFilter.mode(AppBasicColors.black.withOpacity(0.1), BlendMode.darken),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: 117.05,
                    height: 117.08,
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 5.0, bottom: 2.0, top: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        5, 
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: Icon(
                            BootstrapIcons.star_fill, 
                            color: index <= rating ? AppBasicColors.yellow : AppBasicColors.greyRgba,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      descripcion,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 12.0),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

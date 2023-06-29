import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class TarjetaTuristicaMini extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String descripcion;
  final int rating;

  const TarjetaTuristicaMini(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.descripcion,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
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
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    AppBasicColors.black.withOpacity(0.1), BlendMode.darken),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 117.05,
                  height: 117.08,
                ),
              ),
            ),
            /* Container(
              width: 117.05,
              height: 117.08,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover)),
            )*/
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 2.0, top: 2.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          for (int i = 0; i < rating; i++)
                            const Icon(
                              BootstrapIcons.star_fill,
                              color: AppBasicColors.hellow,
                              size: 20.0,
                            )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    descripcion,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

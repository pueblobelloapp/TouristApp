import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardModel {
  final String imagenPath;
  final String titulo;
  final IconData icono;
  final VoidCallback? onPreseed;

  CardModel(
      {required this.imagenPath,
      required this.titulo,
      required this.icono,
      this.onPreseed});
}

class CardModelWidget extends StatelessWidget {
  final CardModel cardModel;
  const CardModelWidget({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        // width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height,
        height: 200.0,
        //margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              image: AssetImage(cardModel.imagenPath), fit: BoxFit.cover),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
                color: Colors.black.withOpacity(0.3),
              ),
              child: ListTile(
                title: Text(
                  cardModel.titulo,
                  style: const TextStyle(color: Colors.white, fontSize: 24.0),
                ),
                trailing: Container(
                  width: 35.0,
                  height: 35.0,
                  //padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      //shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppBasicColors.green),
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                      icon: FaIcon(
                        cardModel.icono,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      onPressed: cardModel.onPreseed),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

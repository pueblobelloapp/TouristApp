import 'package:flutter/material.dart';

class CardModelSitio {
  String title;
  String subtitle;
  String imageAssets;
  IconData iconData;
  final VoidCallback? onPressed;

  CardModelSitio({
    required this.title,
    required this.subtitle,
    required this.imageAssets,
    required this.iconData,
    this.onPressed,
  });
}

class CardSitioWidget extends StatelessWidget {
  final CardModelSitio cardModelSitio;
  const CardSitioWidget({super.key, required this.cardModelSitio});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            leading: Image.asset(cardModelSitio.imageAssets),
            title: Text(cardModelSitio.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold)),
            subtitle: Text(cardModelSitio.subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0)),
            trailing: IconButton(
              icon: Icon(
                cardModelSitio.iconData,
                color: Colors.black,
              ),
              onPressed: cardModelSitio.onPressed,
            ) //FaIcon(cardModel.iconData),
            ),
      ),
    );
  }
}

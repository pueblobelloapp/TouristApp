import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardModelList {
  String title;
  IconData iconData;
  final VoidCallback? onPressed;

  CardModelList({required this.title, required this.iconData, this.onPressed});
}

class CardList extends StatelessWidget {
  final CardModelList cardModelList;

  const CardList({
    super.key,
    required this.cardModelList,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
    return SizedBox(
      height: 120.0,
      child: Card(
        elevation: 4.0,
        shape: const RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Color(0xFFAED581), width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
        child: Column(
          children: [
            ListTile(
                title: Text(
              cardModelList.title,
              textAlign: TextAlign.center,
              style: optionStyle,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: cardModelList.onPressed,
                    icon: FaIcon(cardModelList.iconData))
              ],
            )
          ],
        ),
      ),
    );
  }
}

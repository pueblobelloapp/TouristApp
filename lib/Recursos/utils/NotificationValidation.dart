import 'package:flutter/material.dart';

class NotificationMessage extends StatelessWidget {
  //const NotificationMessage({super.key});

  final String urlIcon;
  final String message;
  final String title;

  NotificationMessage ({
    required this.urlIcon,
    required this.message,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(urlIcon);
  }
}


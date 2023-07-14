import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class NotificationMessage {
  late String imagePath;
  late String title;
  late String message;
  final bool flipVertical;
  final bool shouldTransform;
  final VoidCallback? onPressed;

  NotificationMessage(
      {required this.imagePath,
      required this.title,
      required this.message,
      this.flipVertical = false,
      this.shouldTransform = false,
      this.onPressed});

  void showNotification(BuildContext context) {
    final double imageTopMargin = shouldTransform ? 0.0 : 150.0;
    const double imageLeftMargin = 90.0;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            widthFactor: 15.0,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              content: SizedBox(
                width: 350.0,
                height: 310.0,
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: imageLeftMargin, top: imageTopMargin),
                        child: shouldTransform
                            ? Image.asset(
                                imagePath,
                                width: 179.0,
                                height: 179.0,
                              )
                            : Transform(
                                transform: flipVertical
                                    ? Matrix4.rotationX(3.1415926535)
                                    : Matrix4.identity(),
                                child: Image.asset(
                                  imagePath,
                                  width: 179.0,
                                  height: 179.0,
                                ),
                              )),
                    Container(
                      margin: const EdgeInsets.only(top: 150.0),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 32.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 9.0,
                          ),
                          Text(message),
                          const SizedBox(
                            height: 24.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppBasicColors.rgb),
                              onPressed: onPressed,
                              child: const Text(
                                'Aceptar',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: AppBasicColors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

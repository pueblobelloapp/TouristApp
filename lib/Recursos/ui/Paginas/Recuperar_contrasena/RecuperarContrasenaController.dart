import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/NotificationValidation.dart';

class RecoveryPasswordController extends GetxController {
  TextEditingController emailRecoveryPassword = TextEditingController();

  NotificationMessage notificationMessage = NotificationMessage(
      imagePath: 'Assets/Img/thumb-down.gif',
      title: 'Correo Electrónico',
      message: 'Mensaje',
      flipVertical: true,
      shouldTransform: true,
      onPressed: () {
        Get.back();
      });
}

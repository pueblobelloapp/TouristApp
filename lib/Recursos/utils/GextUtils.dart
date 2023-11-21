import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GetxUtils extends GetxController {
  bool _isReadyAction = true;
  bool get isReadyAction => _isReadyAction;
  late PackageInfo packageInfo;

  void updateAction(bool state) {
    print("Actualiza estado");
    _isReadyAction = state;
    update();
  }

  @override
  void onInit() async {
    packageInfo = await PackageInfo.fromPlatform();
    super.onInit();
  }

  void messageInfo(String titulo, String mensaje) {
    Get.showSnackbar(GetSnackBar(
        title: titulo,
        message: mensaje,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green.shade600,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.all(10.0),
        icon: const Icon(Icons.info_outline)));
  }

  void messageError(String titulo, String mensaje) {
    Get.showSnackbar(GetSnackBar(
        title: titulo,
        message: mensaje,
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.red.shade600,
        reverseAnimationCurve: Curves.easeOutSine,
        forwardAnimationCurve: Curves.easeOutSine,
        margin: const EdgeInsets.all(10.0),
        icon: const Icon(Icons.error_outline)));
  }

  void messageWarning(String titulo, String mensaje) {
    Get.showSnackbar(GetSnackBar(
        title: titulo,
        message: mensaje,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.yellow.shade800,
        reverseAnimationCurve: Curves.easeOutSine,
        forwardAnimationCurve: Curves.easeOutSine,
        margin: const EdgeInsets.all(10.0),
        icon: const Icon(Icons.warning_amber)));
  }

  String getAppInfo() {
    final version = packageInfo.version;

    return 'IKU: $version';
  }
}

import 'package:app_turismo_usuario/Recursos/Paginas/Login/Login.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class MyLocationController extends GetxController {
  Location location = new Location();
  RxBool locationEnabled = false.obs;
  RxBool locationAuthorized = false.obs;
  final message = "".obs;

  @override
  void onInit() {
    super.onInit();
    _checkLocationEnabled();

    GetPlatform.isAndroid
        ? message.value =
            "Esta aplicación recopila datos de ubicación, para habilitar la ubicación precisa, aproximada y en segundo plano, haga clic en 'Solicitar acceso' "
        : message.value =
            "Esta aplicación recopila datos de ubicación, para habilitar la ubicación precisa, aproximada y en segundo plano, haga clic en 'Solicitar acceso' ";

    // verificar si la ubicación ya está habilitada
    /* if (locationEnabled.value) {
      await Get.offNamed('/Login');
    }*/

    /*ever(locationEnabled, (value) {
      if (value) {
        Get.off(Login());
      }
    });*/
  }

  void _checkLocationEnabled() async {
    bool serviceEnabled = await location.serviceEnabled();
    locationEnabled.value = serviceEnabled;

    if (serviceEnabled) {
      Get.off(() => Login());
    }
  }

  void activeteLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      PermissionStatus status = await location.requestPermission();
      if (status == PermissionStatus.granted) {
        bool serviceEnabled = await location.requestService();
        if (serviceEnabled) {
          locationEnabled.value = true;
          await Get.off(Login()); // ridirigir al login
          //locationAuthorized.value = false;
        }
      }
    } /*else {
      locationAuthorized.value = true;
      await Get.offAllNamed('/Login');
    }*/
  }
}

import 'package:app_turismo_usuario/Recursos/controllers/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/ui/Paginas/Registrar/RegistrarController.dart';
import 'package:get/get.dart';

import '../Repository/sitioRepository.dart';
import '../controllers/sitioController.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ControllerLogin(), permanent: true);
  }
}

class SitioBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SitioController(Get.put<SitioRepository>(SitioRepositoryImp())));
  }
}

class RegistrarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      RegistrarController(),
    );
  }
}

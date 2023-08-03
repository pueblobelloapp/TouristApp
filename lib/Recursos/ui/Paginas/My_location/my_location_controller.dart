// import 'package:app_turismo_usuario/Recursos/ui/Paginas/Home/home.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:location/location.dart';

// class MyLocationController extends GetxController {
//   Location location = new Location();
//   RxBool locationEnabled = false.obs;
//   RxBool locationAuthorized = false.obs;
//   final message = "".obs;

//   @override
//   void onInit() {
//     super.onInit();
//     _checkLocationEnabled();

//     GetPlatform.isAndroid
//         ? message.value = "Necesitamos acceso a tu ubicación"
//         : message.value = "Necesitamos acceso a tu ubicación";

//     // verificar si la ubicación ya está habilitada
//     /* if (locationEnabled.value) {
//       await Get.offNamed('/Login');
//     }*/

//     /*ever(locationEnabled, (value) {
//       if (value) {
//         Get.off(Login());
//       }
//     });*/
//   }

//   void _checkLocationEnabled() async {
//     bool serviceEnabled = await location.serviceEnabled();
//     locationEnabled.value = serviceEnabled;

//     if (serviceEnabled) {
//       //Get.off(() => Login());
//       Get.off(() => Home());
//     }
//   }

//   void activeteLocation() async {
//     bool serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       PermissionStatus status = await location.requestPermission();
//       if (status == PermissionStatus.granted) {
//         bool serviceEnabled = await location.requestService();
//         if (serviceEnabled) {
//           locationEnabled.value = true;
//           await Get.to(() => Home(), //Get.to(() => Login(),
//               transition: Transition.rightToLeft,
//               duration: const Duration(milliseconds: 1800),
//               opaque: false, binding: BindingsBuilder.put(() {
//             return PageRouteBuilder(
//                 pageBuilder: (context, animation, secondatyAnimaniton) =>
//                     Home(), //Login(),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   var begin = const Offset(1.0, 0.0);
//                   var end = Offset.zero;
//                   var curve = Curves.ease;

//                   var tween = Tween(begin: begin, end: end)
//                       .chain(CurveTween(curve: curve));
//                   return SlideTransition(
//                     position: animation.drive(tween),
//                     child: child,
//                   );
//                 });
//           })); //
//         }
//       }
//     }
//   }
// }

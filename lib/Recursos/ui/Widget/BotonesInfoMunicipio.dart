// import 'package:bootstrap_icons/bootstrap_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../Paginas/Detalles/detail.dart';
// import '../../theme/app_theme.dart';
// import 'Custom_elevated_button.dart';

// class BotonesInfoMunicipio extends StatelessWidget {

//   final List elementos = [
//     {'tipo':0},
//     {
//       'tipo': 1,
//       'color': AppBasicColors.greyMun,
//       'icon': BootstrapIcons.book,
//       'text': 'Información del municipio',
//       'accion': () => Get.to(const Detail())
//     },
//     {'tipo':0},
//     {
//       'tipo': 1,
//       'color': AppBasicColors.yellow,
//       'icon': BootstrapIcons.brightness_alt_high,
//       'text': 'Cultura',
//       'accion': () => Get.to(const Detail())
//     },
//     {'tipo':0},
//     {
//       'tipo': 1,
//       'color': AppBasicColors.rgb,
//       'icon': BootstrapIcons.bicycle,
//       'text': 'Etnoturismo',
//       'accion': () => Get.to(const Detail())
//     },
//     {'tipo':0},
//   ];

//   BotonesInfoMunicipio({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//           elementos.length, 
//           (index) => elementos[index]['tipo'] == 0 ? 
//           const SizedBox(width: 10,):
//           CustomElevatedButton(
//             color: elementos[index]['color'],
//             textColor: AppBasicColors.black,
//             fontWeight: FontWeight.bold,
//             icon: elementos[index]['icon'],
//             fixedSize: true,
//             text: elementos[index]['text'],
//             onPressed: () => Get.to(const Detail())
//           ),
//         ),
//       ),
//     );
//   }
// }
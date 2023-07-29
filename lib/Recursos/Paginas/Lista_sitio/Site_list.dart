import 'package:app_turismo_usuario/Recursos/Paginas/Lista_sitio/Site_listController.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Modelos/Tarjeta_turistica/tarjeta_turistica.dart';
import '../../Widget/AppbarPersonalizada.dart';

class SiteList extends GetView<SiteListController> {

  final bool esBuscar;
  final String titulo;
  // final controller = Get.put<SiteListController>(SiteListController());
  TextEditingController search = TextEditingController();

  SiteList({super.key, this.esBuscar = false, this.titulo = '' });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight( esBuscar ? 50 : 90),
        child: Column(
          children: [
            AppbarPersonalizada(
              controller: search,
              readOnly: false,
              mostrarBotonAtras: true 
            ),
            const SizedBox(height: 10,),
            esBuscar ? const SizedBox() : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      titulo,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          // stream: FirebaseFirestore.instance.collection('sites').snapshots(),
          stream: FirebaseFirestore.instance.collection('sites').snapshots(),
          builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 10,),
                    Text('Cargando datos.'),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Lo sentimos se ha producido un error.'));
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("Sin datos para mostrar"),);
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal:10),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                dynamic data = snapshot.data!.docs[index].data();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TarjetaTuristica(
                    titulo: data['nombre'],
                    descripcion: data['descripcion'],
                    icono: BootstrapIcons.star_fill,
                    imageUrl: data['foto'][0]
                  ),
                );
              }
            );
          }
        )
      // body: ListView(
      //   children: [
      //     Column(
      //       children: [
      //         const SizedBox(
      //           height: 5.0,
      //         ),
      //         for(int i=0; i<10;i++)
      //           const Padding(
      //             padding: EdgeInsets.only(bottom: 10),
      //             child: TarjetaTuristica(
      //                 titulo: 'Titulo',
      //                 icono: BootstrapIcons.star_fill,
      //                 descripcion:
      //                     'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      //                 imageUrl: 'Assets/Img/sitiocard.png'
      //             ),
      //           ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}

// Widget __bodyContainer(BuildContext context) {
//   final controller = Get.put<SiteListController>(SiteListController());

//   return Stack(children: [
//     SafeArea(
//         child: Column(
//       children: [
//         Row(
//           children: <Widget>[
//             Expanded(
//                 child: SizedBox(
//               height: 30.0,
//               child: CustomTextFormField(
//                 controller: controller.search,
//                 icon: const Icon(
//                   BootstrapIcons.search,
//                   color: AppBasicColors.white,
//                   size: 15.0,
//                 ),
//                 textGuide: 'Buscar...',
//                 obscureText: false,
//                 textInputType: TextInputType.name,
//                 contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
//                 fillColor: const Color.fromRGBO(178, 190, 195, 1),
//               ),
//             )),
//             const SizedBox(
//               width: 5.0,
//             ),
//             Container(
//                 height: 30.0,
//                 width: 30.0,
//                 decoration: const BoxDecoration(
//                   color: Color.fromRGBO(45, 52, 54, 1),
//                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                 ),
//                 child: const PopUpMenuPerfil())
//           ],
//         ),
//         // const SizedBox(height: 12.0),
//         // _buildButtonRow(),
//         // const SizedBox(height: 12.0),
//       ],
//     )),
//   ]);
// }



// Widget _buildButtonRow() {
//   final buttons = [
//     CustomElevatedButton(
//         fontWeight: FontWeight.bold,
//         fixedSize: true,
//         text: 'Sub Categoría',
//         onPressed: () {}),
//     const SizedBox(
//       width: 10.0,
//     ),
//     CustomElevatedButton(
//         fontWeight: FontWeight.bold,
//         fixedSize: true,
//         text: 'Sub Categoría',
//         onPressed: () {}),
//     /* CustomRowButton(
//       color: AppBasicColors.blue,
//       //icon: BootstrapIcons.book,
//       text: 'Sub Categoría',
//       //textSize: 24.0,
//       textColor: AppBasicColors.white,
//       onPressed: () {},
//     ),*/

//     /*CustomRowButton(
//       color: AppBasicColors.blue,
//       //icon: BootstrapIcons.brightness_alt_high,
//       text: 'Sub Categoría',
//       // textSize: 24.0,
//       textColor: AppBasicColors.white,
//       onPressed: () {},
//     ),*/
//   ];
//   return SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Row(children: buttons.map((button) => button).toList()),
//   );
// }

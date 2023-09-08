import 'package:app_turismo_usuario/Recursos/ui/Widget/Card/card_image_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends GetView {
  final String categoria;

  const Detail({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('dataTurismo')
            .where('subCategoria', isEqualTo: categoria)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Cargando información...')
                ],
              ),
            );
          }
          if (snapshot.hasError || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No se ha podido cargar la información...'),
            );
          }

          dynamic data = snapshot.data!.docs.first;

          return ListView(
            children: [
              CardImageList(imageList: data['photos']),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['nombre'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      data['descripcion'],
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 12.5,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      children: List.generate(
                          data['subTitulos'] == null
                              ? 0
                              : data['subTitulos'].length, (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['subTitulos'][index]['titulo'],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            CardImageList(
                              imageList: data['subTitulos'][index]
                                  ['listPhotos'],
                              radiusBottom: false,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              data['subTitulos'][index]['descripcion'],
                              textAlign: TextAlign.justify,
                              style:
                                  const TextStyle(fontSize: 12.5, height: 1.5),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      }),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

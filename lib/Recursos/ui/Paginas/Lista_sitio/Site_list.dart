import 'package:app_turismo_usuario/Recursos/Entity/sitio.dart';
import 'package:app_turismo_usuario/Recursos/controllers/sitioController.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/tarjeta_turistica.dart';
import '../../Widget/AppbarPersonalizada.dart';

class SiteListPage extends GetView<SitioController> {
  const SiteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SitioController>(builder: (sitio) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(sitio.esBuscar ? 50 : 90),
            child: Column(
              children: [
                AppbarPersonalizada(
                  focusNode: sitio.focusNode,
                  controller: sitio.search,
                  readOnly: false,
                  mostrarBotonAtras: true,
                  accionBuscar: (str) {
                    sitio.textBuscar.value = str.toLowerCase();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                sitio.esBuscar
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                sitio.titulo,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0),
                              ),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
          body: StreamBuilder(
              stream: sitio.listarSitios(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Cargando datos.'),
                      ],
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                      child: Text('Lo sentimos se ha producido un error.'));
                }
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("Sin datos para mostrar"),
                  );
                }
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        return Visibility(
                          visible: snapshot.data![index]!.titulo
                              .toLowerCase()
                              .contains(sitio.textBuscar),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TarjetaTuristica(
                              sitio: snapshot.data![index]!,
                            ),
                          ),
                        );
                      });
                    });
              }));
    });
  }
}

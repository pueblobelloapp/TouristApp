import 'package:app_turismo_usuario/Recursos/Paginas/Opinion/OpinionController.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Constans.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Opinion extends GetView<OpinionController> {
  const Opinion({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<OpinionController>(OpinionController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent.withOpacity(0.0),
          elevation: 0,
          title: const Text(
            'Titulo',
            style: TextStyle(
                color: AppBasicColors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  BootstrapIcons.arrow_left,
                  color: AppBasicColors.black,
                ),
              )),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(children: [
            const SizedBox(
              height: 24.0,
            ),
            SingleChildScrollView(
              child: Row(
                children: const <Widget>[
                  Text(
                    'Puntuación',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Obx(() => IconButton(
                      icon: Icon(
                        controller.filledStars[index]
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 40.0,
                      ),
                      onPressed: () {
                        controller.toggleStar(index);
                      }));
                })),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              color: const Color(0xFFDFE6E9),
              child: TextFormField(
                controller: controller.opnion,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16.0),
                  hintText: 'Escribe tu opinion',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            const SizedBox(
              height: 28.0,
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                style: Constants.buttonPrimary,
                onPressed: () {},
                child: const Text(
                  'Publicar',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
        ));
  }
}

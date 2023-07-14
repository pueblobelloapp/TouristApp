import 'package:app_turismo_usuario/Recursos/Paginas/Opinion/OpinionController.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Constans.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:app_turismo_usuario/Recursos/utils/NotificationValidation.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Opinion extends GetView<OpinionController> {
  const Opinion({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<OpinionController>(OpinionController());
    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        contentPadding: const EdgeInsets.fromLTRB(10.0, 0.5, 10.0, 9.6),
        content: SizedBox(
          height: 358.0,
          width: 343.0,
          //margin: const EdgeInsets.fromLTRB(0.5, 10, 0.5, 0),
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
              height: 0.0,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Obx(() => IconButton(
                      icon: Icon(
                        controller.filledStars[index]
                            ? BootstrapIcons.star_fill
                            : BootstrapIcons.star,
                        color: AppBasicColors.yellow,
                        size: 40.0,
                      ),
                      onPressed: () {
                        controller.toggleStar(index);
                      }));
                })),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              color: const Color(0xFFDFE6E9),
              child: TextFormField(
                controller: controller.opnion,
                maxLines: 7,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16.0),
                  hintText: 'Escribe tu opinión',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //ElevatedButton cancelar
                Expanded(
                  child: SizedBox(
                    height: 44.4,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppBasicColors.colorButtonCancelar),
                        child: const FittedBox(
                          child: Text('Cancelar',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ),
                        onPressed: () {
                          /*NotificationMessage notificationMessage =
                              NotificationMessage(
                                  imagePath: 'Assets/Img/error.gif',
                                  title: 'Oops!..',
                                  message: 'Mensaje',
                                  flipVertical: false,
                                  shouldTransform: true,
                                  onPressed: () {
                                    Get.back();
                                  }
                                  );
                          notificationMessage.show(context);
                          */
                          Get.back();
                        }),
                  ),
                ),
                const SizedBox(
                  width: 13.0,
                ),
                //ElevatedButton publicar
                Expanded(
                  child: SizedBox(
                    height: 44.4,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppBasicColors.rgb),
                        child: const FittedBox(
                          child: Text('Publicar',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ),
                        onPressed: () {
                          NotificationMessage notificationMessage =
                              NotificationMessage(
                                  imagePath: 'Assets/Img/thumb-down.gif',
                                  title: 'Ok',
                                  message: 'Mensaje',
                                  flipVertical: true,
                                  onPressed: () {
                                    Get.back();
                                  });
                          notificationMessage.showNotification(context);
                        }),
                  ),
                )
              ],
            )
            /*SizedBox(
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
            )*/
          ]),
        ));
  }
}

// import 'package:app_turismo_usuario/Recursos/Paginas/Opinion/OpinionController.dart';
import 'package:app_turismo_usuario/Recursos/controllers/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/controllers/sitioController.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/Custom_elevated_button.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';

import '../../../utils/NotificationValidation.dart';


class Opinion extends StatefulWidget {
  final List comentarios;
  final String idSitio;
  const Opinion({super.key, required this.comentarios, required this.idSitio});

  @override
  State<Opinion> createState() => _OpinionState();
}

class _OpinionState extends State<Opinion> {
  final estrellas = 1.0.obs;
  final TextEditingController textoOpinion = TextEditingController();
  final ControllerLogin _login = Get.find();

  @override
  void initState() {
    for (var element in widget.comentarios) {
      if(element['uid']==_login.usuario.value.id){
        estrellas.value = element['calificacion'].toDouble();
        textoOpinion.text = element['comentario'];
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        color: Colors.transparent,
        height: 400,
        width: Get.width,
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Puntuación',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Obx(() => RatingStars(
                value: estrellas.value,
                onValueChanged: (v) {
                  estrellas.value = v;
                },
                starBuilder: (index, color) => Icon(
                  BootstrapIcons.star_fill,
                  color: color,
                  size: 40,
                ),
                starCount: 5,
                starSize: 50,
                maxValue: 5,
                starSpacing: 10,
                maxValueVisibility: true,
                valueLabelVisibility: false,
                animationDuration: const Duration(milliseconds: 1000),
                starOffColor: const Color(0xffe7e8ea),
                starColor: Colors.yellow,
              ))
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDFE6E9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: textoOpinion,
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
              children: [
                //ElevatedButton cancelar
                Expanded(
                  child: SizedBox(
                    height: 44.4,
                    child: CustomElevatedButton(
                        color: AppBasicColors.colorButtonCancelar,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        onPressed: ()=>Get.back(),
                        text: 'Cancelar'),
                  ),
                ),
                const SizedBox(width: 10.0,),
                //ElevatedButton publicar
                GetBuilder<SitioController>(
                  builder: (sitio){
                    return Expanded(
                      child: SizedBox(
                        height: 44.4,
                        child: CustomElevatedButton(
                          color: AppBasicColors.rgb,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          onPressed: () async{

                            print(textoOpinion.text);

                            Map punutacion = {
                              'uid': _login.usuario.value.id,
                              'calificacion': estrellas.value.round(), 
                              'comentario': textoOpinion.text,
                            };
                            dynamic resp = await sitio.agregarComentarios(widget.idSitio, punutacion);

                            if(resp){
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

                            }

                          },
                          text: 'Publicar'
                        )
                      ),
                    );
                  }
                )
              ],
            )
          ]),
        ),
      )
    );
  }
}
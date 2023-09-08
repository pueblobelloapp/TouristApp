import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx/webviewx.dart';

import 'package:app_turismo_usuario/Recursos/controllers/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/controllers/sitioController.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:app_turismo_usuario/Recursos/ui/Paginas/Opinion/Opinion.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/Card/card_image_list.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/ContainerText.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/Custom_person_container.dart';

import '../../../Entity/sitio.dart';
import '../../Widget/custom_back_button.dart';

class SitioPage extends GetView<SitioController> {
  const SitioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SitioController>(builder: (sitio) {
      return Scaffold(
        body: StreamBuilder(
            stream: sitio.cargarSitio(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text(''));
              }

              if (snapshot.data == null) {
                return const Center(child: Text(''));
              }

              return DetalleSitio(
                sitio: snapshot.data!,
              );
            }),
      );
    });
  }
}

class DetalleSitio extends StatelessWidget {
  final Sitio sitio;

  const DetalleSitio({
    super.key,
    required this.sitio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CardImageList(
                    imageList: sitio.fotos.map((e) => e.toString()).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sitio.titulo,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Icon(
                                BootstrapIcons.star_fill,
                                color: index <= sitio.calificacion
                                    ? AppBasicColors.yellow
                                    : AppBasicColors.greyRgba,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          sitio.descripcion,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              height: 1.2),
                        ),
                        const SizedBox(height: 10.0),
                        // SizedBox(
                        //   width: 450.0,
                        //   height: 273.0,
                        //   child: MapaPage(),
                        // ),
                        WebViewX(
                          width: Get.width,
                          height: 300,
                          initialContent: Uri.dataFromString(
                                  '<iframe style="width: 100%; height: 100%; border: none" src="https://maps.google.com/maps?q=${sitio.latitud},${sitio.longitud}&z=15&t=m&output=embed"></iframe>',
                                  mimeType: 'text/html')
                              .toString(),
                          javascriptMode: JavascriptMode.unrestricted,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  if (!await launchUrl(
                                      Uri.parse(
                                          'https://maps.google.com/?ll=${sitio.latitud},${sitio.longitud}&z=14'),
                                      mode: LaunchMode.externalApplication)) {
                                    Get.snackbar('Error',
                                        'No se ha podido completar la acción',
                                        snackPosition: SnackPosition.BOTTOM,
                                        margin: const EdgeInsets.all(10),
                                        backgroundColor: AppBasicColors.white);
                                  }
                                },
                                child: const Text('Ver en Google Maps',
                                    style: TextStyle(
                                        color: AppBasicColors.blueMess,
                                        fontWeight: FontWeight.bold)))
                          ],
                        ),

                        WidgetText(
                          text: 'Opiniones',
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            ControllerLogin _login = Get.find();
                            _login.validarPermisosAccion(
                                accion: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Align(
                                          child: FractionallySizedBox(
                                              widthFactor: 15.0,
                                              child: Opinion(
                                                comentarios: sitio.puntuacion,
                                                idSitio: sitio.id,
                                              )));
                                    }));
                          },
                          buttonText: 'Calificar',
                          buttonFontSize: 20.0,
                        ),

                        Column(
                          children: List.generate(
                            sitio.puntuacion.length,
                            (index) => ItemComentario(
                                comentario: sitio.puntuacion[index]),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: CustomBackButton(onPressed: () {
                Get.back();
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: BotonFlotanteContacto(
        redes: sitio.contacto,
      ),
    );
  }
}

class ItemComentario extends StatelessWidget {
  final Map comentario;

  const ItemComentario({
    Key? key,
    required this.comentario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SitioController>(builder: (sitio) {
      return StreamBuilder(
          stream: sitio.obtenerUsuario(comentario['uid']),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            }

            if (snapshot.hasError) {
              return const Center(
                  child: Text('Ocurrio un error al cargar este comentario'));
            }

            if (snapshot.data == null) {
              return const SizedBox();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPersonContainer(
                  icon: BootstrapIcons.person,
                  name: snapshot.data!['name'],
                  imagePath: snapshot.data!['image'],
                  starCount: int.parse('${comentario['calificacion'] ?? '0'}'),
                  containerIconColor: AppBasicColors.colorButtonCancelar,
                ),
                Text(
                  comentario['comentario'] ?? 'Sin comentario',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            );
          });
    });
  }
}

class BotonFlotanteContacto extends StatefulWidget {
  final dynamic redes;
  const BotonFlotanteContacto({
    Key? key,
    this.redes,
  }) : super(key: key);

  @override
  State<BotonFlotanteContacto> createState() => _BotonFlotanteContactoState();
}

class _BotonFlotanteContactoState extends State<BotonFlotanteContacto> {
  final ControllerLogin _login = Get.find();

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      Get.snackbar('Error', 'No se ha podido completar la acción',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
          backgroundColor: AppBasicColors.white);
    }
  }

  List iconos = [];

  @override
  void initState() {
    dynamic redes = widget.redes;
    iconos = [
      {
        'icono': BootstrapIcons.whatsapp,
        'background': AppBasicColors.greenWhat,
        'accion': () => _login.validarPermisosAccion(
            accion: () => _launchUrl('https://wa.me'))
      },
      {
        'icono': BootstrapIcons.instagram,
        'background': AppBasicColors.redInst,
        'accion': () => _login.validarPermisosAccion(
            accion: () =>
                _launchUrl('https://www.instagram.com/${redes['instagram']}'))
      },
      {
        'icono': BootstrapIcons.messenger,
        'background': AppBasicColors.blueMess,
        'accion': () => _login.validarPermisosAccion(
            accion: () =>
                _launchUrl('https://www.messenger.com/${redes['messenger']}'))
      },
      {
        'icono': BootstrapIcons.facebook,
        'background': AppBasicColors.purpFace,
        'accion': () => _login.validarPermisosAccion(
            accion: () =>
                _launchUrl('https://www.facebook.com/${redes['facebook']}'))
      },
      {
        'icono': BootstrapIcons.twitter,
        'background': AppBasicColors.blueTwit,
        'accion': () => _login.validarPermisosAccion(
            accion: () =>
                _launchUrl('https://www.twitter.com/${redes['twitter']}'))
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      activeIcon: BootstrapIcons.x_lg,
      activeBackgroundColor: AppBasicColors.redInst,
      closeManually: true,
      children: List.generate(
        iconos.length,
        (index) => SpeedDialChild(
            child: Icon(
              iconos[index]['icono'],
              color: AppBasicColors.white,
            ),
            backgroundColor: iconos[index]['background'],
            onTap: iconos[index]['accion']),
      ),
      backgroundColor: AppBasicColors.rgb,
      child: const Icon(
        BootstrapIcons.telephone,
        color: AppBasicColors.white,
      ),
    );
  }
}

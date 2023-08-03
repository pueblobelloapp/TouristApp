import 'package:app_turismo_usuario/Recursos/controllers/LoginControllers.dart';
import 'package:app_turismo_usuario/Recursos/controllers/sitioController.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/Card/card_image_list.dart';
import 'package:app_turismo_usuario/Recursos/ui/Paginas/Opinion/Opinion.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/ContainerText.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/Custom_person_container.dart';
import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx/webviewx.dart';

import '../../../Entity/Sitio.dart';
import '../../Widget/custom_back_button.dart';
import '../Mapa/Mapa.dart';

class SitioPage extends GetView<SitioController> {
  
  const SitioPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SitioController>(
      builder: (sitio){
        return Scaffold(
          body: StreamBuilder(
            stream: sitio.cargarSitio(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
        
              if(snapshot.hasError){
                return const Center(child: Text(''));
              }
              
              if(snapshot.data==null){
                return const Center(child: Text(''));
              }
              
              return DetalleSitio(sitio: snapshot.data!,);
            }
          ),
        );
      }
    );
    
  }
}

class DetalleSitio extends StatelessWidget {

  final Sitio sitio;

  const DetalleSitio({
    super.key, required this.sitio,
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
                    // imageList: [
                    //   'https://picsum.photos/536/354',
                    //   'https://picsum.photos/536/354',
                    //   'https://picsum.photos/536/354',
                    //   'https://picsum.photos/536/354',
                    // ],
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
                            (index) => const Padding(
                              padding:  EdgeInsets.only(right: 2),
                              child: Icon(
                                BootstrapIcons.star_fill, 
                                color: AppBasicColors.yellow,
                              ),
                            ),
                          ),
                        ),
                          
                        const SizedBox(height: 8.0),
                        Text(
                          sitio.descripcion,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                            '<iframe style="width: 100%; height: 100%; border: none" src="https://maps.google.com/maps?q=10.4482712,-73.2639527&z=15&t=m&output=embed"></iframe>', 
                            mimeType: 'text/html'
                          ).toString(),
                          javascriptMode: JavascriptMode.unrestricted,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: ()async{
                                if (!await launchUrl(Uri.parse('https://www.google.com/maps/place/80+%2330-363+a+30-107,+Valledupar,+Cesar/@10.4482712,-73.2639527,17z/data=!3m1!4b1!4m15!1m8!3m7!1s0x8e8ab9b5d6cf71d7:0x84a43625b14c234a!2sValledupar,+Cesar!3b1!8m2!3d10.4742449!4d-73.2436335!16zL20vMDMxNWJx!3m5!1s0x8e8ab9f1b164e675:0x47ddcefaf834ce05!8m2!3d10.4482659!4d-73.2613778!16s%2Fg%2F11c67qczfw?entry=ttu'), mode: LaunchMode.externalApplication)) {
                                  Get.snackbar(
                                    'Error', 
                                    'No se ha podido completar la acción',
                                    snackPosition: SnackPosition.BOTTOM,
                                    margin: const EdgeInsets.all(10),
                                    backgroundColor: AppBasicColors.white
                                  );
                                }

                              }, 
                              child: const Text('Ver en Google Maps', style: TextStyle(color: AppBasicColors.blueMess, fontWeight: FontWeight.bold))
                          )],
                        ),

                        WidgetText(
                          text: 'Opiniones',
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            ControllerLogin _login = Get.find();
                            _login.validarPermisosAccion(
                              accion: ()=> showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Align(
                                    child: FractionallySizedBox(widthFactor: 15.0, child: Opinion())
                                  );
                                }
                              )
                            );
                            
                          },
                          buttonText: 'Calificar',
                          buttonFontSize: 20.0,
                        ),
                        const CustomPersonContainer(
                          icon: BootstrapIcons.person,
                          name: 'Nombre completo',
                          starCount: 5,
                          containerIconColor: AppBasicColors.colorButtonCancelar,
                          starColor: AppBasicColors.yellow
                        ),
                        const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta dignissimos numquam hic deserunt asperiores id obcaecati dicta repudiandae nihil magnam neque nostrum laborum, ullam distinctio voluptatem tenetur eveniet blanditiis ducimus.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100,)
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
      floatingActionButton: const BotonFlotanteContacto(),
    );
  }
}

class BotonFlotanteContacto extends StatefulWidget {
  const BotonFlotanteContacto({
    Key? key,
  }) : super(key: key);

  @override
  State<BotonFlotanteContacto> createState() => _BotonFlotanteContactoState();
}

class _BotonFlotanteContactoState extends State<BotonFlotanteContacto> {

  final ControllerLogin _login = Get.find();

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      Get.snackbar(
        'Error', 
        'No se ha podido completar la acción',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
        backgroundColor: AppBasicColors.white
      );
    }
  }

  List iconos = [];

  @override
  void initState() {
    iconos = [
      {
        'icono': BootstrapIcons.whatsapp,
        'background': AppBasicColors.greenWhat,
        'accion': () => _login.validarPermisosAccion(accion:()=>_launchUrl('https://wa.me'))
      },
      {
        'icono': BootstrapIcons.instagram,
        'background': AppBasicColors.redInst,
        'accion': () => _login.validarPermisosAccion(accion:()=>_launchUrl('https://www.instagram.com/'))
      },
      {
        'icono': BootstrapIcons.messenger,
        'background': AppBasicColors.blueMess,
        'accion': () => _login.validarPermisosAccion(accion:()=>_launchUrl('https://www.messenger.com/'))
      },
      {
        'icono': BootstrapIcons.facebook,
        'background': AppBasicColors.purpFace,
        'accion': () => _login.validarPermisosAccion(accion:()=>_launchUrl('https://www.facebook.com/'))
      },
      {
        'icono': BootstrapIcons.twitter,
        'background': AppBasicColors.blueTwit,
        'accion': () => _login.validarPermisosAccion(accion:()=>_launchUrl('https://www.twitter.com/'))
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
          onTap: iconos[index]['accion']
        ),
      ),
      backgroundColor: AppBasicColors.rgb,
      child: const Icon(
        BootstrapIcons.telephone,
        color: AppBasicColors.white,
      ),
    );
  }
}

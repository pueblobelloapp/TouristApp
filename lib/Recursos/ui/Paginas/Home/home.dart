import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:app_turismo_usuario/Recursos/Entity/categorias.dart';
import 'package:app_turismo_usuario/Recursos/Entity/sitio.dart';
import 'package:app_turismo_usuario/Recursos/routes/app_pages.dart';
import 'package:app_turismo_usuario/Recursos/ui/Paginas/Registrar/Registrar.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_turismo_usuario/Recursos/ui/Widget/tarjeta_turistica.dart';
import 'package:app_turismo_usuario/Recursos/ui/Widget/tarjeta_turistica_mini.dart';

import '../../../controllers/LoginControllers.dart';
import '../../../theme/app_theme.dart';
import '../../Widget/AppbarPersonalizada.dart';
import '../../Widget/ContainerText.dart';
import '../Detalles/detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ControllerLogin _login = Get.find();
  int currentPageIndex = 0;

  final List vistas = [
    {
      'color': AppBasicColors.blueMess,
      'selected-color': AppBasicColors.white,
      'icon': BootstrapIcons.book,
      'text': 'Municipio',
      'vista': const Detail(
        categoria: 'municipio',
      )
    },
    {
      'color': AppBasicColors.yellow,
      'selected-color': AppBasicColors.black,
      'icon': BootstrapIcons.brightness_alt_high,
      'text': 'Cultura',
      'vista': const Detail(
        categoria: 'Culturas',
      )
    },
    {
      'color': AppBasicColors.rgb,
      'selected-color': AppBasicColors.white,
      'icon': BootstrapIcons.flower1,
      'text': 'Etnoturismo',
      'vista': const Detail(
        categoria: 'Etnoturismo',
      )
    },
    {
      'icon': BootstrapIcons.house,
      'text': 'Sitios',
      'color': AppBasicColors.green,
      'selected-color': AppBasicColors.black,
      'vista': ListView(
        children: const [
          ListaTarjetasCategoria(
            tipo: Categorias.sitioInteres,
            titulo: 'Sitios de interés',
            mostrarCardsGrandes: true,
          ),
          ListaTarjetasCategoria(
            tipo: Categorias.sitioTuristico,
            titulo: 'Sitios turisticos',
          ),
          ListaTarjetasCategoria(
            tipo: Categorias.bienestar,
            titulo: 'Bienestar',
          ),
          ListaTarjetasCategoria(
            tipo: Categorias.ecoturismo,
            titulo: 'Ecoturismo',
          ),
          ListaTarjetasCategoria(
            tipo: Categorias.rural,
            titulo: 'Rural',
          ),
          SizedBox(
            height: 10,
          )
        ],
      )
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: vistas.length,
        tabBuilder: (int index, bool isActive) {
          final vista = vistas[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Icon(vista['icon'] as IconData,
                  size: 30,
                  color: isActive ? vista['color'] : AppBasicColors.lightBlack),
              Text(vista['text'] as String,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 11,
                      overflow: TextOverflow.ellipsis,
                      color: isActive
                          ? vista['color']
                          : AppBasicColors.lightBlack))
            ],
          );
        },
        activeIndex: currentPageIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 30,
        rightCornerRadius: 30,
        height: 60,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: AppBasicColors.white,
        shadow:
            Shadow(color: AppBasicColors.black.withOpacity(0.4), blurRadius: 8),
      ),
      appBar: currentPageIndex == 3
          ? PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: [
                      AppbarPersonalizada(
                        onTapBuscar: () {
                          Get.toNamed(Routes.ListSitio,
                              arguments: {'esBuscar': true});
                        },
                      ),
                      Obx(() {
                        return Visibility(
                            visible: _login.usuario.value.id.isEmpty,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 48, left: 10, right: 10),
                                child: Center(
                                  child: SizedBox(
                                    //height: 30.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            'Aún no has iniciado sesión...',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          AppBasicColors.rgb)),

                                              //elevation: 0.0,
                                              onPressed: () {
                                                Get.toNamed(Routes.Login);
                                              },
                                              child: const FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  'Crear cuenta',
                                                  style: TextStyle(
                                                      color:
                                                          AppBasicColors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13.0),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                )));
                      })
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: vistas[currentPageIndex]['vista'],
    );
  }
}

class ListaTarjetasCategoria extends StatelessWidget {
  final String tipo;
  final String titulo;
  final bool mostrarCardsGrandes;

  const ListaTarjetasCategoria(
      {Key? key,
      required this.tipo,
      required this.titulo,
      this.mostrarCardsGrandes = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: WidgetText(
            text: titulo,
            onPressed: () => Get.toNamed(Routes.ListSitio,
                arguments: {'titulo': titulo, 'esBuscar': false, 'tipo': tipo}),
            buttonText: 'Ver más',
          ),
        ),
        StreamBuilder<QuerySnapshot>(
            //stream: FirebaseFirestore.instance.collection('sites').snapshots(),
            stream: tipo == Categorias.sitioInteres
                ? FirebaseFirestore.instance.collection('sites').snapshots()
                : FirebaseFirestore.instance
                    .collection('sites')
                    .where('tipoTurismo', isEqualTo: tipo)
                    .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return mensaje('Cargando datos.', mostrarCargando: true);
              }
              if (snapshot.hasError) {
                return mensaje('Lo sentimos se ha producido un error.');
              }
              if (snapshot.data!.docs.isEmpty) {
                return mensaje("Sin datos para mostrar");
              }

              if (mostrarCardsGrandes) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Row(
                        children:
                            List.generate(snapshot.data!.docs.length, (index) {
                          dynamic data = snapshot.data!.docs[index].data();
                          Sitio _dataSitio = Sitio.fromMap(
                              data, snapshot.data!.docs[index].id);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: TarjetaTuristica(
                              sitio: _dataSitio,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                );
              }

              List data = groupListByTwo(snapshot.data!.docs);
              return SizedBox(
                height: 252,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(data.length, (index) {
                      return Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(data[index].length, (jdex) {
                            Sitio sitio = Sitio.fromMap(
                                data[index][jdex].data(), data[index][jdex].id);
                            return TarjetaTuristicaMini(
                                id: sitio.id,
                                imageUrl: sitio.fotos[0],
                                title: sitio.titulo,
                                descripcion: sitio.descripcion,
                                rating: sitio.calificacion);
                          }),
                        ),
                      );
                    }),
                  ),
                ),
              );
            }),
      ],
    );
  }

  SizedBox mensaje(texto, {bool mostrarCargando = false}) {
    return SizedBox(
      height: 150,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mostrarCargando
              ? const CircularProgressIndicator()
              : const SizedBox(),
          Text(texto, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      )),
    );
  }

  List groupListByTwo(List originalList) {
    List<List> groupedLists = [];
    for (int i = 0; i < originalList.length; i += 2) {
      if (i + 1 < originalList.length) {
        groupedLists.add([originalList[i], originalList[i + 1]]);
      } else {
        groupedLists.add([originalList[i]]);
      }
    }
    return groupedLists;
  }
}

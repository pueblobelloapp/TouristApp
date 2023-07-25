import 'package:app_turismo_usuario/Recursos/Modelos/Tarjeta_turistica/tarjeta_turistica.dart';
import 'package:app_turismo_usuario/Recursos/Modelos/Tarjeta_turistica_mini/tarjeta_turistica_mini.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Detalles/detail.dart';
import 'package:app_turismo_usuario/Recursos/Paginas/Lista_sitio/Site_list.dart';
import 'package:app_turismo_usuario/Recursos/Widget/Custom_elevated_button.dart';
import 'package:app_turismo_usuario/Recursos/Widget/custom_textFormField.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Modelos/Tarjeta_turistica/tarjeta_turistica_controller.dart';
import '../../Widget/ContainerText.dart';
import '../../theme/app_theme.dart';
import '../Login/LoginControllers.dart';
import '../Perfil/Perfil.dart';
import '../Recuperar_contrasena/RecuperarContrasena.dart';
import 'HomeController.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: _bodyContainer(context),
            ),
            Expanded(child: SingleChildScrollView(child: _listTurismo(context)))
            /*SizedBox(
                height: MediaQuery.of(context).size.height, //- 145.0,
                child: SingleChildScrollView(child: _listTurismo())),*/
          ],
        ),
      ),
    );
  }
}

Widget _bodyContainer(BuildContext context) {
  final controller = Get.put<HomeController>(HomeController());

  return Stack(children: [
    SafeArea(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                  child: SizedBox(
                      height: 30.0,
                      /*decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),*/
                      child: CustomTextFormField(
                        controller: controller.search,
                        icon: const Icon(
                          BootstrapIcons.search,
                          color: AppBasicColors.white,
                          size: 15.0,
                        ),
                        textGuide: 'Buscar...',
                        obscureText: false,
                        textInputType: TextInputType.name,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 5.0),
                        fillColor: const Color.fromRGBO(178, 190, 195, 1),
                      ))),
              const SizedBox(
                width: 5.0,
              ),
              Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(45, 52, 54, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: _popupMenuProfile(context)),
            ],
          ),
          const SizedBox(height: 12.0),
          _buildButtonRow(),
          const SizedBox(height: 12.0),
        ],
      ),
    ),
  ]);
}

Widget _buildButtonRow() {
  final buttons = [
    CustomElevatedButton(
        color: AppBasicColors.greyMun,
        textColor: AppBasicColors.black,
        fontWeight: FontWeight.bold,
        icon: BootstrapIcons.book,
        fixedSize: true,
        text: 'Información del municipio',
        onPressed: () {
          Get.to(const Detail());
        }),
    const SizedBox(
      width: 10.0,
    ),
    CustomElevatedButton(
        color: AppBasicColors.yellow,
        textColor: AppBasicColors.black,
        fontWeight: FontWeight.bold,
        icon: BootstrapIcons.brightness_alt_high,
        fixedSize: true,
        text: 'Cultura',
        onPressed: () {
          Get.to(const Detail());
        }),
    const SizedBox(
      width: 10.0,
    ),
    CustomElevatedButton(
        color: AppBasicColors.rgb,
        textColor: AppBasicColors.black,
        fontWeight: FontWeight.bold,
        icon: BootstrapIcons.bicycle,
        fixedSize: true,
        text: 'Etnoturismo',
        onPressed: () {
          Get.to(const Detail());
        }),
    /* CustomRowButton(
      color: AppBasicColors.greyMun,
      icon: BootstrapIcons.book,
      text: 'Información del municipio',
      onPressed: () {
        Get.to(const Detail());
      },
    ),*/

    /*CustomRowButton(
      color: AppBasicColors.yellow,
      icon: BootstrapIcons.brightness_alt_high,
      text: 'Cultura',
      onPressed: () {
        Get.to(const Detail());
      },
    ),*/

    /* CustomRowButton(
        color: AppBasicColors.rgb,
        icon: BootstrapIcons.bicycle,
        text: 'Etnoturismo',
        onPressed: () {
          Get.to(const Detail());
        })*/
  ];
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: buttons.map((button) => button).toList()),
  );
}

Widget _listTurismo(BuildContext context) {
  final TarjetaTuristicaController tarjetaTuristicaController =
      Get.put(TarjetaTuristicaController());

  return Column(
    children: [
      WidgetText(
        text: 'Sitios de interés',
        onPressed: () {
          Get.to(const SiteList());
        },
        buttonText: 'Ver más',
      ),
      SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              TarjetaTuristica(
                  titulo: 'Titulo',
                  icono: BootstrapIcons.star_fill,
                  descripcion:
                      'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                  imageUrl: 'Assets/Img/sitiocard.png'),
              TarjetaTuristica(
                  titulo: 'Titulo',
                  icono: BootstrapIcons.star_fill,
                  descripcion:
                      'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                  imageUrl: 'Assets/Img/sitiocard.png'),
              TarjetaTuristica(
                  titulo: 'Titulo',
                  icono: BootstrapIcons.star_fill,
                  descripcion:
                      'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                  imageUrl: 'Assets/Img/sitiocard.png'),
            ],
          ),
        ),
      ),
      WidgetText(
        text: 'Sitios turisticos',
        onPressed: () {
          //Get.to(SitiosTuristicoPage());
        },
        buttonText: 'Ver más',
      ),
      //Inicio creacion se sitio turistico
      syteTurismList(context),
      syteTurismList(context),
      ////Creacion fin sitio turistico
      WidgetText(
        text: 'Bienestar',
        onPressed: () {
          //Get.to(SitiosTuristicoPage());
        },
        buttonText: 'Ver más',
      ),
      /* const TarjetaTuristicaMini(
          imageUrl: 'Assets/Img/sitiocard.png',
          title: 'Titulo',
          descripcion:
              'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
          rating: 4),*/
      /*const TarjetaTuristicaMini(
          imageUrl: 'Assets/Img/sitiocard.png',
          title: 'Titulo',
          descripcion:
              'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
          rating: 4),*/
      WidgetText(
        text: 'Ecoturismo',
        onPressed: () {
          //Get.to(SitiosTuristicoPage());
        },
        buttonText: 'Ver más',
      ),
      /*const TarjetaTuristicaMini(
          imageUrl: 'Assets/Img/sitiocard.png',
          title: 'Titulo',
          descripcion:
              'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
          rating: 4),
      const TarjetaTuristicaMini(
          imageUrl: 'Assets/Img/sitiocard.png',
          title: 'Titulo',
          descripcion:
              'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
          rating: 4),*/
      WidgetText(
        text: 'Rural',
        onPressed: () {
          //Get.to(SitiosTuristicoPage());
        },
        buttonText: 'Ver más',
      ),
      /* const TarjetaTuristicaMini(
          imageUrl: 'Assets/Img/sitiocard.png',
          title: 'Titulo',
          descripcion:
              'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
          rating: 4),
      const TarjetaTuristicaMini(
          imageUrl: 'Assets/Img/sitiocard.png',
          title: 'Titulo',
          descripcion:
              'Descripción Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
          rating: 4)*/
    ],
  );
}

Widget _popupMenuProfile(context) {
  return PopupMenuButton(
    icon: Transform.scale(
      scale: 1.6,
      child: const Icon(
        BootstrapIcons.person,
        color: AppBasicColors.white,
      ),
    ),
    iconSize: 14.0,
    itemBuilder: (BuildContext context) {
      return <PopupMenuEntry>[
        PopupMenuItem(
          value: 1,
          child: Container(
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: ListTile(
              leading: Container(
                height: 30.0,
                width: 30.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(45, 52, 54, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: const Icon(
                  BootstrapIcons.person,
                  color: AppBasicColors.white,
                  //size: 15.0,
                ),
              ),
              title: const Text(
                'Mi perfil',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Container(
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: ListTile(
              leading: Container(
                height: 30.0,
                width: 30.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(45, 52, 54, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: const Icon(
                  BootstrapIcons.lock,
                  color: AppBasicColors.white,
                ),
              ),
              title: const Text(
                'Cambiar clave',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Container(
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: ListTile(
              leading: Container(
                height: 30.0,
                width: 30.0,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(45, 52, 54, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: const Icon(
                  BootstrapIcons.power,
                  color: AppBasicColors.white,
                ),
              ),
              title: const Text(
                'Cerrar sesión',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ];
    },
    onSelected: (value) {
      switch (value) {
        case 1:
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const ProfileDialog();
              });
          break;
        case 2:
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const RecoveryPassword();
              });
          break;
        case 3:
          ControllerLogin().logout();
          //Get.find<ControllerLogin>().logout();
          break;
      }
    },
  );
}

Widget syteTurismList(BuildContext context) {
  final Stream<QuerySnapshot> _sitesStream =
      FirebaseFirestore.instance.collection('sites').snapshots();
  return
      //color: AppBasicColors.lightBlack,
      StreamBuilder<QuerySnapshot>(
          stream: _sitesStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Lo sentimos se ha producido un error.'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Cargando datos.'));
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text("Sin datos para mostrar",
                      style: TextStyle(fontWeight: FontWeight.bold)));
            }
            return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      print("Data traida: ${data}");
                      return listDetails(data);
                    })
                    .toList()
                    .cast());
          });
}

Widget listDetails(Map<String, dynamic> data) {
  return TarjetaTuristicaMini(
      imageUrl: data['foto'][0],
      title: data['nombre'],
      descripcion: data['descripcion'],
      rating: 4);
}

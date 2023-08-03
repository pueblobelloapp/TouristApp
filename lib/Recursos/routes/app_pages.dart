import 'package:app_turismo_usuario/Recursos/bindings/Bindings.dart';
import 'package:app_turismo_usuario/Recursos/ui/Paginas/Home/home.dart';
import 'package:app_turismo_usuario/Recursos/ui/Paginas/Login/Login.dart';
import 'package:app_turismo_usuario/Recursos/ui/Paginas/Sitio/sitio.dart';
import 'package:get/get.dart';

import '../ui/Paginas/Lista_sitio/Site_list.dart';
import '../ui/Paginas/SplashScreen/splashScreen.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.Login, 
      page:()=> const Login(),
    ),
    GetPage(
      name: Routes.SplashScreen, 
      page:()=> const SplashScreen(),
    ),
    GetPage(
      name: Routes.Home, 
      page:()=> const Home(),
      binding: LoginBinding()
    ),
    GetPage(
      name: Routes.Sitio, 
      page:()=> const SitioPage(),
      binding: SitioBinding()
    ),
    GetPage(
      name: Routes.ListSitio, 
      page:()=> const SiteListPage(),
      binding: SitioBinding()
    ),
  ];
}
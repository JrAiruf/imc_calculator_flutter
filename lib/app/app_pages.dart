import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:imc_calculator_flutter/app/views/home/home_page.dart';
import 'package:imc_calculator_flutter/app/views/imc_page/imc_page.dart';
import 'package:imc_calculator_flutter/app/views/information_page/information_page.dart';
import 'package:imc_calculator_flutter/app/views/initial_page/initial_page.dart';
import 'app_routes.dart';
import 'controllers/home_controller/binds/home_controller_bind.dart';
import 'controllers/initial_controller/bind/initial_bind.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.APPHOME,
      page: () => const Home(),
      binding: HomeControllerBind(),
    ),
    GetPage(
      name: AppRoutes.INITIALSCREEN,
      page: () => const InitialPage(),
      binding: InitialBind(),
    ),
    GetPage(
      name: AppRoutes.IMCSCREEN,
      page: () => const ImcPage(),
    ),
    GetPage(
      name: AppRoutes.INFORMATIONPAGE,
      page: () => const InformationPage(),
    ),
  ];
}

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:imc_calculator_flutter/app/views/home/home_page.dart';
import 'package:imc_calculator_flutter/app/views/imc_page/imc_page.dart';
import 'package:imc_calculator_flutter/app/views/information_page/information_page.dart';
import 'app_routes.dart';
import 'controllers/home_controller/binds/home_controller_bind.dart';
import 'controllers/imc_controller/bind/imc_bind.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.APPHOME,
      page: () => Home(),
      binding: HomeControllerBind(),
    ),
    GetPage(
      name: AppRoutes.IMCSCREEN,
      page: () => const ImcPage(),
      binding: ImcBind(),
    ),
    GetPage(
      name: AppRoutes.INFORMATIONPAGE,
      page: () => InformationPage(),
    ),
  ];
}

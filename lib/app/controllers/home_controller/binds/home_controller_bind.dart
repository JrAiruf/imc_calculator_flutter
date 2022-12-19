import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/controllers/home_controller/home_controller.dart';
import 'package:imc_calculator_flutter/app/data/firebase_datasource/firebase_datasource.dart';

class HomeControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseDatabase(), fenix: true);
    Get.lazyPut(() => HomeController(),fenix: true);
  }
}

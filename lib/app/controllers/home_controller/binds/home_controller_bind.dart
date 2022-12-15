import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/controllers/home_controller/home_controller.dart';
import 'package:imc_calculator_flutter/app/data/firebase_datasource/firebase_datasource.dart';
import '../../../data/repositories/calculator_repository.dart';

class HomeControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseDatabase(),fenix: true);
    Get.lazyPut(() => CalculatorRepository(appDataSource: Get.find<FirebaseDatabase>()),fenix: true);
    Get.lazyPut(() => HomeController(calculatorRepo: Get.find<CalculatorRepository>()),fenix: true);
  }
}

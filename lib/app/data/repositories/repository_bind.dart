import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/data/firebase_datasource/firebase_datasource.dart';

class RepositoryBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseDatabase(),fenix: true);
  }
}

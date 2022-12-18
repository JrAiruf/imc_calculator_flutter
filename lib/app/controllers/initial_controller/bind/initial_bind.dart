import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/data/repositories/user_repository.dart';

import '../initial_controller.dart';

class InitialBind extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(
      () => UserRepository(),fenix: true
    );
    Get.lazyPut(
      () => InitialController(userRepository: Get.find<UserRepository>()),fenix: true
    );
   
  }
}

import 'package:get/get.dart';

import '../../../data/firebase_datasource/firebase_datasource.dart';
import '../initial_controller.dart';

class InitialBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InitialController(firebaseDatabase: Get.find<FirebaseDatabase>()),
    );
  }
}

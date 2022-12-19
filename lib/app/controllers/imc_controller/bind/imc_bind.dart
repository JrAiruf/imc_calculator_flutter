import 'package:get/get.dart';

import '../../../data/firebase_datasource/firebase_datasource.dart';
import '../../../data/repositories/user_repository.dart';
import '../imc_controller.dart';

class ImcBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseDatabase(), fenix: true);
    Get.lazyPut(() => UserRepository(appDatasource: Get.find<FirebaseDatabase>()));
    Get.lazyPut(() => ImcController(userRepository: Get.find<UserRepository>()));
  }
}

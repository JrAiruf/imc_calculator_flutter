import 'package:get/get.dart';
import '../../../data/firebase_datasource/firebase_datasource.dart';
import '../../../data/repositories/user_repository.dart';
import '../home_controller.dart';

class HomeControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseDatabase(), fenix: true);
    Get.lazyPut(() => UserRepository(appDatasource: Get.find<FirebaseDatabase>()),fenix: true);
    Get.lazyPut(() => HomeController(userRepository: Get.find()));
  }
}

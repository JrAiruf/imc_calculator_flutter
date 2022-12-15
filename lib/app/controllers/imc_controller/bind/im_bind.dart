import 'package:get/get.dart';

import '../../../data/firebase_datasource/firebase_datasource.dart';

class ImcBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseDatabase(),fenix: true);
  }
}

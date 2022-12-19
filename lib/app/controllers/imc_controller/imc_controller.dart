import 'package:get/get.dart';
import '../../data/firebase_datasource/firebase_datasource.dart';
import '../../models/imc_model.dart';

class ImcController extends GetxController {
  ImcController({FirebaseDatabase? firebaseDatabase})
      : _firebaseDatabase = firebaseDatabase!;

  final FirebaseDatabase _firebaseDatabase;

  Rx<ImcModel> imc = ImcModel().obs;

}

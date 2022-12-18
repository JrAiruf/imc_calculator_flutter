import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/models/user_model.dart';

import '../../data/firebase_datasource/firebase_datasource.dart';
import '../../models/imc_model.dart';

class ImcController extends GetxController {
  ImcController({FirebaseDatabase? firebaseDatabase})
      : _firebaseDatabase = firebaseDatabase!;

  final FirebaseDatabase _firebaseDatabase;

  Rx<ImcModel> imc = ImcModel().obs;

  Future<void> saveUserImc(UserModel user) async {
    final result = await _firebaseDatabase.getCollection();
  }
}

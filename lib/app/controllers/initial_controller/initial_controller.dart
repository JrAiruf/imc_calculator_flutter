import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/firebase_datasource/firebase_datasource.dart';
import '../../models/user_model.dart';

class InitialController extends GetxController {
  InitialController({FirebaseDatabase? firebaseDatabase})
      : _firebaseDatabase = firebaseDatabase!;

  final FirebaseDatabase _firebaseDatabase;

  final emailController = TextEditingController();
  final nameController = TextEditingController();

  final userKey = GlobalKey<FormState>();

  Future<void> addUser({@required UserModel? user}) async {
    final result = await _firebaseDatabase.getCollection();
    result!.add(user!.toMap());
  }
}

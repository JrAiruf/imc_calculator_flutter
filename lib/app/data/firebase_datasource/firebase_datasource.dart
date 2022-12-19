import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imc_calculator_flutter/app/data/app_data_source.dart';

class FirebaseDatabase implements AppDataSource {
  @override
  Future<void> saveUserImc(Map<String, dynamic>? userImc) async {
    FirebaseFirestore.instance.collection('users').add(userImc!);
  }

  @override
  Future<List<Map<String, dynamic>>> getUserImc(
      {required Map<String, dynamic> userData}) async {
    final result = await FirebaseFirestore.instance.collection('users').get();
    final list = result.docs.map((items) => items.data()).toList();
    return list;
  }
}

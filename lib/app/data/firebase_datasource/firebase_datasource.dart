import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imc_calculator_flutter/app/data/app_data_source.dart';

class FirebaseDatabase implements AppDataSource {
  @override
  Future<List<Map<String, dynamic>>>? getCollection() async {
    final result = await FirebaseFirestore.instance.collection('users').get();
    final list = result.docs as List<Map<String, dynamic>>;
    return list;
  }
}

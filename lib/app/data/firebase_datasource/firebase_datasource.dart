import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imc_calculator_flutter/app/data/app_data_source.dart';

class FirebaseDatabase implements AppDataSource {
  @override
  Future<void> saveUserImc(Map<String, dynamic>? user) async {
    final result = FirebaseFirestore.instance.collection('users').doc();
    result.set(user!);
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>>? getUserImc() {
    final result = FirebaseFirestore.instance.collection('users').doc().get();
    return result;
  }

  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>?
      getAllUsers() async {
    final result = FirebaseFirestore.instance.collection('users');
    QuerySnapshot<Map<String, dynamic>> body = await result.get();
    return body.docs;
  }
}

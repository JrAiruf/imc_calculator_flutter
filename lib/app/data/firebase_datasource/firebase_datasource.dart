import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imc_calculator_flutter/app/data/app_data_source.dart';

class FirebaseDatabase implements AppDataSource {
  @override
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>?
      getCollection() async {
    final result = await FirebaseFirestore.instance.collection('users');
    QuerySnapshot<Map<String, dynamic>> body = await result.get();
    return body.docs;
  }

  @override
  Future<void> addUserToDatabase({Map<String, dynamic>? user}) async {
    final result = await FirebaseFirestore.instance.collection('users').doc();
    user!['id'] = result.id;
    if (user['id'] != null) {
    result.set(user);
    }
  }
}

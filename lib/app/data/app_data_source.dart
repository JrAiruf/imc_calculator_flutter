import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppDataSource {
  Future<List<QueryDocumentSnapshot<Map<String,dynamic>>>>? getCollection();
  Future<void> addUserToDatabase({Map<String, dynamic>? user});
}

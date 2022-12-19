import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppDataSource {
  Future<DocumentSnapshot<Map<String, dynamic>>>? getUserImc();
  Future<void>saveUserImc(Map<String, dynamic> userImc);
}

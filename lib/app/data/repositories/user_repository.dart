import 'package:flutter/services.dart';
import '../../models/user_model.dart';
import '../app_data_source.dart';
import '../firebase_datasource/firebase_datasource.dart';

class UserRepository {
  final AppDataSource _appDataSource = FirebaseDatabase();

  Future<List<UserModel>>? getUserCollection() async {
    try {
      final result = await _appDataSource.getCollection();
      return result!.map((user) => UserModel.fromMap(user.data())).toList();
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addUser({UserModel? user}) async {
    final result = await getUserCollection();
    result!.add(user!);
  }
}

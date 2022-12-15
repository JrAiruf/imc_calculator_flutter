import 'package:flutter/services.dart';
import 'package:imc_calculator_flutter/app/data/firebase_datasource/firebase_datasource.dart';
import 'package:imc_calculator_flutter/app/models/user_model.dart';
import '../app_data_source.dart';

class CalculatorRepository {
  CalculatorRepository({required AppDataSource? appDataSource});

  final AppDataSource _appDataSource = FirebaseDatabase();

  Future<List<UserModel>>? getUserCollection() async {
    try {
      final result = await _appDataSource.getCollection() as List<Map<String, dynamic>>;
      return result.map((user) => UserModel.fromMap(user)).toList();
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }
}

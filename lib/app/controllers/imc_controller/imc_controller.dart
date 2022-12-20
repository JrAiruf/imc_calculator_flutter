import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/data/repositories/user_repository.dart';
import '../../models/imc_model.dart';

class ImcController extends GetxController {
  ImcController({UserRepository? userRepository})
      : _userRepository = userRepository!;

  final UserRepository _userRepository;

  List<ImcModel> imcList = [];

  final isLoading = false.obs;
  final alert = false.obs;
  final danger = false.obs;

  Future<ImcModel> getUserImc(ImcModel imcData) async {
    isLoading.value = true;
    final data = await _userRepository.getUserImc(userData: imcData.toMap());
    isLoading.value = false;
    return ImcModel.fromMap(data!);
  }

  Future<List<ImcModel>> deleteUserImc(ImcModel imcData) async {
    isLoading.value = true;
    final result = await _userRepository.deleteUserImc(imcData.toMap());
    imcList = result.map((item) => ImcModel.fromMap(item)).toList();
    imcList.remove(imcData);
    isLoading.value = false;
    update();
    return imcList;
  }

  Future<List<ImcModel>> getAllUserImc(ImcModel imcModel) async {
    isLoading.value = true;
    final result =
        await _userRepository.getAllUserImc(userData: imcModel.toMap());
    imcList = result.map((data) => ImcModel.fromMap(data)).toList();
    isLoading.value = false;
    update();
    return imcList;
  }

  String? setImcResultInformation(ImcModel imcData) {
    final result = double.parse(imcData.result ?? '1');
    if (result < 18.5) {
      alert.value = true;
      return 'Com o peso atual, o resultado do imc está baixo para sua altura.';
    } else if (result > 18.5 && result < 24.99) {
      alert.value = false;
      return 'Nessa faixa de peso, o resultado do imc é considerado normal.';
    } else if (result > 25 && result < 29.99) {
      alert.value = true;
      return 'O resultado do imc atual é apontado como sobrepeso.';
    } else if (result > 30 && result < 34.99) {
      alert.value = true;
      return 'O resultado do imc atual é apontado como obesidade de grau 1.';
    } else if (result > 35 && result < 39.99) {
      danger.value = true;
      return 'O resultado do imc atual é apontado como obesidade de grau 2.';
    } else {
      danger.value = true;
      return 'O resultado do imc atual é apontado como obesidade de grau 3.';
    }
  }

  Color setColors(SetSafety safeLevel) {
    switch (safeLevel) {
      case SetSafety.danger:
        return Colors.redAccent;
      case SetSafety.beware:
        return Colors.amber;
      case SetSafety.normal:
        return Colors.green;
    }
  }
}

enum SetSafety { danger, beware, normal }

import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/data/repositories/user_repository.dart';
import '../../models/imc_model.dart';

class ImcController extends GetxController {
  ImcController({UserRepository? userRepository})
      : _userRepository = userRepository!;

  final UserRepository _userRepository;

  List<ImcModel> imcList = [];

  final isLoading = false.obs;

  Future<List<ImcModel>> getUserImc(ImcModel imcModel) async {
    isLoading.value = true;
    final result =
        await _userRepository.getAllUserImc(userData: imcModel.toMap());
    imcList = result.map((data) => ImcModel.fromMap(data)).toList();
    isLoading.value = false;
    update();
    return imcList;
  }
}

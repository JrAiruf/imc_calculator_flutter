import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/repositories/calculator_repository.dart';
import '../../models/user_model.dart';

class HomeController extends GetxController {
  HomeController({@required CalculatorRepository? calculatorRepo})
      : _calculatorRepository = calculatorRepo!;

  final CalculatorRepository _calculatorRepository;
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  Rx<UserModel> user = UserModel().obs;

  String? calculateImc({@required String? weight, @required String? height}) {
    user.value.currentImc = (double.parse(weight!.replaceAll('.', '')) /
            (double.parse(height!.replaceAll('.', '')) * double.parse(height)))
        .toStringAsFixed(2);
    return user.value.currentImc;
  }

  clearFields() {
    heightController.clear();
    weightController.clear();
  }
}

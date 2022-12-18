import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../models/user_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeController extends GetxController {

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  Rx<UserModel> user = UserModel().obs;
  
  MaskTextInputFormatter heightMask = MaskTextInputFormatter(mask: '#.##');
  MaskTextInputFormatter weightMask = MaskTextInputFormatter(mask: '##.##');

  String? calculateImc({@required String? weight, @required String? height}) {
    user.value.currentImc = (double.parse(weight!.replaceAll('.', '')) /
            (double.parse(height!.replaceAll('.', '')) * double.parse(height)))
        .toStringAsFixed(2);
    return user.value.currentImc;
  }

  updateMask(String value) {
    switch (value.length) {
      case 5:
        return weightMask.updateMask(mask: '###.##');
    }
    weightMask.updateMask(mask: '##.##');
  }

  clearFields() {
    heightController.clear();
    weightController.clear();
  }
}

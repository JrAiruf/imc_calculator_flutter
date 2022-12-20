// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/app_routes.dart';
import '../../controllers/imc_controller/imc_controller.dart';
import '../../data/imc_text.dart';
import '../../models/imc_model.dart';
import '../components/app_bottom_navigation_bar.dart';
import '../components/app_information_card.dart';
import '../components/navigation_bar_enum.dart';

class InformationPage extends GetView<ImcController> {
  InformationPage({super.key});
  final imcText = ImcInformationText();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final imcModel = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          child: Row(
            children: const [
              Text(
                'Saiba Mais',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () {
            Get.defaultDialog(
              title: 'O que é Imc?',
              titleStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.purple,
              content: SizedBox(
                height: height * 0.45,
                width: width * 0.9,
                child: ListView(
                  children: [
                    Text(
                      imcText.getText(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(
        position: NavigationBarPosition.information,
      ),
      body: GetBuilder(
          init: controller,
          builder: (_) {
            return Visibility(
              visible: imcModel != null,
              replacement: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(color: Colors.purple),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Get.offNamed(AppRoutes.IMCSCREEN);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add_circle_outline_outlined,
                          color: Colors.white,
                          size: 45,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Adicionar',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              child: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(color: Colors.purple),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppInformationCard(
                      imcModel: imcModel ?? ImcModel(),
                      informationText: controller
                          .setImcResultInformation(imcModel ?? ImcModel())!,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

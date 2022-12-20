// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/controllers/home_controller/home_controller.dart';
import '../../app_routes.dart';
import '../../models/imc_model.dart';
import '../components/app_bottom_navigation_bar.dart';
import '../components/navigation_bar_enum.dart';

final _formkey = GlobalKey<FormState>();

class Home extends GetView<HomeController> {
  Home({super.key});

  ImcModel imcModel = ImcModel();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Get.offNamed(AppRoutes.IMCSCREEN);
            },
            icon: const Icon(Icons.list_alt))
      ]),
      bottomNavigationBar: const AppBottomNavigationBar(
        position: NavigationBarPosition.newCalculation,
      ),
      body: GetBuilder(
          init: controller,
          builder: (context) {
            return SizedBox(
              height: height,
              width: width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_chart_outlined,
                        size: 180,
                        color: Colors.purple,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          imcModel.height = value;
                        },
                        inputFormatters: [controller.heightMask],
                        controller: controller.heightController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.purple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          label: const Text('Altura'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          imcModel.weight = value;
                        },
                        onChanged: (value) {
                          controller.updateMask(value);
                        },
                        inputFormatters: [controller.weightMask],
                        controller: controller.weightController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.purple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          label: const Text('Peso'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Colors.purple, width: 3)),
                        onPressed: () {
                          if (controller.heightController.text.isNotEmpty &&
                              controller.weightController.text.isNotEmpty &&
                              controller.weightController.text.length > 3) {
                            _formkey.currentState!.save();
                            imcModel.lastCalculation =
                                DateTime.now().toString();
                            imcModel.result = controller.calculateImc(
                                weight: controller.weightController.text,
                                height: controller.heightController.text);
                            Get.defaultDialog(
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Get.back();
                                          controller.clearFields();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios_new,
                                          color: Colors.white,
                                          size: 33,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              title: 'Resultado',
                              titleStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              backgroundColor: Colors.purple,
                              content: SizedBox(
                                height: height * 0.22,
                                width: width * 0.95,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Seu imc é: ${imcModel.result ?? ''}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      width: width * 0.9,
                                      height: 85,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              'Deseja salvar o resultado?',
                                              style: TextStyle(
                                                  color: Colors.purple),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    fixedSize:
                                                        const Size(18, 30),
                                                  ),
                                                  onPressed: () {
                                                    controller
                                                        .saveUserImc(imcModel);
                                                    Get.back();
                                                    controller.clearFields();
                                                    Get.offNamed(
                                                        AppRoutes.IMCSCREEN,
                                                        arguments: imcModel);
                                                  },
                                                  child: const Text(
                                                    'Sim',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.purple,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    fixedSize:
                                                        const Size(18, 30),
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                    controller.clearFields();
                                                  },
                                                  child: const Text(
                                                    'Não',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.purple,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            Get.defaultDialog(
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.back();
                                      controller.clearFields();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: Colors.white,
                                      size: 33,
                                    ),
                                  ),
                                ),
                              ],
                              title: 'Opa !',
                              titleStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              backgroundColor: Colors.purple,
                              content: SizedBox(
                                  height: height * 0.07,
                                  width: width * 0.95,
                                  child: const Center(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Informe os dados corretamente \n Altura(0.00)\n Peso(00.00) ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )),
                            );
                          }
                        },
                        child: SizedBox(
                          height: 50,
                          width: width * 0.9,
                          child: const Center(
                            child: Text(
                              'Calcular',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

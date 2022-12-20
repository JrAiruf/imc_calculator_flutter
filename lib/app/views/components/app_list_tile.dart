import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/app_routes.dart';
import '../../models/imc_model.dart';

class AppListTile extends StatelessWidget {
  const AppListTile(
      {super.key, required this.imcData, this.height, this.width, this.onTap});
  final ImcModel imcData;
  final double? height;
  final double? width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        height: height ?? 30,
        width: width ?? 210,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.height,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Altura: ${imcData.height}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    width: width! * 0.41,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.monitor_weight,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Peso: ${imcData.weight}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: height!,
                width: 1,
                color: Colors.black,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height! * 0.22,
                    color: Colors.black,
                  ),
                  Text(
                    'Imc: ${imcData.result}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                            middleTextStyle: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                            title: '',
                            middleText: 'Deseja excluir este resultado?',
                            actions: [
                              Container(
                                width: width! * 0.9,
                                height: 85,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              fixedSize: const Size(18, 30),
                                            ),
                                            onPressed: onTap,
                                            child: const Text(
                                              'Sim',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.purple,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              fixedSize: const Size(18, 30),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text(
                                              'Não',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
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
                          );
                        },
                        icon: const Icon(Icons.highlight_remove_sharp),
                      ),
                      const SizedBox(width: 35),
                      IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              middleTextStyle: const TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold),
                              title: '',
                              middleText: 'Deseja selecionar este resultado?',
                              actions: [
                                Container(
                                  width: width! * 0.9,
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                fixedSize: const Size(18, 30),
                                              ),
                                              onPressed: () {
                                                Get.offAllNamed(
                                                    AppRoutes.INFORMATIONPAGE,
                                                    arguments: imcData);
                                              },
                                              child: const Text(
                                                'Sim',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.purple,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                fixedSize: const Size(18, 30),
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text(
                                                'Não',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
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
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

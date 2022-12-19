import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../data/imc_text.dart';
import '../components/app_bottom_navigation_bar.dart';
import '../components/navigation_bar_enum.dart';

class InformationPage extends StatelessWidget {
  InformationPage({super.key});

  final imcText = ImcInformationText();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(
        position: NavigationBarPosition.information,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 45),
        decoration: const BoxDecoration(color: Colors.purple),
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(
                height: 15,
              ),
              Container(
                height: height * 0.25,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

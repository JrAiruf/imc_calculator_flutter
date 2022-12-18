import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/app_routes.dart';
import '../../controllers/initial_controller/initial_controller.dart';
import '../../models/user_model.dart';

class InitialPage extends GetView<InitialController> {
  InitialPage({super.key});

  UserModel user = UserModel();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.purple),
        height: height,
        width: width,
        child: GetBuilder(
            init: controller,
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: controller.userKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_chart_outlined,
                            size: 180,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onSaved: (value) => user.email =  controller.emailController.text,
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              label: const Text(
                                'E-mail',
                                style: TextStyle(color: Colors.white),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onSaved: (value) => user.name = controller.nameController.text,
                            controller: controller.nameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              label: const Text(
                                'Nome Completo',
                                style: TextStyle(color: Colors.white),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              controller.userKey.currentState!.save();
                              await controller.addUser(user: user);
                              Get.offNamed(AppRoutes.APPHOME);
                            },
                            child: const SizedBox(
                              height: 50,
                              width: 150,
                              child: Center(
                                child: Text(
                                  'Prosseguir',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.purple),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

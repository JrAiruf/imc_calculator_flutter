import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/imc_controller/imc_controller.dart';

class ImcPage extends GetView<ImcController> {
  const ImcPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Últimos resultados'),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: FutureBuilder(
            future: controller.getUserImc(imcModel: Get.arguments),
            builder: (_, c) {
              return ListView.builder(
                  itemCount: controller.imcList.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                        leading: Text(controller.imcList[index].result!));
                  });
            }),
      ),
    );
  }
}


/*  */
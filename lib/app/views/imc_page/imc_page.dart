import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/imc_controller/imc_controller.dart';
import '../components/app_tile.dart';
import '../home/home_page.dart';

class ImcPage extends GetView<ImcController> {
  const ImcPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => Home());
              },
              icon: const Icon(Icons.arrow_back_ios))
        ],
        title: const Text('Últimos resultados'),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: FutureBuilder(
            future: controller.getUserImc(Get.arguments),
            builder: (_, c) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(bottom: 15),
                  itemCount: controller.imcList.length,
                  itemBuilder: (_, index) {
                    return AppTile(
                      imcData: controller.imcList[index],
                      height: height * 0.2,
                      width: width * 0.9,
                    );
                  });
            }),
      ),
    );
  }
}


/*  */
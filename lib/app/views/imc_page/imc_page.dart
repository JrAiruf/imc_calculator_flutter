import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_calculator_flutter/app/models/imc_model.dart';
import '../../controllers/imc_controller/imc_controller.dart';
import '../components/app_list_tile.dart';
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
            future: controller.getAllUserImc(Get.arguments ?? ImcModel()),
            builder: (_, list) {
              if (!list.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(bottom: 15),
                  itemCount: controller.imcList.length,
                  itemBuilder: (_, index) {
                    return AppListTile(
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
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../models/imc_model.dart';

class AppInformationCard extends StatelessWidget {
  const AppInformationCard({
    Key? key,
    required this.imcModel,
    this.informationText,
  }) : super(key: key);

  final ImcModel imcModel;
  final String? informationText;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: height * 0.25,
        width: width * 0.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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
                        'Altura: ${imcModel.height}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
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
                        'Peso: ${imcModel.weight}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Imc: ${imcModel.result ?? ''}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  const Icon(
                    Icons.check_circle_outline,
                    size: 45,
                    color: Colors.green,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                informationText ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

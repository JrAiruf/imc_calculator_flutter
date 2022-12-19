import 'package:flutter/material.dart';
import '../../models/imc_model.dart';

class AppTile extends StatelessWidget {
  const AppTile({super.key, required this.imcData, this.height, this.width});

  final ImcModel imcData;
  final double? height;
  final double? width;
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
                crossAxisAlignment: CrossAxisAlignment.end,
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
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.info_outline))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

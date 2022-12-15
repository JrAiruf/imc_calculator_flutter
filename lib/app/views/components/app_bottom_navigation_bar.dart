import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:imc_calculator_flutter/app/app_routes.dart';
import 'package:imc_calculator_flutter/app/views/components/navigation_bar_enum.dart';

import 'navigation_bar_items.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key, this.height, this.position});

  final NavigationBarPosition? position;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            )),
            shape: BoxShape.rectangle),
        child: Row(
          children: [
            Expanded(
              child: NavigationBarItems(
                navigate: () {
                  Get.offNamed(AppRoutes.APPHOME);
                },
                color: position == NavigationBarPosition.newCalculation
                    ? Colors.white

                    : Colors.purple ,
                primaryColor: position == NavigationBarPosition.newCalculation
                    ? Colors.purple
                    : Colors.white, 
                icon: Icons.add,
                position: NavigationBarPosition.newCalculation,
                title: 'Novo Cálculo',
              ),
            ),
            const VerticalDivider(
              width: 1,
              color: Colors.white,
            ),
            Expanded(
              child: NavigationBarItems(
                navigate: () {
                  Get.offNamed(AppRoutes.INFORMATIONPAGE);
                },
                color: position == NavigationBarPosition.information
                    ? Colors.white
                    
                    : Colors.purple,
                primaryColor: position == NavigationBarPosition.information
?                     Colors.purple
                    : Colors.white,
                position: NavigationBarPosition.information,
                icon: Icons.list,
                title: 'Informações',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

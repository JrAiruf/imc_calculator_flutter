import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../components/app_bottom_navigation_bar.dart';
import '../components/navigation_bar_enum.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(
        position: NavigationBarPosition.information,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.purple),
        height: height,
        width: width,
      ),
    );
  }
}

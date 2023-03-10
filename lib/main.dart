import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/app_pages.dart';
import 'app/app_routes.dart';
import 'app/controllers/home_controller/binds/home_controller_bind.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ImcCalculatorApp());
}

class ImcCalculatorApp extends StatelessWidget {
  const ImcCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeControllerBind(),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.APPHOME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

import 'package:el_gasous/core/localization/change_lacal.dart';
import 'package:el_gasous/core/services/services.dart';
import 'package:el_gasous/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialService();
  
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    LocalController controller =Get.put(LocalController());
    Get.put(PlayersSave());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: controller.apptheme,
      locale: controller.language,
      getPages: routes,
    );
  }
}
import 'package:el_gasous/controller/home_controller.dart';
import 'package:el_gasous/core/constant/color.dart';
import 'package:el_gasous/views/widget/home/custom_grid_view.dart';
import 'package:el_gasous/views/widget/home/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeContrller contrller = Get.put(HomeContrller());
    return Scaffold(
        
        key: contrller.scaffoldkey,
        endDrawer:const Drawer(
          width: 200,
        ),
        backgroundColor: ColorApp.secondColor,
        body: Container(
            padding:const EdgeInsets.all(5),
            
            child: ListView(
             
              children: [
               SimpleAppBar(title: "يلا بينا", icon: Icons.list,onPressed: (){contrller.scaffoldkey.currentState!
                                .openEndDrawer();},),
               const SizedBox(
                  height: 60,
                ),
               const CustomGridView()
              ],
            )));
  }
}

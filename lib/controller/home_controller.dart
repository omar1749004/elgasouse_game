import 'package:el_gasous/core/constant/app_rout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeContrller extends GetxController{
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>() ;
  gotoAddingplyer(int id){
    Get.offNamed(AppRout.addingPlayersid , arguments: {
      "id" : id 
    });
  }
}
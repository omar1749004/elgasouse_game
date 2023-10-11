
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>alertExiteApp( void Function()? onPressed ){
 
   Get.defaultDialog(
    title :"Woring",
    middleText: "Do You Want Exit App", 
    actions: [
      ElevatedButton(
        onPressed: (){
        Get.back();
      }, child:const Text("cancel")),
       ElevatedButton(onPressed: onPressed, child:const Text("ok")),
    ]
  );
   return Future.value(true);
}
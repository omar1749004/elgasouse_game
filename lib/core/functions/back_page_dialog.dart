import 'package:el_gasous/core/constant/app_rout.dart';
import 'package:el_gasous/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>backDialog(String title,String middletext){
 
   Get.defaultDialog(
    title :title,
    middleText: middletext, 
    titleStyle:const TextStyle(color: Colors.white,),
    middleTextStyle: const TextStyle(color: Colors.white,fontSize: 18,height: 2),
    backgroundColor: ColorApp.secondColor,
    
    actions: [
      
       ElevatedButton(
        style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(32),
      side:const BorderSide(color: Colors.red)
    )
  ),
      ),

        onPressed: (){
        Get.offAllNamed(AppRout.homeid);
       }, child:const Text("ايوه متأكد",style: TextStyle(fontSize: 16, color: Colors.red,fontWeight: FontWeight.bold),)),
       ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(32),
      side:const BorderSide(color: Colors.green)
    )
  )
      ),
        onPressed: (){
        Get.back();
      }, child:const Text("لا خلاص",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 17),)),
    ]
  );
   return  Future.value(true);
}
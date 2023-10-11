import 'package:audioplayers/audioplayers.dart';
import 'package:el_gasous/core/constant/app_rout.dart';
import 'package:el_gasous/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnBoardingBottom extends StatelessWidget {
  const CustomOnBoardingBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
              
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              onPressed: ()async{
                await AudioPlayer().play(AssetSource('audio/mixkit-tribal-dry-drum-558.wav'));

                Get.toNamed(AppRout.homeid);
                
              },
            color: ColorApp.kPrimaryColor,
            height: 80,
              child:const Text("العب",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize:35
                ),),
            );
  }
}
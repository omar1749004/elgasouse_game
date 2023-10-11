import 'package:el_gasous/core/constant/color.dart';
import 'package:el_gasous/core/constant/image_asset.dart';
import 'package:el_gasous/views/widget/onboarding/custom_bottom.dart';
import 'package:flutter/material.dart';

class OnBourding extends StatelessWidget {
  const OnBourding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.secondColor,
      body: Container(
        padding:const EdgeInsets.all(30),
        child: ListView(
          physics:const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        children: [
         const SizedBox(height: 100,),
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
            child: Image.asset(ImageAsset.onboardingImage,width: 50,height: 300,fit: BoxFit.cover,)),
          const SizedBox(height: 40),
         const Text("الجاسوس",textAlign: TextAlign.center, style: TextStyle(
            fontSize:40,fontWeight: FontWeight.bold ,color: Colors.white
          ),),
         const SizedBox(height: 70,),
          const CustomOnBoardingBottom(),
          
        ],
      )),
    );
  }
}
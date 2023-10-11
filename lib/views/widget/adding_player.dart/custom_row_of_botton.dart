import 'package:el_gasous/controller/adding_players_controller.dart';
import 'package:el_gasous/core/constant/color.dart';
import 'package:el_gasous/views/widget/adding_player.dart/custom_add_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRowOfBotton extends GetView<AddingPlayersController> {
  const CustomRowOfBotton(
      {super.key, required this.onnext});
 
  final void Function()? onnext;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if(controller.playersList.length!=20)
       const CustomAddBottom() ,
       const SizedBox(
          width: 20,
        ),
        
        Container(
          margin:const EdgeInsets.only(left: 60),
          child: MaterialButton(
             splashColor: controller.playersList.length>= 3 ? Theme.of(context).splashColor : Colors.transparent,
            highlightColor: controller.playersList.length>= 3 ? Theme.of(context).highlightColor : Colors.transparent, 
            highlightElevation: controller.playersList.length>= 3? 8:0,
            elevation:controller.playersList.length>= 3? 2:0,
            padding:const EdgeInsets.symmetric(horizontal: 30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed:controller.playersList.length>= 3? onnext:(){},
            color: controller.playersList.length>= 3? ColorApp.kPrimaryColor:const Color.fromARGB(255, 102, 76, 109),
            height: 50,
            child:const Text(
              "التالي",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }
}

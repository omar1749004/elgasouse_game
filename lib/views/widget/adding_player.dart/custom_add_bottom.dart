import 'package:el_gasous/controller/adding_players_controller.dart';
import 'package:el_gasous/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAddBottom extends GetView<AddingPlayersController> {
  const CustomAddBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: ColorApp.kPrimaryColor,
            borderRadius: BorderRadius.circular(90)),
        child: IconButton(
          onPressed: () {
            customDialog(() {
              controller.isrepet = false;
              controller.playername.clear();
              return Future.value(true);
            }, context);
          },
          iconSize: 29,
          icon:const Icon(
            Icons.person_add_alt_1_rounded,
            color: Colors.white,
          ),
        ));
  }
}

Future<bool> customDialog(
    Future<bool> Function()? onWillPop, BuildContext context) {
  Get.defaultDialog(
      title: "سجل اسمك",
      onWillPop: onWillPop,
      backgroundColor: ColorApp.secondColor,
      titleStyle:const TextStyle(color: Colors.white),
      content: GetBuilder<AddingPlayersController>(
        builder: (controller) => Form(
          child: Column(
            children: [
             const SizedBox(
                height: 20,
              ),
              if (controller.isrepet)
                Text(
                  "اسم ${controller.playername.text} موجود بالفعل",
                  style:const TextStyle(color: Colors.white),
                ),
              Container(
                width: 500,
                padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextFormField(
                  maxLength: 12,
                  controller: controller.playername,
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style:const TextStyle(color: Colors.white),
                  decoration:const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorApp.kPrimaryColor)),
                    hintText: "اسم اللاعب",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorApp.kPrimaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorApp.kPrimaryColor)),
                  ),
                ),
              ),
             const SizedBox(
                height: 30,
              ),
              MaterialButton(
                padding:const EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  controller.addPlayers();
                },
                color: ColorApp.kPrimaryColor,
                height: 50,
                child:const Text(
                  "إضافة",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ));
  return Future.value(true);
}

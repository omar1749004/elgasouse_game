import 'package:el_gasous/controller/frist_stage_controller.dart';
import 'package:el_gasous/core/constant/color.dart';
import 'package:el_gasous/core/functions/back_page_dialog.dart';
import 'package:el_gasous/views/widget/The_first_stage.dart/custom_animated_container.dart';
import 'package:el_gasous/views/widget/The_first_stage.dart/custom_body.dart';
import 'package:el_gasous/views/widget/The_first_stage.dart/cutom_title.dart';

import 'package:el_gasous/views/widget/custom_defalut_bottom.dart';

import 'package:el_gasous/views/widget/home/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FristStage extends StatelessWidget {
  const FristStage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FristStageController());
    return Scaffold(
      backgroundColor: ColorApp.secondColor,
      body: WillPopScope(
         onWillPop: () => backDialog( "متأكد؟", "لو خرجت الدور هيبوظ"),
        child: GetBuilder<FristStageController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Padding(
                  padding:const EdgeInsets.only(top: 24),
                  child:
                      SimpleAppBar(title: "", onPressed: () {
                        backDialog( "متأكد؟", "لو خرجت الدور هيبوظ") ;
                      }, icon: Icons.home),
                ),
                CustomAnimatedContainer(
                  woring: controller.woring,
                  opacity: controller.opacity,
                ),
                CustomTitle(
                  text: controller.playerName,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBody(
                  text: controller.timeAsk
                      ? controller.printAsked()
                      : controller.printText(),
                ),
                const Spacer(),
                if( controller.opacity == 0)
                CustomDefaluteBottom(
                    onPressed: () {
                      controller.nextString();
                    },
                    text: controller.lastask ? "صوت" : "التالي"),
                SizedBox(
                  height: controller.isvisble ? 70 : 250,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

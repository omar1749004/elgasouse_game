import 'package:el_gasous/controller/vote_controller.dart';

import 'package:el_gasous/core/constant/color.dart';
import 'package:el_gasous/core/functions/back_page_dialog.dart';

import 'package:el_gasous/data/service/static/color_list.dart';
import 'package:el_gasous/views/widget/custom_app_bar.dart';
import 'package:el_gasous/views/widget/custom_defalut_bottom.dart';
import 'package:el_gasous/views/widget/vote.dart/custom_circile.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widget/vote.dart/custom_player_name.dart';

class VotePage extends StatelessWidget {
  const VotePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VoteController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorApp.secondColor,
      body: WillPopScope(
         onWillPop: () => backDialog( "متأكد؟", "لو خرجت الدور هيبوظ"),
        child: GetBuilder<VoteController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomAppBar(
                  text: controller.isShow
                      ? "الجاسوس هو"
                      : "${controller.votePlaye} اختار الشخص اللي شاكك فيه",
                      fontSize: controller.foucuse ?40: 20,
                ),
                const SizedBox(
                  height: 25,
                ),
                if (controller.isShow)
                  const SizedBox(
                    height: 120,
                  ),
                if (controller.isShow)
                  CustomCircle(
                      name: controller.currentPlay,
                      fontSize: controller.foucuse ? 40 : 20),
                if (controller.foucuse)
                  const SizedBox(
                    height: 120,
                  ),
                if (controller.foucuse)
                  CustomDefaluteBottom(
                      onPressed: () {
                        controller.gotoSelectWord();
                      },
                      text: "التالي"),
                if (!controller.isShow)
                  Container(
                    height: 640,
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: ListView.builder(
                      physics: controller.playersList.length < 10
                          ? const NeverScrollableScrollPhysics()
                          : const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.playersList.length,
                      itemBuilder: (context, index) {
                        if (controller.votePlaye !=
                            controller.playersList[index].name) {
                          return CustomPlayerName(
                            color:
                                colorList[controller.playersList[index].color!],
                            onPressed: () {
                              controller.selectPlayers(index);
                            },
                            name: controller.playersList[index].name!,
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

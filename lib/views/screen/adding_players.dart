import 'package:el_gasous/controller/adding_players_controller.dart';
import 'package:el_gasous/core/constant/color.dart';
import 'package:el_gasous/core/functions/back_page_dialog.dart';
import 'package:el_gasous/data/service/static/color_list.dart';
import 'package:el_gasous/views/widget/adding_player.dart/custom_dalete_bottom.dart';
import 'package:el_gasous/views/widget/adding_player.dart/custom_player_name.dart';
import 'package:el_gasous/views/widget/adding_player.dart/custom_row_of_botton.dart';
import 'package:el_gasous/views/widget/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddingPlayers extends StatelessWidget {
  const AddingPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddingPlayersController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorApp.secondColor,
        body: WillPopScope(
          onWillPop: () => backDialog( "متأكد؟", "لو خرجت الدور هيبوظ"),
          child: GetBuilder<AddingPlayersController>(
            builder: (controller) => Stack(children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    CustomAppBar(
                      text: controller.printAppBarText(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      height: 530,
                      child: ListView.builder(
                        physics: controller.playersList.length <= 6
                            ? const NeverScrollableScrollPhysics()
                            : const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.playersList.length,
                        controller: controller.scrollController,
                        itemBuilder: (context, index) => Row(
                          children: [
                            CustomPlayersName(
                              color:
                                  colorList[controller.playersList[index].color!],
                              name: controller.playersList[index].name!,
                            ),
                            CustomDeleteBottom(
                              onPressed: () {
                                controller.deletePlayers(
                                    controller.playersList[index].name!);
                              },
                              color:
                                  colorList[controller.playersList[index].color!],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomRowOfBotton(onnext: () {
                      controller.gotoplaye();
                    }),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}

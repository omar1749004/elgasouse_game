import 'package:el_gasous/controller/result_controller.dart';
import 'package:el_gasous/core/constant/app_rout.dart';
import 'package:el_gasous/core/constant/color.dart';
import 'package:el_gasous/core/functions/back_page_dialog.dart';
import 'package:el_gasous/data/service/static/color_list.dart';
import 'package:el_gasous/views/widget/custom_app_bar.dart';
import 'package:el_gasous/views/widget/result/custom_point_container.dart';
import 'package:el_gasous/views/widget/result/custom_result_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    ResultController controller = Get.put(ResultController());
    return Scaffold(
      backgroundColor: ColorApp.secondColor,
      body: WillPopScope(
         onWillPop: () => backDialog( "متأكد؟", "لو خرجت الدور هيبوظ"),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const CustomAppBar(
                text: "النتيجة",
                fontSize: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                height: 500,
                child: ListView.builder(
                  physics: controller.playersList.length <= 5
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.playersList.length,
                  itemBuilder: (context, index) => CustomPointContainer(
                    name: controller.playersList[index].name!,
                    point: "${controller.playersList[index].point}",
                    color: colorList[controller.playersList[index].color!],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CutomResultBottom(
                          onPressed: () {
                            controller.myController.playersList = null;
                            Get.offAllNamed(AppRout.homeid);
                          },
                          color: Colors.red,
                          text: "فورة جديدة"),
                      CutomResultBottom(
                          onPressed: () {
                            Get.offAllNamed(AppRout.addingPlayersid,
                                arguments: {"id": controller.id});
                          },
                          color: Colors.green,
                          text: "دور جديد"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: CutomResultBottom(
                        onPressed: () {
                          Get.offAllNamed(AppRout.homeid);
                        },
                        color: const Color.fromARGB(255, 112, 1, 196),
                        text: "تغيير نوع اللعبة"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

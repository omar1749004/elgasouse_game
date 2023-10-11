import 'package:el_gasous/controller/select_word_controller.dart';
import 'package:el_gasous/core/constant/color.dart';
import 'package:el_gasous/core/functions/back_page_dialog.dart';
import 'package:el_gasous/views/widget/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectWord extends StatelessWidget {
  const SelectWord({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectWordController());
    return Scaffold(
      backgroundColor: ColorApp.secondColor,
      body: Container(
        padding: const EdgeInsets.all(5),
        child: WillPopScope(
           onWillPop: () => backDialog( "متأكد؟", "لو خرجت الدور هيبوظ"),
          child: GetBuilder<SelectWordController>(
            builder: (controller) => Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomAppBar(
                  text: "${controller.selectPlayer} تفتكر الكلام على اي",
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 550,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.wordList.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        onPressed: () {
                          controller.checkChouse(
                              controller.wordList[index], index);
                        },
                        color: controller.colotList[index],
                        height: 50,
                        child: Text(
                          controller.wordList[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                    ),
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

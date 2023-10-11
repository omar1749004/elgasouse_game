
import 'package:el_gasous/controller/home_controller.dart';
import 'package:el_gasous/data/service/static/actegories_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomGridView extends GetView<HomeContrller> {
  const CustomGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
        clipBehavior: Clip.none,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoeiesList.length,
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          
            childAspectRatio: 0.9, crossAxisSpacing: 10, crossAxisCount: 2),
        itemBuilder: (context, index) => InkWell(
          
              onTap: () {
                
                controller.gotoAddingplyer(categoeiesList[index].id!);
              },
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomContainer(
                      color: categoeiesList[index].color!,
                      name: categoeiesList[index].name!,
                    ),
                    Positioned(
                        right: 30,
                        top: -53,
                        child: CustomImage(
                          image: categoeiesList[index].image!,
                        )),
                  ],
                ),
              ),
            ));
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            width: 120,
            height: 100,
            fit: BoxFit.fill,
          )),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.color, required this.name});
  final Color color;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 20),
        width: 180,
        height: 110,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Text(
          name,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}

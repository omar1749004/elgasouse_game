import 'package:el_gasous/core/constant/color.dart';
import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget {
  const SimpleAppBar(
      {super.key, required this.title,required this.onPressed, required this.icon});
  final String title;
  final void Function()? onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 10,
        ),
        Text(
          title,
          style:const TextStyle(color: Colors.white, fontSize: 35),
        ),
        const Spacer(
          flex: 7,
        ),
        Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorApp.kPrimaryColor,
            ),
            child: IconButton(
              onPressed: onPressed,
              icon:  Icon(color: Colors.white, icon),
            )),
      ],
    );
  }
}

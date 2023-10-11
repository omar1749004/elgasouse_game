import 'package:flutter/material.dart';

class CustomDeleteBottom extends StatelessWidget {
  const CustomDeleteBottom(
      {super.key, required this.onPressed, required this.color});
  final void Function()? onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(90)),
        child: IconButton(
          padding: const EdgeInsets.only(bottom: 18),
          onPressed: onPressed,
          iconSize: 29,
          icon: const Icon(
            Icons.minimize_sharp,
            color: Colors.white,
          ),
        ));
  }
}

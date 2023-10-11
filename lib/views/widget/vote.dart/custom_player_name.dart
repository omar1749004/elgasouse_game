import 'package:flutter/material.dart';

class CustomPlayerName extends StatelessWidget {
  const CustomPlayerName(
      {super.key,
      required this.onPressed,
      required this.color,
      required this.name});
  final void Function() onPressed;
  final Color color;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        onPressed: onPressed,
        color: color,
        height: 50,
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }
}

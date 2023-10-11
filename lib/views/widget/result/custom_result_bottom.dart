import 'package:flutter/material.dart';

class CutomResultBottom extends StatelessWidget {
  const CutomResultBottom(
      {super.key,
      required this.onPressed,
      required this.color,
      required this.text});
  final void Function() onPressed;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 181,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: onPressed,
        color: color,
        height: 50,
        
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }
}

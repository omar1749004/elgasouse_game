import 'package:flutter/material.dart';

class CustomPlayersName extends StatelessWidget {
  const CustomPlayersName({super.key, required this.name, required this.color});
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        curve: Curves.linearToEaseOut,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8),
        height: 60,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

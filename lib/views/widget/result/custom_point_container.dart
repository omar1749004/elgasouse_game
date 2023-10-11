import 'package:flutter/material.dart';

class CustomPointContainer extends StatelessWidget {
  const CustomPointContainer(
      {super.key,
      required this.name,
      required this.point,
      required this.color});
  final String name;
  final String point;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(4),
      height: 60,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding:const EdgeInsets.only(right: 20),
            child: Text(
              name,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  point,
                  style: const TextStyle(color: Colors.white),
                ),
                const Text("نقطة", style: TextStyle(color: Colors.white))
              ],
            ),
          )
        ],
      ),
    );
  }
}

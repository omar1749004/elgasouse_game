import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({super.key, required this.name, required this.fontSize});
final String name ;
final double fontSize ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: 300,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Center(
                        child: CircleAvatar(
                            radius: 130, backgroundColor: Colors.white),
                      ),
                      Center(
                        child: Text(
                         name,
                          style: TextStyle(
                              fontSize: fontSize,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
  }
}
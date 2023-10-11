import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({super.key, required this.opacity, required this.woring});
final double opacity ;
final String woring ;
  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                   const SizedBox(
                      height: 20,
                    ),
                    AnimatedOpacity(
                      opacity: opacity,
                      curve: Curves.easeInOut,
                      duration:const Duration(seconds: 1),
                      child: Container(
                        alignment: Alignment.center,
                        margin:const EdgeInsets.all(30),
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                          
                            color:const Color.fromARGB(255, 255, 0, 140),
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          woring,
                          style:const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                );
  }
}
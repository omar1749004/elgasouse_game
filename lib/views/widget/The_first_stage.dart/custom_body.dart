
import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(
                  text,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      
                      fontSize: 20),
                );
  }
}
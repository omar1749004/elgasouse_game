import 'package:el_gasous/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
                  text,
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                      color: ColorApp.kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                );
  }
}
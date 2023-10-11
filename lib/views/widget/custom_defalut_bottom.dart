import 'package:el_gasous/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomDefaluteBottom extends StatelessWidget {
  const CustomDefaluteBottom({super.key,required this.onPressed, required this.text});
final void Function()? onPressed ;
final String text ;
  @override
  Widget build(BuildContext context) {
    return   MaterialButton(
                    padding:const EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: onPressed,
                    color: ColorApp.kPrimaryColor,
                    height: 50,
                    child: Text(
                      text,
                      style:const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                  )
                ;
  }
}
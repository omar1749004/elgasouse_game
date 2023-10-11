import 'package:el_gasous/core/functions/back_page_dialog.dart';
import 'package:el_gasous/views/widget/home/simple_app_bar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, this.fontSize = 20} );
final String text ;
final double? fontSize ;
  @override
  Widget build(BuildContext context) {
    return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SimpleAppBar(
                        title: "",
                        icon: Icons.home,
                        onPressed: () {
                          backDialog( "متأكد؟", "لو خرجت الدور هيبوظ") ;
                        },
                      ),
                      Positioned(
                        top: 40,
                        right: 0,
                        left: 0,
                        child: Container(
                            padding:const EdgeInsets.symmetric(horizontal: 60),
                            child: Text(
                              text ,
                              style: TextStyle(
                                  fontSize: fontSize,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ],
                  );
  }
}
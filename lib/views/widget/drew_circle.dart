import 'dart:math';

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final List<Offset> points;

  CirclePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..style = PaintingStyle.fill
      ..strokeWidth = 6;
      
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2;
    

    // Draw the outer circle
   

    // Fill the big circle with small circles
    
       
      // Draw a small circle if it's within the big circle
       for (var point in points) {
            final dx = center.dx - point.dx;
           final dy = center.dy - point.dy;
         final distance = sqrt(dx * dx + dy * dy);
          

      // Draw a small circle if it's within the big circle
      if (distance < outerRadius -8.8) {
        final rect = Rect.fromCenter(
            center: point,
            width: 20, // Rectangle width
            height: 20, // Rectangle height
          );
          const  radius =  Radius.circular(16); // Round rectangle corner radius

          final roundRect = RRect.fromRectAndRadius(rect, radius);
       canvas.drawRRect(roundRect, paint);
      }
      }
       
      
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
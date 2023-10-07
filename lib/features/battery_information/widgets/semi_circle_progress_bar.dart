import 'package:flutter/material.dart';
import 'dart:math';

//-------------------------------------------------------------------------//

class SemicircleProgressPainter extends CustomPainter {
  final double progress;
  final int batteryTemp;

  SemicircleProgressPainter(this.progress, this.batteryTemp);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the background (empty) arc
    final backgroundPaint = Paint()
      ..color = Colors.white70 // Set the background color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16.0;

    // Draw the filled progress arc
    final progressPaint = Paint()
      ..color = Colors.green // Set the progress color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16.0; // Set the stroke width to the height to create a semicircle

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    const startAngle = -pi / 1; // Start angle is at 12 o'clock (top)
    final sweepAngle = pi * progress; // Half of a circle

    // Draw the background (empty) arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + sweepAngle,
      pi - sweepAngle,
      false,
      backgroundPaint,
    );

    // Draw the filled progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    // Draw the text inside the semicircle
    TextSpan span = TextSpan(
      text: '$batteryTemp °C', // Convert progress to percentage
      style: const TextStyle(fontSize: 36, color: Colors.white),
    );
    TextPainter textPainter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    textPainter.paint(
        canvas,
        Offset(center.dx - textPainter.width / 2,
            center.dy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
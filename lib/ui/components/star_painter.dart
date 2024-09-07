import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final double rating;
  final int index;

  StarPainter({required this.rating, required this.index});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.amber;

    final starPath = Path()
      ..moveTo(size.width * 0.5, 0)
      ..lineTo(size.width * 0.618, size.height * 0.38)
      ..lineTo(size.width, size.height * 0.38)
      ..lineTo(size.width * 0.691, size.height * 0.618)
      ..lineTo(size.width * 0.809, size.height)
      ..lineTo(size.width * 0.5, size.height * 0.764)
      ..lineTo(size.width * 0.191, size.height)
      ..lineTo(size.width * 0.309, size.height * 0.618)
      ..lineTo(0, size.height * 0.38)
      ..lineTo(size.width * 0.382, size.height * 0.38)
      ..close();

    double fillPercentage =
        ((rating - index).clamp(0.0, 1.0) * 100).ceilToDouble() / 100;

    canvas.save();
    canvas.clipRect(
        Rect.fromLTWH(0, 0, size.width * fillPercentage, size.height));
    canvas.drawPath(starPath, paint);
    canvas.restore();

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black54;

    canvas.drawPath(starPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

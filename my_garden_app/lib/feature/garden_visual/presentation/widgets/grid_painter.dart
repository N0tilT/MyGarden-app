import 'package:flutter/material.dart';

class GardenVisualGrid extends StatelessWidget {
  final Offset offset;

  const GardenVisualGrid({required this.offset});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _GridPainter(offset: offset),
    );
  }
}

class _GridPainter extends CustomPainter {
  final Offset offset;

  _GridPainter({required this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5;

    for (double i = 0; i < size.width; i += 50) {
      canvas.drawLine(
        Offset(i + offset.dx, 0),
        Offset(i + offset.dx, size.height),
        paint,
      );
    }
    for (double i = 0; i < size.height; i += 50) {
      canvas.drawLine(
        Offset(0, i + offset.dy),
        Offset(size.width, i + offset.dy),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

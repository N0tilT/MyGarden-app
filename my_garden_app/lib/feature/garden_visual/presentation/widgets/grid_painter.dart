import 'package:flutter/material.dart';

class GardenVisualGrid extends StatelessWidget {
  final Offset offset;

  const GardenVisualGrid({required this.offset});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: _GridPainter(offset: offset),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final Offset offset;

  _GridPainter({required this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 0.5;

    // Calculate visible vertical lines
    final startX = offset.dx % 50;
    for (double x = startX; x < size.width; x += 50) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Calculate visible horizontal lines
    final startY = offset.dy % 50;
    for (double y = startY; y < size.height; y += 50) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

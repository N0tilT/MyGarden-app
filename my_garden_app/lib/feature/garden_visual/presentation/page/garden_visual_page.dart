import 'dart:math';
import 'package:flutter/material.dart';

class GardenVisualPage extends StatefulWidget {
  const GardenVisualPage();
  @override
  _GardenVisualPageState createState() => _GardenVisualPageState();
}

class _GardenVisualPageState extends State<GardenVisualPage> {
  List<RectangleItem> rectangles = [];
  RectangleItem? currentRectangle;
  Offset offset = Offset.zero;

  void _addRectangle(int width, int height) {
    final newPosition = Offset(
      -50.0 * (offset.dx ~/ 50 - 3),
      -50.0 * (offset.dy ~/ 50 - 6),
    );

    setState(() {
      currentRectangle = RectangleItem(
        width: width,
        height: height,
        truePosition: newPosition,
        position: newPosition,
        isMoving: true,
      );
    });
  }

  void _confirmRectangle() {
    if (currentRectangle == null) return;

    final rectBounds = _getRotatedBounds(currentRectangle!);

    if (rectangles.any(
      (rectangle) {
        if (rectangle == currentRectangle!) return false;
        return rectBounds.overlaps(
          _getRotatedBounds(rectangle),
        );
      },
    )) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Durations.long1,
          content: Text('Ошибка: Прямоугольник перекрывает существующий.'),
        ),
      );
      return;
    }

    setState(() {
      if (!rectangles.any(
        (element) => element == currentRectangle!,
      )) {
        rectangles.add(currentRectangle!);
      }
      currentRectangle = null;
    });
  }

  Offset _rotatePoint(Offset point, Offset center, double angle) {
    final radians = angle * (pi / 180);
    final x = point.dx - center.dx;
    final y = point.dy - center.dy;
    return Offset(
      x * cos(radians) - y * sin(radians) + center.dx,
      x * sin(radians) + y * cos(radians) + center.dy,
    );
  }

  Rect _getRotatedBounds(RectangleItem rectangle) {
    final corners = [
      rectangle.position,
      rectangle.position.translate(rectangle.width * 50, 0),
      rectangle.position.translate(0, rectangle.height * 50),
      rectangle.position.translate(rectangle.width * 50, rectangle.height * 50),
    ]
        .map(
          (point) =>
              _rotatePoint(point, rectangle.position, rectangle.rotation),
        )
        .toList();

    final minX = corners.map((e) => e.dx).reduce(min).round();
    final minY = corners.map((e) => e.dy).reduce(min).round();
    final maxX = corners.map((e) => e.dx).reduce(max).round();
    final maxY = corners.map((e) => e.dy).reduce(max).round();

    return Rect.fromLTRB(
      50.0 * (minX ~/ 50),
      50.0 * (minY ~/ 50),
      50.0 * (maxX ~/ 50),
      50.0 * (maxY ~/ 50),
    );
  }

  void _toggleMovement(RectangleItem rectangle) {
    setState(() {
      rectangle.isMoving = !rectangle.isMoving;
      currentRectangle = rectangle.isMoving ? rectangle : null;
    });
  }

  void _moveRectangle(Offset delta) {
    if (currentRectangle == null) return;

    setState(() {
      currentRectangle!.truePosition += delta;
      final deltaX = currentRectangle!.truePosition.dx.round() -
          currentRectangle!.position.dx;
      final deltaY = currentRectangle!.truePosition.dy.round() -
          currentRectangle!.position.dy;

      if (deltaX.abs() >= 50) {
        currentRectangle!.position += Offset(deltaX >= 0 ? 50 : -50, 0);
      }
      if (deltaY.abs() >= 50) {
        currentRectangle!.position += Offset(0, deltaY >= 0 ? 50 : -50);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Бесконечное клеточное поле')),
      body: GestureDetector(
        onPanUpdate: (details) {
          if (currentRectangle?.isMoving == true) {
            _moveRectangle(details.delta);
          } else {
            offset += details.delta;
            setState(() {});
          }
        },
        child: Stack(
          children: [
            Container(color: Colors.lightGreen[100]),
            _buildGrid(),
            ...rectangles.map((rectangle) => _buildRectangle(rectangle)),
            if (currentRectangle != null) _buildCurrentRectangle(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingButtons(),
    );
  }

  Widget _buildRectangle(RectangleItem rectangle) {
    return Positioned(
      left: rectangle.position.dx + offset.dx,
      top: rectangle.position.dy + offset.dy,
      child: Transform.rotate(
        angle: rectangle.rotation * (pi / 180),
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
            _toggleMovement(rectangle);
            _showRectangleDialog(context, rectangle: rectangle);
          },
          child: _rectangleContainer(rectangle, Colors.blue),
        ),
      ),
    );
  }

  Widget _buildCurrentRectangle() {
    return Positioned(
      left: currentRectangle!.position.dx + offset.dx,
      top: currentRectangle!.position.dy + offset.dy,
      child: Transform.rotate(
        angle: currentRectangle!.rotation * (pi / 180),
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
            _showRectangleDialog(context, rectangle: currentRectangle);
          },
          child: _rectangleContainer(
            currentRectangle!,
            Colors.red.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _rectangleContainer(RectangleItem rectangle, Color color) {
    return Container(
      width: rectangle.width * 50,
      height: rectangle.height * 50,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color:
              currentRectangle == rectangle ? Colors.blue : Colors.transparent,
          width: 2,
        ),
      ),
      child: Center(child: Text('${rectangle.width}x${rectangle.height}')),
    );
  }

  Widget _buildGrid() {
    return CustomPaint(
      size: Size.infinite,
      painter: GridPainter(offset: offset),
    );
  }

  Row _buildFloatingButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => _showRectangleDialog(context),
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          onPressed: _confirmRectangle,
          child: const Icon(Icons.check),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          onPressed: () {
            currentRectangle?.rotate();
            setState(() {});
          },
          child: const Icon(Icons.rotate_right),
        ),
      ],
    );
  }

  void _showRectangleDialog(BuildContext context, {RectangleItem? rectangle}) {
    final widthController =
        TextEditingController(text: rectangle?.width.toString() ?? '');
    final heightController =
        TextEditingController(text: rectangle?.height.toString() ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            rectangle == null
                ? 'Введите размеры прямоугольника'
                : 'Редактировать размеры',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: widthController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Ширина (кол-во клеток)'),
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Высота (кол-во клеток)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final width = int.tryParse(widthController.text) ?? 0;
                final height = int.tryParse(heightController.text) ?? 0;

                if (width > 0 && height > 0 && width <= 15 && height <= 15) {
                  setState(() {
                    if (rectangle == null) {
                      _addRectangle(width, height);
                    } else {
                      rectangle.width = width;
                      rectangle.height = height;
                    }
                  });
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Введите натуральное число от 1 до 15.'),
                    ),
                  );
                }
              },
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }
}

class RectangleItem {
  int width;
  int height;
  Offset truePosition;
  Offset position;
  bool isMoving;
  double rotation = 0;

  RectangleItem({
    required this.width,
    required this.height,
    required this.truePosition,
    required this.position,
    this.isMoving = false,
  });

  void rotate() {
    rotation = (rotation + 90) % 360;
  }
}

class GridPainter extends CustomPainter {
  final Offset offset;

  GridPainter({required this.offset});

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

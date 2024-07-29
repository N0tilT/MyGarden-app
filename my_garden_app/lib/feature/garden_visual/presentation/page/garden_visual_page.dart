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
  static const double gridSize = 50.0;

  void _addRectangle(RectangleType type) {
    setState(() {
      currentRectangle = RectangleItem(
        type: type,
        truePosition: Offset.zero -
            Offset(50.0 * (offset.dx ~/ 50 - 3), 50.0 * (offset.dy ~/ 50 - 6)),
        position: Offset.zero -
            Offset(50.0 * (offset.dx ~/ 50 - 3), 50.0 * (offset.dy ~/ 50 - 6)),
        isMoving: true,
      );
    });
  }

  void _confirmRectangle() {
    if (currentRectangle != null) {
      final rectBounds = _getRotatedBounds(currentRectangle!);

      // Check for overlaps with existing rectangles
      final List<bool> hasOverlap = rectangles.map((rectangle) {
        if (rectangle == currentRectangle) return false;
        final existingBounds = _getRotatedBounds(rectangle);
        return rectBounds.overlaps(existingBounds);
      }).toList();

      if (!hasOverlap.any(
        (element) => element,
      )) {
        setState(() {
          if (!rectangles.any(
            (element) => currentRectangle! == element,
          )) {
            rectangles.add(currentRectangle!);
          }
          currentRectangle = null; // Clear the selected rectangle
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Durations.long1,
            content: Text('Ошибка: Прямоугольник перекрывает существующий.'),
          ),
        );
      }
    }
  }

  Offset _rotatePoint(Offset point, Offset center, double angle) {
    final radians = angle * (3.14159265359 / 180);

    // Translate point to origin
    final translatedX = point.dx - center.dx;
    final translatedY = point.dy - center.dy;

    // Rotate point
    return Offset(
      translatedX * cos(radians) - translatedY * sin(radians) + center.dx,
      translatedX * sin(radians) + translatedY * cos(radians) + center.dy,
    );
  }

  Rect _getRotatedBounds(RectangleItem rectangle) {
    final topLeft = rectangle.position.translate(0, 0);
    final topRight = rectangle.position.translate(rectangle.width, 0);
    final bottomLeft = rectangle.position.translate(0, rectangle.height);
    final bottomRight =
        rectangle.position.translate(rectangle.width, rectangle.height);

    final corners = [topLeft, topRight, bottomLeft, bottomRight].map((point) {
      return _rotatePoint(point, rectangle.position, rectangle.rotation);
    }).toList();

    // Determine the bounding box from the rotated corners
    final minX =
        corners.map((e) => e.dx).reduce((a, b) => a < b ? a : b).round();
    final minY =
        corners.map((e) => e.dy).reduce((a, b) => a < b ? a : b).round();
    final maxX =
        corners.map((e) => e.dx).reduce((a, b) => a > b ? a : b).round();
    final maxY =
        corners.map((e) => e.dy).reduce((a, b) => a > b ? a : b).round();

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
      if (rectangle.isMoving) {
        currentRectangle = rectangle;
      } else {
        currentRectangle = null;
      }
    });
  }

  void _moveRectangle(Offset delta) {
    if (currentRectangle != null) {
      setState(() {
        currentRectangle!.truePosition += delta;
        final double deltaX = currentRectangle!.truePosition.dx.round() -
            currentRectangle!.position.dx;
        final double deltaY = currentRectangle!.truePosition.dy.round() -
            currentRectangle!.position.dy;
        if (deltaX >= 50) {
          currentRectangle!.position = Offset(
            currentRectangle!.position.dx + gridSize,
            currentRectangle!.position.dy,
          );
        } else if (deltaX <= -50) {
          currentRectangle!.position = Offset(
            currentRectangle!.position.dx - gridSize,
            currentRectangle!.position.dy,
          );
        }
        if (deltaY >= 50) {
          currentRectangle!.position = Offset(
            currentRectangle!.position.dx,
            currentRectangle!.position.dy + gridSize,
          );
        } else if (deltaY <= -50) {
          currentRectangle!.position = Offset(
            currentRectangle!.position.dx,
            currentRectangle!.position.dy - gridSize,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Бесконечное клеточное поле')),
      body: GestureDetector(
        onPanUpdate: (details) {
          if (currentRectangle != null && currentRectangle!.isMoving) {
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
            ...rectangles.map((rectangle) {
              return Positioned(
                left: rectangle.position.dx + offset.dx,
                top: rectangle.position.dy + offset.dy,
                child: Transform.rotate(
                  angle: rectangle.rotation *
                      (3.14159265359 / 180), // Convert to radians
                  alignment:
                      Alignment.topLeft, // Rotate around the top-left corner
                  child: GestureDetector(
                    onTap: () => _toggleMovement(rectangle),
                    child: Container(
                      width: rectangle.width,
                      height: rectangle.height,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: currentRectangle == rectangle
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(rectangle.type.toString().split('.').last),
                      ),
                    ),
                  ),
                ),
              );
            }),
            if (currentRectangle != null)
              Positioned(
                left: currentRectangle!.position.dx + offset.dx,
                top: currentRectangle!.position.dy + offset.dy,
                child: Transform.rotate(
                  angle: currentRectangle!.rotation *
                      (3.14159265359 / 180), // Convert to radians
                  alignment:
                      Alignment.topLeft, // Rotate around the top-left corner
                  child: Container(
                    width: currentRectangle!.width,
                    height: currentRectangle!.height,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Row(
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
              if (currentRectangle != null) {
                setState(() {
                  currentRectangle!.rotate(); // Rotate the current rectangle
                });
              }
            },
            child: const Icon(Icons.rotate_right),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return CustomPaint(
      size: Size.infinite,
      painter: GridPainter(offset: offset),
    );
  }

  void _showRectangleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Выберите тип прямоугольника'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: RectangleType.values.map((RectangleType type) {
              return ListTile(
                title: Text(type.toString().split('.').last),
                onTap: () {
                  _addRectangle(type);
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class RectangleItem {
  final RectangleType type;
  Offset truePosition;
  Offset position;
  bool isMoving;
  double rotation = 0; // New property for rotation

  RectangleItem({
    required this.truePosition,
    required this.type,
    required this.position,
    this.isMoving = false,
    this.rotation = 0, // Initialize rotation
  });

  // Method to rotate rectangle
  void rotate() {
    rotation = (rotation + 90) % 360; // Rotate clockwise by 90 degrees
  }

  double get width {
    switch (type) {
      case RectangleType.oneByOne:
        return 50;
      case RectangleType.twoByOne:
        return 100;
      case RectangleType.twoByThree:
        return 100;
      default:
        return 50;
    }
  }

  double get height {
    switch (type) {
      case RectangleType.oneByOne:
        return 50;
      case RectangleType.twoByOne:
        return 50;
      case RectangleType.twoByThree:
        return 150;
      default:
        return 50;
    }
  }
}

enum RectangleType { oneByOne, twoByOne, twoByThree }

class GridPainter extends CustomPainter {
  Offset offset;

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

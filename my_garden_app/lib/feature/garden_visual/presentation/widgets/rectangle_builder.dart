import 'package:flutter/material.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/flower_bed_entity.dart';

class RectangleBuilder extends StatelessWidget {
  final FlowerBedEntity rectangle;
  final FlowerBedEntity? currentRectangle;
  final VoidCallback onRectangleTap;
  final Offset offset;

  final VoidCallback onLongPress;

  const RectangleBuilder({
    required this.rectangle,
    required this.currentRectangle,
    required this.onRectangleTap,
    required this.offset,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: rectangle.position.dx + offset.dx,
      top: rectangle.position.dy + offset.dy,
      child: GestureDetector(
        onTap: onRectangleTap,
        onLongPress: onLongPress,
        child: _rectangleContainer(rectangle),
      ),
    );
  }

  Widget _rectangleContainer(FlowerBedEntity rectangle) {
    return Container(
      width: rectangle.width * 50,
      height: rectangle.height * 50,
      decoration: BoxDecoration(
        color: currentRectangle == rectangle ? Colors.blue : Colors.transparent,
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Center(child: Text('${rectangle.width}x${rectangle.height}')),
    );
  }
}

import 'package:flutter/material.dart';

class FloatingActionButtons extends StatelessWidget {
  final VoidCallback onAddDimensions;
  final VoidCallback onSave;
  final VoidCallback onRotate;

  const FloatingActionButtons({
    required this.onAddDimensions,
    required this.onSave,
    required this.onRotate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: onAddDimensions,
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          onPressed: onSave,
          child: const Icon(Icons.check),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          onPressed: onRotate,
          child: const Icon(Icons.rotate_right),
        ),
      ],
    );
  }
}

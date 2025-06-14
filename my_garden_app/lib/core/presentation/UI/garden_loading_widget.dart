import 'package:flutter/material.dart';

class GardenLoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  const GardenLoadingWidget([this.width = 100, this.height = 100]);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: Colors.green));
  }
}

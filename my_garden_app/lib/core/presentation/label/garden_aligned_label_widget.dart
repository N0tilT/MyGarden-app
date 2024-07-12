// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:my_garden_app/core/presentation/label/garden_label_widget.dart';
import 'package:my_garden_app/resources/colors.dart';
class GardenAlignedLabelWidget extends GardenLabelWidget {
  @override
  final String text;

  @override
  final double fontSize;

  @override
  final TextAlign align;

  const GardenAlignedLabelWidget({
    required this.text,
    required this.fontSize,
    required this.align,
  }) : super(
          text: text,
          align: align,
          color: mainForegroundColor,
          fontSize: fontSize,
          weight: FontWeight.normal,
        );
}

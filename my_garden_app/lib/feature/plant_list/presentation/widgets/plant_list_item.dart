import 'package:flutter/material.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';

class PlantListItem extends StatelessWidget {
  const PlantListItem({super.key, required this.plant});

  final PlantEntity plant;

  @override
  Widget build(BuildContext context) {
    return Text(plant.title!);
  }
}

import 'package:flutter/material.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';

class PlantListItem extends StatelessWidget {
  const PlantListItem({super.key, required this.plant});

  final PlantEntity plant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context).push(
      //   MaterialPageRoute<void>(
      //     builder: (context) => PlantCardPage(
      //       plant: plant,
      //     ),
      //   ),
      // ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(plant.title!),
          ),
        ),
      ),
    );
  }
}

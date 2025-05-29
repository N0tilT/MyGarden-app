import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_garden_app/feature/plant_list/presentation/pages/plant_card_page.dart';
import 'package:my_garden_app/feature/plant_list/presentation/widgets/plant_detail_bottom_sheet_widget.dart';
import 'package:path_provider/path_provider.dart';

class PlantListItem extends StatelessWidget {
  const PlantListItem({super.key, required this.plant});

  final String plant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => PlantDetailSheet(
          plant: Plant(
              id: "0",
              name: "name",
              group: "group",
              family: "family",
              plantingDate: "plantingDate",
              description: "description",
              photos: []),
        ),
      ),
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
            child: Text(plant),
          ),
        ),
      ),
    );
  }
}

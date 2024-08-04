import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/flower_bed_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/cubit/plant_list_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/widgets/plant_list_item.dart';

Future<void> showFlowerBedDialog(
  BuildContext context,
  FlowerBedEntity currentRectangle,
) async {
  final TextEditingController titleController = TextEditingController();
  final plantListCubit = context.read<PlantListCubit>();

  await showDialog(
    context: context,
    builder: (context) {
      final List<PlantEntity> plantList = plantListCubit.state
          .maybeWhen(
            success: (plants) => plants,
            orElse: () => <PlantEntity>[],
          )
          .where((plant) => currentRectangle.plantIds.contains(plant.id))
          .toList();

      return AlertDialog(
        title: const Text('Редактировать грядку'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Название'),
              ),
              const SizedBox(height: 10),
              const Text('Растения в грядке:'),
              SingleChildScrollView(
                child: Column(
                  children: plantList
                      .map((plant) => PlantListItem(plant: plant))
                      .toList(),
                ),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () => showPlantSelectionDialog(
                    context,
                    plantListCubit.state.maybeWhen(
                        success: (plants) => plants,
                        orElse: () => <PlantEntity>[],),
                    currentRectangle,),
                child: const Text("+", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Additional logic to save the modified name if needed
            },
            child: const Icon(Icons.edit),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Trigger dimension dialog
            },
            child: const Text('Изменить размеры'),
          ),
        ],
      );
    },
  );
}

void showPlantSelectionDialog(BuildContext context, List<PlantEntity> plantList,
    FlowerBedEntity currentRectangle,) {
  int? selectedPlantId;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Выберите растение'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<int>(
                value: selectedPlantId,
                hint: const Text('Выберите растение'),
                items: plantList.map((plant) {
                  return DropdownMenuItem<int>(
                    value: plant.id,
                    child: PlantListItem(plant: plant),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedPlantId = value;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (selectedPlantId != null) {
                // Add logic to update currentRectangle with new plant ID
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Выберите растение для добавления.'),),
                );
              }
            },
            child: const Text('Добавить'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Закрыть'),
          ),
        ],
      );
    },
  );
}

Future<void> showDimensionDialog(
    BuildContext context, FlowerBedEntity currentRectangle,) async {
  final values = List<int>.generate(15, (index) => index + 1);

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Редактировать размеры'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<int>(
              items: values
                  .map((e) =>
                      DropdownMenuItem(value: e, child: Text(e.toString())),)
                  .toList(),
              onChanged: (value) {
                // Save new width or height
              },
            ),
            DropdownButtonFormField<int>(
              items: values
                  .map((e) =>
                      DropdownMenuItem(value: e, child: Text(e.toString())),)
                  .toList(),
              onChanged: (value) {
                // Save new width or height
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Logic to delete the flower bed
              Navigator.of(context).pop();
            },
            child: const Text('Удалить'),
          ),
          TextButton(
            onPressed: () {
              // Logic to update flower bed dimensions
              Navigator.of(context).pop();
            },
            child: const Text('Сохранить'),
          ),
        ],
      );
    },
  );
}

// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/constant_values/routes.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/flower_bed_entity.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/bloc/flower_bed/flower_bed_cubit.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/bloc/garden/garden_cubit.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/widgets/grid_painter.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';

class GardenVisualBody extends StatefulWidget {
  const GardenVisualBody();

  @override
  _GardenVisualBodyState createState() => _GardenVisualBodyState();
}

class _GardenVisualBodyState extends State<GardenVisualBody> {
  FlowerBedEntity? currentRectangle;
  Offset offset = Offset.zero;
  int selectedWidth = 1;
  int selectedHeight = 1;

  void _addOrEditRectangle(int width, int height) {
    setState(() {
      final newPosition = Offset(
        -50.0 * (offset.dx ~/ 50 - 3),
        -50.0 * (offset.dy ~/ 50 - 6),
      );

      if (currentRectangle == null) {
        currentRectangle = FlowerBedEntity(
          id: -1,
          width: width,
          height: height,
          truePosition: newPosition,
          position: newPosition,
          isMoving: true,
          rotation: 0,
          plantIds: [],
          gardenId: -1,
        );
      } else {
        currentRectangle!
          ..width = width
          ..height = height;
      }
    });
  }

  void _toggleMovement(FlowerBedEntity rectangle) {
    setState(() {
      rectangle.isMoving = !rectangle.isMoving;
      currentRectangle = rectangle.isMoving ? rectangle : null;
    });
  }

  void _moveRectangle(Offset delta) {
    if (currentRectangle == null) return;
    setState(() {
      currentRectangle!.truePosition += delta;
      currentRectangle!.position = Offset(
        (currentRectangle!.truePosition.dx ~/ 50) * 50,
        (currentRectangle!.truePosition.dy ~/ 50) * 50,
      );
    });
  }

  Future<void> _showFlowerBedDialog(BuildContext context) async {
    final titleController = TextEditingController();
    final plantListCubit = context.read<PlantListCubit>();
    final flowerBedCubit = context.read<FlowerBedCubit>();
    final List<PlantEntity> allPlantList = plantListCubit.state.maybeWhen(
      success: (plants) => plants,
      orElse: () => [],
    );

    List<PlantEntity> plantList = [];

    if (allPlantList.isNotEmpty) {
      plantList = allPlantList
          .where((pl) => currentRectangle!.plantIds.contains(pl.id))
          .toList();
    }

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Редактировать грядку'),
        content: Column(
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
                children: plantList.map((e) => Text(e.title ?? "")).toList(),
              ),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () => _showPlantSelectionDialog(
                context,
                allPlantList,
                flowerBedCubit,
              ),
              child: const Text("+", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() => currentRectangle!.isMoving = true);
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.edit),
          ),
          TextButton(
            onPressed: () => _showDimensionDialog(context),
            child: const Text('Изменить размеры'),
          ),
        ],
      ),
    );
  }

  void _showPlantSelectionDialog(
    BuildContext context,
    List<PlantEntity> plantList,
    FlowerBedCubit flowerBedCubit,
  ) {
    int? selectedPlantId;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Выберите растение'),
          content: SingleChildScrollView(
            child: DropdownButton<int>(
              value: selectedPlantId,
              hint: const Text('Выберите растение'),
              items: plantList
                  .map(
                    (plant) => DropdownMenuItem(
                      value: plant.id,
                      child: Text(plant.title ?? ""),
                    ),
                  )
                  .toList(),
              onChanged: (value) => selectedPlantId = value,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (selectedPlantId != null) {
                  final List<int> tmp = List.from(currentRectangle!.plantIds);
                  tmp.add(selectedPlantId!);
                  currentRectangle!.plantIds = tmp;
                  flowerBedCubit.update(currentRectangle!);
                  setState(() {});
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Выберите растение для добавления.'),
                    ),
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

  Future<void> _showDimensionDialog(BuildContext context) async {
    final values = List.generate(15, (index) => index + 1);
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          currentRectangle == null
              ? 'Введите размеры'
              : 'Редактировать размеры',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<int>(
              value: currentRectangle?.width ?? values.first,
              items: values
                  .map(
                    (e) =>
                        DropdownMenuItem(value: e, child: Text(e.toString())),
                  )
                  .toList(),
              onChanged: (value) => selectedWidth = value ?? 1,
            ),
            DropdownButtonFormField<int>(
              value: currentRectangle?.height ?? values.first,
              items: values
                  .map(
                    (e) =>
                        DropdownMenuItem(value: e, child: Text(e.toString())),
                  )
                  .toList(),
              onChanged: (value) => selectedHeight = value ?? 1,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (currentRectangle != null) {
                context.read<FlowerBedCubit>().remove(currentRectangle!);
                currentRectangle = null;
              }
              Navigator.of(context).pop();
            },
            child: const Text('Удалить'),
          ),
          TextButton(
            onPressed: () {
              if (selectedWidth > 0 &&
                  selectedHeight > 0 &&
                  selectedWidth < 16 &&
                  selectedHeight < 16) {
                _addOrEditRectangle(selectedWidth, selectedHeight);
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Ошибка: размеры от 1 до 15.'),
                  ),
                );
              }
            },
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final flowerBedCubit = context.watch<FlowerBedCubit>();
    return flowerBedCubit.state.when(
      initial: () => const GardenLoadingWidget(),
      loading: () => const GardenLoadingWidget(),
      success: (rectangles) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 241, 245),
        appBar: const _GardenVisualAppBarWidget(),
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
              GardenVisualGrid(offset: offset),
              ...rectangles.map((rectangle) => _buildRectangle(rectangle)),
              if (currentRectangle != null && currentRectangle!.isMoving)
                _buildResizingRectangle(currentRectangle!),
            ],
          ),
        ),
        floatingActionButton: _buildFloatingActionButtons(context),
      ),
      fail: (message) => Center(child: Text(message)),
    );
  }

  Widget _buildRectangle(FlowerBedEntity rectangle) {
    return Positioned(
      left: rectangle.position.dx + offset.dx,
      top: rectangle.position.dy + offset.dy,
      child: Transform.rotate(
        angle: rectangle.rotation * (pi / 180),
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
            currentRectangle = rectangle;
            _showFlowerBedDialog(context);
          },
          onLongPress: () => _toggleMovement(rectangle),
          child: _rectangleContainer(rectangle, Colors.blue),
        ),
      ),
    );
  }

  Widget _buildResizingRectangle(FlowerBedEntity rectangle) {
    return Positioned(
      left: rectangle.position.dx + offset.dx,
      top: rectangle.position.dy + offset.dy,
      child: Transform.rotate(
        angle: rectangle.rotation * (pi / 180),
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () => _showDimensionDialog(context),
          child: _rectangleContainer(rectangle, Colors.red.withOpacity(0.5)),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => _showDimensionDialog(context),
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          onPressed: () => _saveRectangle(context),
          child: const Icon(Icons.check),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          onPressed: () {
            if (currentRectangle != null) {
              setState(() {
                currentRectangle!.rotation =
                    (currentRectangle!.rotation + 90) % 360;
              });
            }
          },
          child: const Icon(Icons.rotate_right),
        ),
      ],
    );
  }

  void _saveRectangle(BuildContext context) {
    if (currentRectangle == null) return;
    final flowerBedCubit = context.read<FlowerBedCubit>();
    final rectBounds = _getRotatedBounds(currentRectangle!);

    if (flowerBedCubit.state.maybeWhen(
      success: (rectangles) => rectangles.any(
        (rectangle) =>
            rectangle != currentRectangle &&
            rectBounds.overlaps(_getRotatedBounds(rectangle)),
      ),
      orElse: () => false,
    )) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ошибка: Прямоугольник перекрывает существующий.'),
        ),
      );
      return;
    }

    flowerBedCubit.upload(currentRectangle!);
    setState(() => currentRectangle = null);
  }

  Rect _getRotatedBounds(FlowerBedEntity rectangle) {
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

  Offset _rotatePoint(Offset point, Offset center, double angle) {
    final radians = angle * (pi / 180);
    final x = point.dx - center.dx;
    final y = point.dy - center.dy;
    return Offset(
      x * cos(radians) - y * sin(radians) + center.dx,
      x * sin(radians) + y * cos(radians) + center.dy,
    );
  }

  Widget _rectangleContainer(FlowerBedEntity rectangle, Color color) {
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
}

class _GardenVisualAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const _GardenVisualAppBarWidget();

  @override
  Widget build(BuildContext context) {
    final gardenCubit = context.watch<GardenCubit>();
    gardenCubit.getSelected();
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: GestureDetector(
        onTap: () => Navigator.of(context).pushReplacementNamed(gardenSelector),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              gardenCubit.selectedGarden == null
                  ? "Выберите сад"
                  : gardenCubit.selectedGarden!.title,
            ),
            const Icon(Icons.search, color: Colors.white, size: 27),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

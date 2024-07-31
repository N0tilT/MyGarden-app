import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/flower_bed_entity.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/bloc/cubit/flower_bed_cubit.dart';
import 'package:my_garden_app/injection_container.dart';

class GardenVisualPage extends StatefulWidget {
  const GardenVisualPage({super.key});

  @override
  _GardenVisualPageState createState() => _GardenVisualPageState();
}

class _GardenVisualPageState extends State<GardenVisualPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FlowerBedCubit>(
      create: (context) => sl<FlowerBedCubit>()..load(),
      child: const _GardenVisualPageWidget(),
    );
  }
}

class _GardenVisualPageWidget extends StatefulWidget {
  const _GardenVisualPageWidget();

  @override
  _GardenVisualPageWidgetState createState() => _GardenVisualPageWidgetState();
}

class _GardenVisualPageWidgetState extends State<_GardenVisualPageWidget> {
  FlowerBedEntity? currentRectangle;
  Offset offset = Offset.zero;

  int selectedWidth = 1;
  int selectedHeight = 1;

  void _addRectangle(int width, int height) {
    final newPosition = Offset(
      -50.0 * (offset.dx ~/ 50 - 3),
      -50.0 * (offset.dy ~/ 50 - 6),
    );

    setState(() {
      currentRectangle = FlowerBedEntity(
        id: -1,
        width: width,
        height: height,
        truePosition: newPosition,
        position: newPosition,
        isMoving: true,
        rotation: 0,
        plantIds: [],
      );
    });
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
      final deltaX = currentRectangle!.truePosition.dx.round() -
          currentRectangle!.position.dx;
      final deltaY = currentRectangle!.truePosition.dy.round() -
          currentRectangle!.position.dy;

      if (deltaX.abs() >= 50) {
        currentRectangle!.position += Offset(deltaX >= 0 ? 50 : -50, 0);
      }
      if (deltaY.abs() >= 50) {
        currentRectangle!.position += Offset(0, deltaY >= 0 ? 50 : -50);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final flowerBedCubit = context.watch<FlowerBedCubit>();
    return flowerBedCubit.state.when(
      initial: () => GardenLoadingWidget(),
      loading: () => GardenLoadingWidget(),
      success: (rectangles) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 241, 245),
        appBar: const GardenVisualAppBarWidget(),
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
              _buildGrid(),
              ...rectangles.map((rectangle) => Positioned(
                    left: rectangle.position.dx + offset.dx,
                    top: rectangle.position.dy + offset.dy,
                    child: Transform.rotate(
                      angle: rectangle.rotation * (pi / 180),
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {},
                        onLongPress: () {
                          _toggleMovement(rectangle);
                          final List<int> values = List.generate(
                            15,
                            (index) => index + 1,
                          );
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  currentRectangle == null
                                      ? 'Введите размеры прямоугольника'
                                      : 'Редактировать размеры',
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    DropdownButtonFormField<int>(
                                      value: currentRectangle != null
                                          ? currentRectangle!.width
                                          : values.first,
                                      items: values
                                          .map(
                                            (e) => DropdownMenuItem<int>(
                                              value: e,
                                              child: Text(e.toString()),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) =>
                                          selectedWidth = value ?? 1,
                                    ),
                                    DropdownButtonFormField<int>(
                                      value: currentRectangle != null
                                          ? currentRectangle!.height
                                          : values.first,
                                      items: values
                                          .map(
                                            (e) => DropdownMenuItem<int>(
                                              value: e,
                                              child: Text(e.toString()),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (value) =>
                                          selectedHeight = value ?? 1,
                                    ),
                                  ],
                                ),
                                actions: [
                                  if (currentRectangle != null)
                                    TextButton(
                                      onPressed: () {
                                        flowerBedCubit
                                            .remove(currentRectangle!);
                                        currentRectangle = null;
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
                                        setState(() {
                                          if (currentRectangle == null) {
                                            _addRectangle(
                                                selectedWidth, selectedHeight);
                                          } else {
                                            currentRectangle!.width =
                                                selectedWidth;
                                            currentRectangle!.height =
                                                selectedHeight;
                                          }
                                        });
                                        Navigator.of(context).pop();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            duration: Durations.long1,
                                            content: Text(
                                              'Ошибка: Размеры прямоугольника должны быть натуральным числом от 1 до 15.',
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text('Сохранить'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: _rectangleContainer(rectangle, Colors.blue),
                      ),
                    ),
                  )),
              if (currentRectangle != null)
                Positioned(
                  left: currentRectangle!.position.dx + offset.dx,
                  top: currentRectangle!.position.dy + offset.dy,
                  child: Transform.rotate(
                    angle: currentRectangle!.rotation * (pi / 180),
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        final List<int> values = List.generate(
                          15,
                          (index) => index + 1,
                        );
                        showDialog(
                          context: context,
                          builder: (context) {
                            final flowerBedCubit =
                                context.watch<FlowerBedCubit>();
                            return AlertDialog(
                              title: Text(
                                currentRectangle == null
                                    ? 'Введите размеры прямоугольника'
                                    : 'Редактировать размеры',
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DropdownButtonFormField<int>(
                                    value: currentRectangle != null
                                        ? currentRectangle!.width
                                        : values.first,
                                    items: values
                                        .map(
                                          (e) => DropdownMenuItem<int>(
                                            value: e,
                                            child: Text(e.toString()),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) =>
                                        selectedWidth = value ?? 1,
                                  ),
                                  DropdownButtonFormField<int>(
                                    value: currentRectangle != null
                                        ? currentRectangle!.height
                                        : values.first,
                                    items: values
                                        .map(
                                          (e) => DropdownMenuItem<int>(
                                            value: e,
                                            child: Text(e.toString()),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) =>
                                        selectedHeight = value ?? 1,
                                  ),
                                ],
                              ),
                              actions: [
                                if (currentRectangle != null)
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        flowerBedCubit
                                            .remove(currentRectangle!);
                                        currentRectangle = null;
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: const Text('Удалить'),
                                  ),
                                TextButton(
                                  onPressed: () {
                                    if (selectedWidth > 0 &&
                                        selectedHeight > 0 &&
                                        selectedWidth < 16 &&
                                        selectedHeight < 16) {
                                      setState(() {
                                        if (currentRectangle == null) {
                                          _addRectangle(
                                              selectedWidth, selectedHeight);
                                        } else {
                                          currentRectangle!.width =
                                              selectedWidth;
                                          currentRectangle!.height =
                                              selectedHeight;
                                        }
                                      });
                                      Navigator.of(context).pop();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          duration: Durations.long1,
                                          content: Text(
                                            'Ошибка: Размеры прямоугольника должны быть натуральным числом от 1 до 15.',
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text('Сохранить'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: _rectangleContainer(
                        currentRectangle!,
                        Colors.red.withOpacity(0.5),
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
              onPressed: () {
                final List<int> values = List.generate(
                  15,
                  (index) => index + 1,
                );
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        currentRectangle == null
                            ? 'Введите размеры прямоугольника'
                            : 'Редактировать размеры',
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DropdownButtonFormField<int>(
                            value: currentRectangle != null
                                ? currentRectangle!.width
                                : values.first,
                            items: values
                                .map(
                                  (e) => DropdownMenuItem<int>(
                                    value: e,
                                    child: Text(e.toString()),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => selectedWidth = value ?? 1,
                          ),
                          DropdownButtonFormField<int>(
                            value: currentRectangle != null
                                ? currentRectangle!.height
                                : values.first,
                            items: values
                                .map(
                                  (e) => DropdownMenuItem<int>(
                                    value: e,
                                    child: Text(e.toString()),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => selectedHeight = value ?? 1,
                          ),
                        ],
                      ),
                      actions: [
                        if (currentRectangle != null)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                flowerBedCubit.remove(currentRectangle!);
                                currentRectangle = null;
                                Navigator.of(context).pop();
                              });
                            },
                            child: const Text('Удалить'),
                          ),
                        TextButton(
                          onPressed: () {
                            if (selectedWidth > 0 &&
                                selectedHeight > 0 &&
                                selectedWidth < 16 &&
                                selectedHeight < 16) {
                              setState(() {
                                if (currentRectangle == null) {
                                  _addRectangle(selectedWidth, selectedHeight);
                                } else {
                                  currentRectangle!.width = selectedWidth;
                                  currentRectangle!.height = selectedHeight;
                                }
                              });
                              Navigator.of(context).pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Durations.long1,
                                  content: Text(
                                    'Ошибка: Размеры прямоугольника должны быть натуральным числом от 1 до 15.',
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text('Сохранить'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: () {
                if (currentRectangle == null) return;

                final rectBounds = _getRotatedBounds(currentRectangle!);

                if (rectangles.any(
                  (rectangle) {
                    if (rectangle == currentRectangle!) return false;
                    return rectBounds.overlaps(
                      _getRotatedBounds(rectangle),
                    );
                  },
                )) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Durations.long1,
                      content: Text(
                          'Ошибка: Прямоугольник перекрывает существующий.'),
                    ),
                  );
                  return;
                }

                setState(() {
                  if (!rectangles.any(
                    (element) => element == currentRectangle!,
                  )) {
                    flowerBedCubit.upload(currentRectangle!);
                  }
                });
                currentRectangle = null;
              },
              child: const Icon(Icons.check),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              onPressed: () {
                currentRectangle?.rotation =
                    (currentRectangle!.rotation + 90) % 360;
                setState(() {});
              },
              child: const Icon(Icons.rotate_right),
            ),
          ],
        ),
      ),
      fail: (message) => Text(message),
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

  Widget _buildGrid() {
    return CustomPaint(
      size: Size.infinite,
      painter: _GridPainter(offset: offset),
    );
  }
}

class _GridPainter extends CustomPainter {
  final Offset offset;

  _GridPainter({required this.offset});

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

class GardenVisualAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const GardenVisualAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        'Мои грядки',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

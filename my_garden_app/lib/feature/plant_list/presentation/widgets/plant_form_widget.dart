import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/button_widget.dart';
import 'package:my_garden_app/core/presentation/garden_input_text_field_style.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/cubit/plant_list_cubit.dart';

class PlantFormWidget extends StatefulWidget {
  const PlantFormWidget({required this.plant, required this.state});

  final PlantEntity plant;
  final PlantFormState state;

  @override
  _PlantFormWidgetState createState() => _PlantFormWidgetState();
}

enum PlantFormState {
  add,
  edit,
}

class _Controller {
  final String name;
  final String label;
  final TextInputType type;
  final TextEditingController controller;

  _Controller({
    required this.type,
    required this.name,
    required this.label,
    required this.controller,
  });

  void dispose() {
    controller.dispose();
  }
}

class _PlantFormWidgetState extends State<PlantFormWidget> {
  late List<_Controller> controllers;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (final element in controllers) {
      element.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controllers = [
    _Controller(
      controller: TextEditingController(text: widget.plant.title),
      name: "title",
      label: "Название",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(text: widget.plant.biologyTitle),
      name: "bioTitle",
      label: "Биологическое название",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(text: widget.plant.fertilization),
      name: "fertilizationTitle",
      label: "Удобрение",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(text: widget.plant.toxicity),
      name: "toxicity",
      label: "Токсичность",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(text: widget.plant.replacing),
      name: "replacing",
      label: "Пересадка",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(text: widget.plant.description),
      name: "description",
      label: "Описание",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(text: widget.plant.ripeningPeriod.toString()),
      name: "ripening",
      label: "Время всхода",
      type: TextInputType.number,
    ),
  ];
    return Form(
      key: formKey,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: SingleChildScrollView(
              child: Column(
                children: controllers
                    .map(
                      (e) => _FormFieldWidget(controller: e),
                    )
                    .toList(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GardenButton(
                title: widget.state == PlantFormState.add
                    ? "Добавить"
                    : "Изменить",
                event: () {
                  final form = formKey.currentState!;
                  if (form.validate()) {
                    final inputs = controllers
                        .map(
                          (e) => e.controller.text,
                        )
                        .toList();
                    final plantEntity = PlantEntity(
                      id: 0,
                      title: inputs[0],
                      biologyTitle: inputs[1],
                      fertilization: inputs[2],
                      toxicity: inputs[3],
                      replacing: inputs[4],
                      description: inputs[5],
                      groupId: 0,
                      wateringNeedId: 0,
                      lightNeedId: 0,
                      stageId: 0,
                      imageId: 0,
                      ripeningPeriod: int.parse(inputs[6]),
                    );

                    final plantListCubit = context.read<PlantListCubit>();
                    widget.state == PlantFormState.add
                        ? plantListCubit.upload(
                            plantEntity,
                          )
                        : plantListCubit.update(
                            plantEntity,
                          );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormFieldWidget extends StatelessWidget {
  final _Controller controller;
  const _FormFieldWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GardenDefaultLabelWidget(
          text: controller.label,
          fontSize: 20,
        ),
        const SizedBox(
          height: 23,
        ),
        TextFormField(
          controller: controller.controller,
          decoration: gardenInputStyle,
          keyboardType: controller.type,
        ),
        const SizedBox(
          height: 23,
        ),
      ],
    );
  }
}

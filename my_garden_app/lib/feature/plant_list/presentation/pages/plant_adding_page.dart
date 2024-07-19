import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/button_widget.dart';
import 'package:my_garden_app/core/presentation/garden_input_text_field_style.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/cubit/plant_list_cubit.dart';
import 'package:my_garden_app/injection_container.dart';

class PlantAddingPage extends StatefulWidget {
  const PlantAddingPage({super.key});

  @override
  _PlantAddingPageState createState() => _PlantAddingPageState();
}

class _PlantAddingPageState extends State<PlantAddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 241, 245),
      appBar: const PlantAddingAppBarWidget(),
      body: BlocProvider<PlantListCubit>(
        create: (context) => sl<PlantListCubit>(),
        child: const _PlantAddingWidget(),
      ),
    );
  }
}

class _PlantAddingWidget extends StatefulWidget {
  const _PlantAddingWidget();

  @override
  _PlantAddingWidgetState createState() => _PlantAddingWidgetState();
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

class _PlantAddingWidgetState extends State<_PlantAddingWidget> {
  List<_Controller> controllers = [
    _Controller(
      controller: TextEditingController(),
      name: "title",
      label: "Название",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(),
      name: "bioTitle",
      label: "Биологическое название",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(),
      name: "fertilizationTitle",
      label: "Удобрение",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(),
      name: "toxicity",
      label: "Токсичность",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(),
      name: "replacing",
      label: "Пересадка",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(),
      name: "description",
      label: "Описание",
      type: TextInputType.text,
    ),
    _Controller(
      controller: TextEditingController(),
      name: "ripening",
      label: "Время всхода",
      type: TextInputType.number,
    ),
  ];
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
                title: "Добавить",
                event: () {
                  final form = formKey.currentState!;
                  if (form.validate()) {
                    final inputs = controllers
                        .map(
                          (e) => e.controller.text,
                        )
                        .toList();

                    final plantListCubit = context.read<PlantListCubit>();
                    plantListCubit.upload(
                      PlantEntity(
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
                      ),
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

class PlantAddingAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PlantAddingAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        'Новое растение',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

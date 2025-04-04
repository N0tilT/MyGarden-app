import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/button_widget.dart';
import 'package:my_garden_app/core/presentation/garden_input_text_field_style.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';
import 'package:my_garden_app/feature/event_journal/presentation/bloc/cubit/event_cubit.dart';
import 'package:my_garden_app/injection_container.dart';

class EventAddingPage extends StatefulWidget {
  const EventAddingPage({super.key});

  @override
  _EventAddingPageState createState() => _EventAddingPageState();
}

class _EventAddingPageState extends State<EventAddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 241, 245),
      appBar: const EventAddingAppBarWidget(),
      body: BlocProvider<EventCubit>(
        create: (context) => sl<EventCubit>(),
        child: const _EventAddingWidget(),
      ),
    );
  }
}

class _EventAddingWidget extends StatefulWidget {
  const _EventAddingWidget();

  @override
  _EventAddingWidgetState createState() => _EventAddingWidgetState();
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

class _EventAddingWidgetState extends State<_EventAddingWidget> {
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

                    final eventListCubit = context.read<EventCubit>();
                    eventListCubit.upload(
                      EventEntity(
                        id: 0,
                        title: inputs[0],
                        date: DateTime.now(),
                        plantId: 0,
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

class EventAddingAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const EventAddingAppBarWidget({
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

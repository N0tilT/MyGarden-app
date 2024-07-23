import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/feature/plant_card/presentation/bloc/cubit/plant_card_cubit.dart';
import 'package:my_garden_app/injection_container.dart';

class PlantCardPage extends StatefulWidget {
  const PlantCardPage({super.key, required this.plantId});
  final int plantId;

  @override
  _PlantCardPageState createState() => _PlantCardPageState();
}

class _PlantCardPageState extends State<PlantCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 241, 245),
      appBar: const PlantCardAppBarWidget(),
      body: BlocProvider<PlantCardCubit>(
        create: (context) => sl<PlantCardCubit>()..loadLocally(widget.plantId),
        child: const _PlantCardWidget(),
      ),
    );
  }
}

class _PlantCardWidget extends StatefulWidget {
  const _PlantCardWidget({super.key});

  @override
  _PlantCardWidgetState createState() => _PlantCardWidgetState();
}

class _PlantCardWidgetState extends State<_PlantCardWidget> {
  @override
  Widget build(BuildContext context) {
    final plantCubit = context.watch<PlantCardCubit>();
    return plantCubit.state.when(
      initial: () => const GardenLoadingWidget(),
      loading: () => const GardenLoadingWidget(),
      success: (departments) => Column(
        children: [
          Text(departments.plant.title!),
          Column(
            children: departments.event
                .map(
                  (e) => Text(e.title!),
                )
                .toList(),
          ),
        ],
      ),
      fail: (message) => Text(message),
    );
  }
}

class PlantCardAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PlantCardAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        'Моё растение',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

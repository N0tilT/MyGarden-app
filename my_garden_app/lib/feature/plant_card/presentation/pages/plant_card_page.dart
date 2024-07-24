import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/feature/plant_card/presentation/bloc/cubit/plant_card_cubit.dart';
import 'package:my_garden_app/feature/plant_card/presentation/pages/edit_plant_card.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/injection_container.dart';

class PlantCardPage extends StatefulWidget {
  const PlantCardPage({super.key, required this.plant});
  final PlantEntity plant;

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
        create: (context) => sl<PlantCardCubit>()..load(widget.plant),
        child: const _PlantCardWidget(),
      ),
    );
  }
}

class _PlantCardWidget extends StatefulWidget {
  const _PlantCardWidget();

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
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) =>
                          PlantEditingPage(plant: departments.plant),
                    ),
                  );
                },
                child: const Text(
                  "+",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
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

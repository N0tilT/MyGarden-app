import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/cubit/plant_list_cubit.dart';

class PlantListPage extends StatefulWidget {
  const PlantListPage({super.key});

  @override
  _PlantListPageState createState() => _PlantListPageState();
}

class _PlantListPageState extends State<PlantListPage> {
  @override
  Widget build(BuildContext context) {
    final plantListCubit = context.watch<PlantListCubit>();

    return plantListCubit.state.when(
      initial: () => const Center(
        child: GardenLoadingWidget(),
      ),
      loading: () => const Center(
        child: GardenLoadingWidget(),
      ),
      success: (plantList) {
        if (plantList.isEmpty) {
          plantListCubit.load();
        }
        return const Text("Успех");
      },
      fail: (message) => Center(
        child: GardenDefaultLabelWidget(text: message, fontSize: 18),
      ),
      localLoadingFail: (message) {
        plantListCubit.load();
        return Center(
          child: GardenDefaultLabelWidget(text: message, fontSize: 18),
        );
      },
      localLoadingSuccess: (plantList) {
        if (plantList.isEmpty) {
          plantListCubit.load();
        }
        return const Text("Успех");
      },
    );
  }
}

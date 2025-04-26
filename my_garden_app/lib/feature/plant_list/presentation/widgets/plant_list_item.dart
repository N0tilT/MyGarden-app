import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/group/group_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/grow_stage/grow_stage_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/light_need/light_need_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_type/plant_type_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_variety/plant_variety_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/watering_need/watering_need_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/widgets/plant_card_bottom_sheet_widget.dart';
import 'package:my_garden_app/injection_container.dart';

class PlantListItem extends StatelessWidget {
  const PlantListItem({super.key, required this.plant});

  final PlantEntity plant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<GroupCubit>(
              create: (context) => sl<GroupCubit>(),
            ),
            BlocProvider<GrowStageCubit>(
              create: (context) => sl<GrowStageCubit>(),
            ),
            BlocProvider<LightNeedCubit>(
              create: (context) => sl<LightNeedCubit>(),
            ),
            BlocProvider<WateringNeedCubit>(
              create: (context) => sl<WateringNeedCubit>(),
            ),
            BlocProvider<PlantTypeCubit>(
              create: (context) => sl<PlantTypeCubit>(),
            ),
            BlocProvider<PlantVarietyCubit>(
              create: (context) => sl<PlantVarietyCubit>(),
            ),
            BlocProvider<PlantListCubit>(
              create: (context) => sl<PlantListCubit>(),
            ),
          ],
          child: Builder(
            builder: (context) => PlantCardBottomSheet(
              plant: plant,
            ),
          ),
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
            child: Text(plant.title!),
          ),
        ),
      ),
    );
  }
}

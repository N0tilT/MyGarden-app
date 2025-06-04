import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/cubit/token_cubit.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/group/group_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/grow_stage/grow_stage_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/light_need/light_need_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_prefill/plant_prefill_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_recognition/plant_recognition_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_type/plant_type_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_variety/plant_variety_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/watering_need/watering_need_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/widgets/super_widget.dart';

class PlantListItem extends StatelessWidget {
  const PlantListItem({super.key, required this.plant});

  final PlantEntity plant;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (parentContext) {
        return GestureDetector(
          onTap: () => showModalBottomSheet(
            context: parentContext,
            isScrollControlled: true,
            builder: (modal) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                    value: BlocProvider.of<GroupCubit>(parentContext)),
                BlocProvider.value(
                    value: BlocProvider.of<PlantListCubit>(parentContext)),
                BlocProvider.value(
                    value: BlocProvider.of<WateringNeedCubit>(parentContext)),
                BlocProvider.value(
                    value: BlocProvider.of<LightNeedCubit>(parentContext)),
                BlocProvider.value(
                    value: BlocProvider.of<PlantTypeCubit>(parentContext)),
                BlocProvider.value(
                    value: BlocProvider.of<PlantVarietyCubit>(parentContext)),
                BlocProvider.value(
                    value: BlocProvider.of<GrowStageCubit>(parentContext)),
                BlocProvider.value(
                    value: BlocProvider.of<PlantPrefillCubit>(parentContext)),
                BlocProvider.value(
                    value:
                        BlocProvider.of<PlantRecognitionCubit>(parentContext)),
              ],
              child: PlantDetailCardSheet(
                plant: plant,
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
                child: Text(plant.title ?? "Без названия"),
              ),
            ),
          ),
        );
      },
    );
  }
}

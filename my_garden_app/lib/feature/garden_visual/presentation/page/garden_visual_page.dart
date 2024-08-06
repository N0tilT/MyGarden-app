
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/bloc/flower_bed/flower_bed_cubit.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/widgets/garden_visual_body.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/cubit/plant_list_cubit.dart';
import 'package:my_garden_app/injection_container.dart';

class GardenVisualPage extends StatelessWidget {
  const GardenVisualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<FlowerBedCubit>()..load()),
        BlocProvider(create: (context) => sl<PlantListCubit>()..load()),
      ],
      child: const GardenVisualBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/cubit/token_cubit.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/bloc/garden/garden_cubit.dart';
import 'package:my_garden_app/feature/garden_visual/presentation/widgets/garden_visual_body.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/garden_type/garden_type_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';
import 'package:my_garden_app/injection_container.dart';

class GardenVisualPage extends StatelessWidget {
  const GardenVisualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<TokenCubit>()..getToken()),
        BlocProvider(create: (context) => sl<GardenTypeCubit>()..load()),
        BlocProvider(create: (context) => sl<PlantListCubit>()..load()),
        BlocProvider(
          create: (context) => sl<GardenCubit>()..load(),
        ),
      ],
      child: const GardenVisualBody(),
    );
  }
}

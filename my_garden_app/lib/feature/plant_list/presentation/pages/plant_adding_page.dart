import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/cubit/plant_list_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/widgets/plant_form_widget.dart';
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
        child: const PlantFormWidget(
          plant: PlantEntity(
            id: 0,
            title: "",
            biologyTitle: "",
            fertilization: "",
            toxicity: "",
            replacing: "",
            description: "",
            groupId: 0,
            wateringNeedId: 0,
            lightNeedId: 0,
            plantTypeId: 0,
            plantVarietyId: 0,
            stageId: 0,
            imageId: 0,
            ripeningPeriod: 0,
          ),
          state: PlantFormState.add,
        ),
      ),
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

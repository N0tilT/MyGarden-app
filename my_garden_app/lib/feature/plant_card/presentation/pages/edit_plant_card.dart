import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/widgets/plant_form_widget.dart';
import 'package:my_garden_app/injection_container.dart';

class PlantEditingPage extends StatefulWidget {
  const PlantEditingPage({super.key, required this.plant});

  final PlantEntity plant;

  @override
  _PlantEditingPageState createState() => _PlantEditingPageState();
}

class _PlantEditingPageState extends State<PlantEditingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 241, 245),
      appBar: const PlantEditingAppBarWidget(),
      body: BlocProvider<PlantListCubit>(
        create: (context) => sl<PlantListCubit>(),
        child: PlantFormWidget(
          plant: widget.plant,
          state: PlantFormState.edit,
        ),
      ),
    );
  }
}

class PlantEditingAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PlantEditingAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        'Редактирование',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

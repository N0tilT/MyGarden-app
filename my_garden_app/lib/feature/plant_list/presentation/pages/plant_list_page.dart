import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/cubit/plant_list_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/pages/plant_adding_page.dart';
import 'package:my_garden_app/feature/plant_list/presentation/widgets/plant_list_item.dart';
import 'package:my_garden_app/injection_container.dart';

class PlantListPage extends StatefulWidget {
  const PlantListPage({super.key});

  @override
  _PlantListPageState createState() => _PlantListPageState();
}

class _PlantListPageState extends State<PlantListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 241, 245),
      appBar: const PlantListAppBarWidget(),
      body: BlocProvider<PlantListCubit>(
        create: (context) => sl<PlantListCubit>()..load(),
        child: const _PlantListWidget(),
      ),
    );
  }
}

class _PlantListWidget extends StatefulWidget {
  const _PlantListWidget();

  @override
  _PlantListWidgetState createState() => _PlantListWidgetState();
}

class _PlantListWidgetState extends State<_PlantListWidget> {
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
        return _PlantListWrapper(plantList: plantList);
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
        return _PlantListWrapper(
          plantList: plantList,
        );
      },
    );
  }
}

class _PlantListWrapper extends StatelessWidget {
  final List<PlantEntity> plantList;

  const _PlantListWrapper({
    required this.plantList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: plantList
              .map(
                (e) => PlantListItem(plant: e),
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
                    builder: (context) => const PlantAddingPage(),
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
    );
  }
}

class PlantListAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PlantListAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text(
        'Мои растения',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

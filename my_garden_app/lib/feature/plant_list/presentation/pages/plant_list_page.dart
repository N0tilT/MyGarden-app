import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/group/group_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/grow_stage/grow_stage_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/light_need/light_need_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_type/plant_type_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_variety/plant_variety_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/watering_need/watering_need_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<GroupCubit>(
          create: (context) => sl<GroupCubit>()..loadLocally(),
        ),
        BlocProvider<GrowStageCubit>(
          create: (context) => sl<GrowStageCubit>()..loadLocally(),
        ),
        BlocProvider<LightNeedCubit>(
          create: (context) => sl<LightNeedCubit>()..loadLocally(),
        ),
        BlocProvider<WateringNeedCubit>(
          create: (context) => sl<WateringNeedCubit>()..loadLocally(),
        ),
        BlocProvider<PlantTypeCubit>(
          create: (context) => sl<PlantTypeCubit>()..loadLocally(),
        ),
        BlocProvider<PlantVarietyCubit>(
          create: (context) => sl<PlantVarietyCubit>()..loadLocally(),
        ),
        BlocProvider<PlantListCubit>(
          create: (context) => sl<PlantListCubit>()..loadLocally(),
        ),
      ],
      child: const Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 241, 245),
        appBar: PlantListAppBarWidget(),
        body: _PlantListWidget(),
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
    final growStageCubit = context.watch<GrowStageCubit>();
    final lightNeedCubit = context.watch<LightNeedCubit>();
    final wateringNeedCubit = context.watch<WateringNeedCubit>();
    final plantTypeCubit = context.watch<PlantTypeCubit>();
    final plantVarietyCubit = context.watch<PlantVarietyCubit>();
    final plantListCubit = context.watch<PlantListCubit>();
    final groupCubit = context.watch<GroupCubit>();

    if (groupCubit.state is GroupSuccess) {
      if (groupCubit.groupList.isEmpty) {
        groupCubit.load();
      }
    }

    if (growStageCubit.state is GrowStageSuccess &&
        lightNeedCubit.state is LightNeedSuccess &&
        wateringNeedCubit.state is WateringNeedSuccess &&
        plantTypeCubit.state is PlantTypeSuccess &&
        plantVarietyCubit.state is PlantVarietySuccess) {
      if (growStageCubit.growStages.isEmpty) {
        growStageCubit.load();
      }
      if (lightNeedCubit.plantList.isEmpty) {
        lightNeedCubit.load();
      }
      if (wateringNeedCubit.wateringNeeds.isEmpty) {
        wateringNeedCubit.load();
      }
      if (plantTypeCubit.plantList.isEmpty) {
        plantTypeCubit.load();
      }
      if (plantVarietyCubit.plantList.isEmpty) {
        plantVarietyCubit.load();
      }
    }
    return groupCubit.state.maybeWhen(
      success: (groups) {
        if (groups.isEmpty) {
          groupCubit.upload(const GroupEntity(id: null, title: "Без группы"));
        }
        return plantListCubit.state.when(
          initial: () => const Center(
            child: GardenLoadingWidget(),
          ),
          loading: () => const Center(
            child: GardenLoadingWidget(),
          ),
          fail: (message) => Center(
            child: GardenDefaultLabelWidget(text: message, fontSize: 18),
          ),
          localLoadingFail: (message) {
            plantListCubit.load();
            return Center(
              child: GardenDefaultLabelWidget(text: message, fontSize: 18),
            );
          },
          success: (plantList) {
            if (plantList.isEmpty) {
              plantListCubit.load();
            }
            if (growStageCubit.state is GrowStageSuccess &&
                lightNeedCubit.state is LightNeedSuccess &&
                wateringNeedCubit.state is WateringNeedSuccess &&
                plantTypeCubit.state is PlantTypeSuccess &&
                plantVarietyCubit.state is PlantVarietySuccess) {
              if (growStageCubit.growStages.isEmpty) {
                growStageCubit.load();
              }
              if (lightNeedCubit.plantList.isEmpty) {
                lightNeedCubit.load();
              }
              if (wateringNeedCubit.wateringNeeds.isEmpty) {
                wateringNeedCubit.load();
              }
              if (plantTypeCubit.plantList.isEmpty) {
                plantTypeCubit.load();
              }
              if (plantVarietyCubit.plantList.isEmpty) {
                plantVarietyCubit.load();
              }

              return growStageCubit.state.maybeWhen(
                success: (growStages) => lightNeedCubit.state.maybeWhen(
                  success: (lightNeeds) => wateringNeedCubit.state.maybeWhen(
                    success: (wateringNeeds) => plantTypeCubit.state.maybeWhen(
                      success: (plantTypes) =>
                          plantVarietyCubit.state.maybeWhen(
                        success: (plantVarieties) => _PlantListWrapper(
                          plantList: plantList.map((x) {
                            return x.copyWith(
                              stageTitle: growStages
                                      .firstWhere((y) => y.id == x.stageId)
                                      .title ??
                                  "",
                              lightNeedTitle: lightNeeds
                                      .firstWhere(
                                        (y) => y.id == x.lightNeedId,
                                      )
                                      .title ??
                                  "",
                              wateringNeedTitle: wateringNeeds
                                      .firstWhere(
                                        (y) => y.id == x.wateringNeedId,
                                      )
                                      .title ??
                                  "",
                              plantTypeTitle: plantTypes
                                      .firstWhere(
                                        (y) => y.id == x.plantTypeId,
                                      )
                                      .title ??
                                  "",
                              plantVarietyTitle: plantVarieties
                                      .firstWhere(
                                        (y) => y.id == x.plantVarietyId,
                                      )
                                      .title ??
                                  "",
                            );
                          }).toList(),
                        ),
                        orElse: () => const Center(
                          child: GardenLoadingWidget(),
                        ),
                      ),
                      orElse: () => const Center(
                        child: GardenLoadingWidget(),
                      ),
                    ),
                    orElse: () => const Center(
                      child: GardenLoadingWidget(),
                    ),
                  ),
                  orElse: () => const Center(
                    child: GardenLoadingWidget(),
                  ),
                ),
                orElse: () => const Center(
                  child: GardenLoadingWidget(),
                ),
              );
            } else {
              return const Center(
                child: GardenLoadingWidget(),
              );
            }
          },
          localLoadingSuccess: (plantList) {
            if (plantList.isEmpty) {
              plantListCubit.load();
            }
            if (growStageCubit.state is GrowStageSuccess &&
                lightNeedCubit.state is LightNeedSuccess &&
                wateringNeedCubit.state is WateringNeedSuccess &&
                plantTypeCubit.state is PlantTypeSuccess &&
                plantVarietyCubit.state is PlantVarietySuccess) {
              return growStageCubit.state.maybeWhen(
                success: (growStages) => lightNeedCubit.state.maybeWhen(
                  success: (lightNeeds) => wateringNeedCubit.state.maybeWhen(
                    success: (wateringNeeds) => plantTypeCubit.state.maybeWhen(
                      success: (plantTypes) =>
                          plantVarietyCubit.state.maybeWhen(
                        success: (plantVarieties) => _PlantListWrapper(
                          plantList: plantList.map((x) {
                            return x.copyWith(
                              stageTitle: growStages
                                      .firstWhere((y) => y.id == x.stageId)
                                      .title ??
                                  "",
                              lightNeedTitle: lightNeeds
                                      .firstWhere(
                                        (y) => y.id == x.lightNeedId,
                                      )
                                      .title ??
                                  "",
                              wateringNeedTitle: wateringNeeds
                                      .firstWhere(
                                        (y) => y.id == x.wateringNeedId,
                                      )
                                      .title ??
                                  "",
                              plantTypeTitle: plantTypes
                                      .firstWhere(
                                        (y) => y.id == x.plantTypeId,
                                      )
                                      .title ??
                                  "",
                              plantVarietyTitle: plantVarieties
                                      .firstWhere(
                                        (y) => y.id == x.plantVarietyId,
                                      )
                                      .title ??
                                  "",
                            );
                          }).toList(),
                        ),
                        orElse: () => const Center(
                          child: GardenLoadingWidget(),
                        ),
                      ),
                      orElse: () => const Center(
                        child: GardenLoadingWidget(),
                      ),
                    ),
                    orElse: () => const Center(
                      child: GardenLoadingWidget(),
                    ),
                  ),
                  orElse: () => const Center(
                    child: GardenLoadingWidget(),
                  ),
                ),
                orElse: () => const Center(
                  child: GardenLoadingWidget(),
                ),
              );
            } else {
              return const Center(
                child: GardenLoadingWidget(),
              );
            }
          },
        );
      },
      orElse: () => const Center(
        child: GardenLoadingWidget(),
      ),
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

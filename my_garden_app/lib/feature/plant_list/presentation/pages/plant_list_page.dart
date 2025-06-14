import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/core/constant_values/routes.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/core/presentation/label/garden_default_label_widget.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/cubit/token_cubit.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';
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
import 'package:my_garden_app/feature/plant_list/presentation/widgets/group_list_widget.dart';
import 'package:my_garden_app/feature/plant_list/presentation/widgets/super_widget.dart';
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
        BlocProvider<TokenCubit>(
          create: (context) => sl<TokenCubit>()..getToken(),
        ),
        BlocProvider<GroupCubit>(
          create: (context) => sl<GroupCubit>()..load(),
        ),
        BlocProvider<GrowStageCubit>(
          create: (context) => sl<GrowStageCubit>()..load(),
        ),
        BlocProvider<LightNeedCubit>(
          create: (context) => sl<LightNeedCubit>()..load(),
        ),
        BlocProvider<WateringNeedCubit>(
          create: (context) => sl<WateringNeedCubit>()..load(),
        ),
        BlocProvider<PlantTypeCubit>(
          create: (context) => sl<PlantTypeCubit>()..load(),
        ),
        BlocProvider<PlantVarietyCubit>(
          create: (context) => sl<PlantVarietyCubit>()..load(),
        ),
        BlocProvider<PlantListCubit>(
          create: (context) => sl<PlantListCubit>()..load(),
        ),
        BlocProvider<PlantRecognitionCubit>(
          create: (context) => sl<PlantRecognitionCubit>(),
        ),
        BlocProvider<PlantPrefillCubit>(
          create: (context) => sl<PlantPrefillCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 241, 245),
        appBar: const PlantListAppBarWidget(),
        body: const _PlantListWidget(),
        floatingActionButton: Builder(
          builder: (parentContext) {
            return FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: parentContext,
                  isScrollControlled: true,
                  builder: (modal) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: BlocProvider.of<GroupCubit>(parentContext),
                      ),
                      BlocProvider.value(
                        value: BlocProvider.of<WateringNeedCubit>(
                          parentContext,
                        ),
                      ),
                      BlocProvider.value(
                        value: BlocProvider.of<LightNeedCubit>(parentContext),
                      ),
                      BlocProvider.value(
                        value: BlocProvider.of<PlantListCubit>(parentContext),
                      ),
                      BlocProvider.value(
                        value: BlocProvider.of<PlantTypeCubit>(parentContext),
                      ),
                      BlocProvider.value(
                        value: BlocProvider.of<PlantVarietyCubit>(
                          parentContext,
                        ),
                      ),
                      BlocProvider.value(
                        value: BlocProvider.of<GrowStageCubit>(parentContext),
                      ),
                      BlocProvider.value(
                        value: BlocProvider.of<PlantPrefillCubit>(
                          parentContext,
                        ),
                      ),
                      BlocProvider.value(
                        value: BlocProvider.of<PlantRecognitionCubit>(
                          parentContext,
                        ),
                      ),
                    ],
                    child: const PlantDetailCardSheet(
                      plant: PlantEntity(
                        id: null,
                        title: "",
                        biologyTitle: "",
                        fertilization: "",
                        toxicity: "",
                        replacing: "",
                        description: "",
                        groupId: 1,
                        wateringNeedId: 1,
                        lightNeedId: 1,
                        plantTypeId: 1,
                        plantVarietyId: 1,
                        stageId: 1,
                        photos: [],
                        imageId: 0,
                        ripeningPeriod: 0,
                      ),
                    ),
                  ),
                );
              },
              child: const Text(
                "+",
                style: TextStyle(fontSize: 20),
              ),
            );
          },
        ),
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
    void addGroup() {
      String groupName = '';

      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Новая группа'),
            content: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Название группы',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => groupName = value,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('Отмена'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (groupName.isNotEmpty) {
                    final groupCubit = BlocProvider.of<GroupCubit>(context);
                    groupCubit.upload(GroupEntity(id: null, title: groupName));
                    Navigator.pop(dialogContext);
                  }
                },
                child: const Text('Добавить'),
              ),
            ],
          );
        },
      );
    }

    final tokenCubit = context.watch<TokenCubit>();
    final growStageCubit = context.watch<GrowStageCubit>();
    final lightNeedCubit = context.watch<LightNeedCubit>();
    final wateringNeedCubit = context.watch<WateringNeedCubit>();
    final plantTypeCubit = context.watch<PlantTypeCubit>();
    final plantVarietyCubit = context.watch<PlantVarietyCubit>();
    final plantListCubit = context.watch<PlantListCubit>();
    final groupCubit = context.watch<GroupCubit>();

    return tokenCubit.state.when(
      initial: () {
        return const Center(child: GardenLoadingWidget());
      },
      authorized: (token) {
        return const Center(child: GardenLoadingWidget());
      },
      fail: (l) {
        Navigator.of(context).pushReplacementNamed(authRoute);
        return const Center(child: GardenLoadingWidget());
      },
      unauthorized: () {
        tokenCubit.passValidation();
        return const Center(child: GardenLoadingWidget());
      },
      tokenSuccess: (token) {
        return groupCubit.state.maybeWhen(
          success: (groups) {
            if (groups.isEmpty) {
              groupCubit
                  .upload(const GroupEntity(id: null, title: "Без группы"));
            }
            return plantListCubit.state.maybeWhen(
              success: (plantList) => growStageCubit.state.maybeWhen(
                success: (growStages) => lightNeedCubit.state.maybeWhen(
                  success: (lightNeeds) => wateringNeedCubit.state.maybeWhen(
                    success: (wateringNeeds) => plantTypeCubit.state.maybeWhen(
                      success: (plantTypes) =>
                          plantVarietyCubit.state.maybeWhen(
                        success: (plantVarieties) => GroupList(
                          groups: groups.map((group) {
                            return Group(
                              name: group.title ?? "Без названия",
                              plants: plantList
                                  .where(
                                    (element) => element.groupId == group.id,
                                  )
                                  .toList(),
                            );
                          }).toList(),
                          onRefresh: () async {
                            await plantListCubit.load();
                            await groupCubit.load();
                          },
                          onAddGroup: addGroup,
                        ),
                        fail: (message) => Center(
                          child: GardenDefaultLabelWidget(
                            text: message,
                            fontSize: 18,
                          ),
                        ),
                        remoteFail: (message) {
                          plantVarietyCubit.loadLocally();
                          return Center(
                            child: GardenDefaultLabelWidget(
                              text: message,
                              fontSize: 18,
                            ),
                          );
                        },
                        orElse: () => const Center(
                          child: GardenLoadingWidget(),
                        ),
                      ),
                      fail: (message) => Center(
                        child: GardenDefaultLabelWidget(
                          text: message,
                          fontSize: 18,
                        ),
                      ),
                      remoteFail: (message) {
                        plantTypeCubit.loadLocally();
                        return Center(
                          child: GardenDefaultLabelWidget(
                            text: message,
                            fontSize: 18,
                          ),
                        );
                      },
                      orElse: () => const Center(
                        child: GardenLoadingWidget(),
                      ),
                    ),
                    fail: (message) => Center(
                      child:
                          GardenDefaultLabelWidget(text: message, fontSize: 18),
                    ),
                    remoteFail: (message) {
                      wateringNeedCubit.loadLocally();
                      return Center(
                        child: GardenDefaultLabelWidget(
                          text: message,
                          fontSize: 18,
                        ),
                      );
                    },
                    orElse: () => const Center(
                      child: GardenLoadingWidget(),
                    ),
                  ),
                  fail: (message) => Center(
                    child:
                        GardenDefaultLabelWidget(text: message, fontSize: 18),
                  ),
                  remoteFail: (message) {
                    lightNeedCubit.loadLocally();
                    return Center(
                      child:
                          GardenDefaultLabelWidget(text: message, fontSize: 18),
                    );
                  },
                  orElse: () => const Center(
                    child: GardenLoadingWidget(),
                  ),
                ),
                fail: (message) => Center(
                  child: GardenDefaultLabelWidget(text: message, fontSize: 18),
                ),
                remoteFail: (message) {
                  growStageCubit.loadLocally();
                  return Center(
                    child:
                        GardenDefaultLabelWidget(text: message, fontSize: 18),
                  );
                },
                orElse: () => const Center(
                  child: GardenLoadingWidget(),
                ),
              ),
              fail: (message) => Center(
                child: GardenDefaultLabelWidget(text: message, fontSize: 18),
              ),
              remoteFail: (message) {
                plantListCubit.loadLocally();
                return Center(
                  child: GardenDefaultLabelWidget(text: message, fontSize: 18),
                );
              },
              orElse: () => const Center(
                child: GardenLoadingWidget(),
              ),
            );
          },
          fail: (message) => Center(
            child: GardenDefaultLabelWidget(text: message, fontSize: 18),
          ),
          remoteFail: (message) {
            groupCubit.loadLocally();
            return Center(
              child: GardenDefaultLabelWidget(text: message, fontSize: 18),
            );
          },
          orElse: () => const Center(
            child: GardenLoadingWidget(),
          ),
        );
      },
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
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_groups.dart';

part 'group_cubit.freezed.dart';
part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final LoadGroups loadPlants;
  List<GroupEntity> plantList = [];

  GroupCubit({required this.loadPlants}) : super(const GroupState.initial());

  Future<void> load() async {
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(GroupState.fail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          GroupState.success(
            plantList,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const GroupState.loading());
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(GroupState.fail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          GroupState.success(
            plantList,
          ),
        );
      },
    );
  }
}

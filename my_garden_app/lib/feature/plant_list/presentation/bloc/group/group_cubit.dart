import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_groups.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/upload/upload_group.dart';

part 'group_cubit.freezed.dart';
part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final LoadGroups loadGroups;
  final UploadGroup uploadGroups;
  List<GroupEntity> groupList = [];

  GroupCubit({required this.loadGroups, required this.uploadGroups})
      : super(const GroupState.initial());

  Future<void> load() async {
    emit(const GroupState.loading());
    final plants = await loadGroups([]);
    plants.fold(
      (error) => emit(GroupState.remoteFail(error.message)),
      (succededPlantList) {
        groupList = succededPlantList;
        emit(
          GroupState.success(
            groupList,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const GroupState.loading());
    final plants = await loadGroups([], false);
    plants.fold(
      (error) => emit(GroupState.remoteFail(error.message)),
      (succededPlantList) {
        groupList = succededPlantList;
        emit(
          GroupState.success(
            groupList,
          ),
        );
      },
    );
  }

  Future<void> upload(GroupEntity group) async {
    emit(const GroupState.loading());
    final result = await uploadGroups([group]);
    await load();
    groupList.add(group);
    result.fold(
      (error) => emit(GroupState.remoteFail(error.message)),
      (success) => emit(GroupState.success(groupList)),
    );
  }
}

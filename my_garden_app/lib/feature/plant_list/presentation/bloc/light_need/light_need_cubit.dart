import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/light_need_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_light_needs.dart';

part 'light_need_cubit.freezed.dart';
part 'light_need_state.dart';

class LightNeedCubit extends Cubit<LightNeedState> {
  final LoadLightNeeds loadLightNeeds;
  List<LightNeedEntity> plantList = [];

  LightNeedCubit({required this.loadLightNeeds})
      : super(const LightNeedState.initial());

  Future<void> load() async {
    emit(const LightNeedState.loading());
    final plants = await loadLightNeeds([]);
    plants.fold(
      (error) => emit(LightNeedState.remoteFail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          LightNeedState.success(
            plantList,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const LightNeedState.loading());
    final plants = await loadLightNeeds([], false);
    plants.fold(
      (error) => emit(LightNeedState.remoteFail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          LightNeedState.success(
            plantList,
          ),
        );
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/grow_stage_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_grow_stages.dart';

part 'grow_stage_cubit.freezed.dart';
part 'grow_stage_state.dart';

class GrowStageCubit extends Cubit<GrowStageState> {
  final LoadGrowStages loadGrowStages;
  List<GrowStageEntity> growStages = [];

  GrowStageCubit({required this.loadGrowStages})
      : super(const GrowStageState.initial());

  Future<void> load() async {
    emit(const GrowStageState.loading());
    final plants = await loadGrowStages([]);
    plants.fold(
      (error) => emit(GrowStageState.fail(error.message)),
      (succededPlantList) {
        growStages = succededPlantList;
        emit(
          GrowStageState.success(
            growStages,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const GrowStageState.loading());
    final plants = await loadGrowStages([], false);
    plants.fold(
      (error) => emit(GrowStageState.fail(error.message)),
      (succededPlantList) {
        growStages = succededPlantList;
        emit(
          GrowStageState.success(
            growStages,
          ),
        );
      },
    );
  }
}

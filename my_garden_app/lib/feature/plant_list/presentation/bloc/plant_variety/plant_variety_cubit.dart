import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_variety_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_plant_varieties.dart';

part 'plant_variety_cubit.freezed.dart';
part 'plant_variety_state.dart';

class PlantVarietyCubit extends Cubit<PlantVarietyState> {
  final LoadPlantVarieties loadPlants;
  List<PlantVarietyEntity> plantList = [];

  PlantVarietyCubit({required this.loadPlants})
      : super(const PlantVarietyState.initial());

  Future<void> load() async {
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(PlantVarietyState.fail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          PlantVarietyState.success(
            plantList,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const PlantVarietyState.loading());
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(PlantVarietyState.fail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          PlantVarietyState.success(
            plantList,
          ),
        );
      },
    );
  }
}

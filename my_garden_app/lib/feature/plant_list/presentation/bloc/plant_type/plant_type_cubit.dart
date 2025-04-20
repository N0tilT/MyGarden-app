import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_type_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_plant_types.dart';

part 'plant_type_cubit.freezed.dart';
part 'plant_type_state.dart';

class PlantTypeCubit extends Cubit<PlantTypeState> {
  final LoadPlantTypes loadPlants;
  List<PlantTypeEntity> plantList = [];

  PlantTypeCubit({required this.loadPlants})
      : super(const PlantTypeState.initial());

  Future<void> load() async {
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(PlantTypeState.fail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          PlantTypeState.success(
            plantList,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const PlantTypeState.loading());
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(PlantTypeState.fail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          PlantTypeState.success(
            plantList,
          ),
        );
      },
    );
  }
}

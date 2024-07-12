import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load_plants.dart';

part 'plant_list_state.dart';
part 'plant_list_cubit.freezed.dart';

class PlantListCubit extends Cubit<PlantListState> {
  final LoadPlants loadPlants;

  List<PlantEntity> plantList = [];

  PlantListCubit({required this.loadPlants}) : super(const PlantListState.initial());

  Future<void> load() async {
    final plants = await loadPlants(() {});
    plants.fold(
      (error) => emit(PlantListState.fail(error.message)),
      (succededPlantList) {
        plantList =
            succededPlantList.map((e) => PlantEntity.fromModel(e)).toList();
        emit(
          PlantListState.success(
            plantList,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const PlantListState.loading());
    final plants = await loadPlants(() {});
    plants.fold(
      (error) => emit(PlantListState.fail(error.message)),
      (succededPlantList) {
        plantList =
            succededPlantList.map((e) => PlantEntity.fromModel(e)).toList();
        emit(
          PlantListState.success(
            plantList,
          ),
        );
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/add_plant.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load_plants.dart';

part 'plant_list_cubit.freezed.dart';
part 'plant_list_state.dart';

class PlantListCubit extends Cubit<PlantListState> {
  final LoadPlants loadPlants;
  final UploadPlant uploadPlant;
  List<PlantEntity> plantList = [];

  PlantListCubit({required this.loadPlants, required this.uploadPlant})
      : super(const PlantListState.initial());

  Future<void> upload(PlantEntity plant) async {
    final result = await uploadPlant([
      PlantModel(
          id: plant.id,
          title: plant.title,
          biologyTitle: plant.biologyTitle,
          fertilization: plant.fertilization,
          toxicity: plant.toxicity,
          replacing: plant.replacing,
          description: plant.description,
          groupId: plant.groupId,
          wateringNeedId: plant.wateringNeedId,
          lightNeedId: plant.lightNeedId,
          stageId: plant.stageId,
          imageId: plant.imageId,
          ripeningPeriod: plant.ripeningPeriod)
    ]);
    plantList.add(plant);
    result.fold(
      (error) => emit(PlantListState.fail(error.message)),
      (success) => emit(PlantListState.success(plantList)),
    );
  }

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

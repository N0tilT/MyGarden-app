import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/delete/delete_plant.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_plants.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/upload/upload_plant.dart';

part 'plant_list_cubit.freezed.dart';
part 'plant_list_state.dart';

class PlantListCubit extends Cubit<PlantListState> {
  final LoadPlants loadPlants;
  final UploadPlant uploadPlant;
  final DeletePlant deletePlant;
  List<PlantEntity> plantList = [];

  PlantListCubit(
      {required this.loadPlants,
      required this.uploadPlant,
      required this.deletePlant})
      : super(const PlantListState.initial());

  Future<void> upload(PlantEntity plant) async {
    emit(const PlantListState.loading());
    final result = await uploadPlant([plant]);
    plantList.add(plant);
    result.fold(
      (error) => emit(PlantListState.remoteFail(error.message)),
      (success) => emit(PlantListState.success(plantList)),
    );
  }

  Future<void> load() async {
    emit(const PlantListState.loading());
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(PlantListState.remoteFail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
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
    final plants = await loadPlants([], false);
    plants.fold(
      (error) => emit(PlantListState.remoteFail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          PlantListState.success(
            plantList,
          ),
        );
      },
    );
  }

  Future<void> delete(int id) async {
    emit(const PlantListState.loading());
    final result = await deletePlant(id);
    plantList.removeWhere((plant) => plant.id! == id);
    result.fold(
      (error) => emit(PlantListState.remoteFail(error.message)),
      (success) => emit(PlantListState.success(plantList)),
    );
  }
}

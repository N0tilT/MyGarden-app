import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/garden_type_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_garden_types.dart';

part 'garden_type_cubit.freezed.dart';
part 'garden_type_state.dart';

class GardenTypeCubit extends Cubit<GardenTypeState> {
  final LoadGardenTypes loadPlants;
  List<GardenTypeEntity> plantList = [];

  GardenTypeCubit({required this.loadPlants})
      : super(const GardenTypeState.initial());

  Future<void> load() async {
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(GardenTypeState.fail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          GardenTypeState.success(
            plantList,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const GardenTypeState.loading());
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(GardenTypeState.fail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          GardenTypeState.success(
            plantList,
          ),
        );
      },
    );
  }
}

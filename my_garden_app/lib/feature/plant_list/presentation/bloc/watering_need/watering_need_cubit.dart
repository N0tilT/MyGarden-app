import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/watering_need_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/load/load_watering_needs.dart';

part 'watering_need_cubit.freezed.dart';
part 'watering_need_state.dart';

class WateringNeedCubit extends Cubit<WateringNeedState> {
  final LoadWateringNeeds loadPlants;
  List<WateringNeedEntity> plantList = [];

  WateringNeedCubit({required this.loadPlants})
      : super(const WateringNeedState.initial());

  Future<void> load() async {
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(WateringNeedState.fail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          WateringNeedState.success(
            plantList,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const WateringNeedState.loading());
    final plants = await loadPlants([]);
    plants.fold(
      (error) => emit(WateringNeedState.fail(error.message)),
      (succededPlantList) {
        plantList = succededPlantList;
        emit(
          WateringNeedState.success(
            plantList,
          ),
        );
      },
    );
  }
}

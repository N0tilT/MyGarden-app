import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/event_journal/domain/entities/event_entity.dart';
import 'package:my_garden_app/feature/plant_card/domain/entities/plant_card_entity.dart';
import 'package:my_garden_app/feature/plant_card/domain/usecases/load_plant_card_events.dart';
import 'package:my_garden_app/feature/plant_card/domain/usecases/load_plant_card_info.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';

part 'plant_card_cubit.freezed.dart';
part 'plant_card_state.dart';

class PlantCardCubit extends Cubit<PlantCardState> {
  final LoadPlant loadPlant;
  final LoadPlantEvents loadPlantEvents;

  PlantCardCubit({required this.loadPlant, required this.loadPlantEvents})
      : super(const PlantCardState.initial());

  Future<void> loadLocally(int plantId) async {
    emit(const PlantCardState.loading());
    final plant = await loadPlant(plantId);
    plant.fold(
      (error) => emit(PlantCardState.fail(error.message)),
      (succededPlant) async {
        final events = await loadPlantEvents(plantId);
        events.fold(
          (error) => emit(PlantCardState.fail(error.message)),
          (succededEvents) => emit(
            PlantCardState.success(
              PlantCardEntity(
                plant: PlantEntity.fromModel(succededPlant),
                event: succededEvents
                    .map(
                      (e) => EventEntity.fromModel(e),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_prefill_response_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/usecases/prefill/prefill_plant.dart';

part 'plant_prefill_cubit.freezed.dart';
part 'plant_prefill_state.dart';

class PlantPrefillCubit extends Cubit<PlantPrefillState> {
  final PrefillPlant prefillPlant;

  PlantPrefillCubit({
    required this.prefillPlant,
  }) : super(const PlantPrefillState.initial());

  Future<void> prefill(String type) async {
    emit(const PlantPrefillState.loading());
    final result = await prefillPlant(type);
    result.fold(
      (error) => emit(PlantPrefillState.remoteFail(error.message)),
      (success) => emit(PlantPrefillState.recognizeSuccess(success)),
    );
  }
}

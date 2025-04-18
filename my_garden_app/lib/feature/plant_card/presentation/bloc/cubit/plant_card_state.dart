part of 'plant_card_cubit.dart';

@freezed
class PlantCardState with _$PlantCardState {
  const factory PlantCardState.initial() = _Initial;
  const factory PlantCardState.loading() = _Loading;
  const factory PlantCardState.success(PlantCardEntity departments) = _Success;
  const factory PlantCardState.fail([
    @Default("Unknown error") String message,
  ]) = _Fail;
}

part of 'plant_variety_cubit.dart';

@freezed
class PlantVarietyState with _$PlantVarietyState {
  const factory PlantVarietyState.initial() = _Initial;
  const factory PlantVarietyState.loading() = _Loading;
  const factory PlantVarietyState.success(List<PlantVarietyEntity> plants) =
      _Success;
  const factory PlantVarietyState.fail([
    @Default("Unknown error") String message,
  ]) = _Fail;
  const factory PlantVarietyState.localLoadingFail([
    @Default("Unknown error") String message,
  ]) = _LocalLoadingFail;
  const factory PlantVarietyState.localLoadingSuccess(
    List<PlantVarietyEntity> departments,
  ) = _LocalLoadingSuccess;
}

part of 'plant_variety_cubit.dart';

@freezed
class PlantVarietyState with _$PlantVarietyState {
  const factory PlantVarietyState.initial() = PlantVarietyInitial;
  const factory PlantVarietyState.loading() = PlantVarietyLoading;
  const factory PlantVarietyState.success(List<PlantVarietyEntity> plants) =
      PlantVarietySuccess;
  const factory PlantVarietyState.remoteFail([
    @Default("Unknown error") String message,
  ]) = PlantVarietyFail;
  const factory PlantVarietyState.fail([
    @Default("Unknown error") String message,
  ]) = PlantVarietyLocalLoadingFail;
  const factory PlantVarietyState.localLoadingSuccess(
    List<PlantVarietyEntity> departments,
  ) = PlantVarietyLocalLoadingSuccess;
}

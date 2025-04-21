part of 'plant_type_cubit.dart';

@freezed
class PlantTypeState with _$PlantTypeState {
  const factory PlantTypeState.initial() = PlantTypeInitial;
  const factory PlantTypeState.loading() = PlantTypeLoading;
  const factory PlantTypeState.success(List<PlantTypeEntity> plants) =
      PlantTypeSuccess;
  const factory PlantTypeState.fail([
    @Default("Unknown error") String message,
  ]) = PlantTypeFail;
  const factory PlantTypeState.localLoadingFail([
    @Default("Unknown error") String message,
  ]) = PlantTypeLocalLoadingFail;
  const factory PlantTypeState.localLoadingSuccess(
    List<PlantTypeEntity> departments,
  ) = PlantTypeLocalLoadingSuccess;
}

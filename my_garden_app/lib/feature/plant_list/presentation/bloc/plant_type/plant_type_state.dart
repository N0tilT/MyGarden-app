part of 'plant_type_cubit.dart';

@freezed
class PlantTypeState with _$PlantTypeState {
  const factory PlantTypeState.initial() = _Initial;
  const factory PlantTypeState.loading() = _Loading;
  const factory PlantTypeState.success(List<PlantTypeEntity> plants) = _Success;
  const factory PlantTypeState.fail([
    @Default("Unknown error") String message,
  ]) = _Fail;
  const factory PlantTypeState.localLoadingFail([
    @Default("Unknown error") String message,
  ]) = _LocalLoadingFail;
  const factory PlantTypeState.localLoadingSuccess(
    List<PlantTypeEntity> departments,
  ) = _LocalLoadingSuccess;
}

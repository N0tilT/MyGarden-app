part of 'plant_list_cubit.dart';

@freezed
class PlantListState with _$PlantListState {
  const factory PlantListState.initial() = _Initial;
  const factory PlantListState.loading() = _Loading;
  const factory PlantListState.success(List<PlantEntity> plants) = _Success;
  const factory PlantListState.remoteFail([
    @Default("Unknown error") String message,
  ]) = _Fail;
  const factory PlantListState.fail([
    @Default("Unknown error") String message,
  ]) = _LocalLoadingFail;
  const factory PlantListState.localLoadingSuccess(
    List<PlantEntity> departments,
  ) = _LocalLoadingSuccess;
}

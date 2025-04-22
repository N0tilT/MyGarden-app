part of 'garden_type_cubit.dart';

@freezed
class GardenTypeState with _$GardenTypeState {
  const factory GardenTypeState.initial() = _Initial;
  const factory GardenTypeState.loading() = _Loading;
  const factory GardenTypeState.success(List<GardenTypeEntity> plants) =
      _Success;
  const factory GardenTypeState.remoteFail([
    @Default("Unknown error") String message,
  ]) = _Fail;
  const factory GardenTypeState.fail([
    @Default("Unknown error") String message,
  ]) = _LocalLoadingFail;
  const factory GardenTypeState.localLoadingSuccess(
    List<GardenTypeEntity> departments,
  ) = _LocalLoadingSuccess;
}

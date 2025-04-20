part of 'grow_stage_cubit.dart';

@freezed
class GrowStageState with _$GrowStageState {
  const factory GrowStageState.initial() = _Initial;
  const factory GrowStageState.loading() = _Loading;
  const factory GrowStageState.success(List<GrowStageEntity> plants) = _Success;
  const factory GrowStageState.fail([
    @Default("Unknown error") String message,
  ]) = _Fail;
  const factory GrowStageState.localLoadingFail([
    @Default("Unknown error") String message,
  ]) = _LocalLoadingFail;
  const factory GrowStageState.localLoadingSuccess(
    List<GrowStageEntity> departments,
  ) = _LocalLoadingSuccess;
}

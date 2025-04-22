part of 'grow_stage_cubit.dart';

@freezed
class GrowStageState with _$GrowStageState {
  const factory GrowStageState.initial() = GrowStageInitial;
  const factory GrowStageState.loading() = GrowStageLoading;
  const factory GrowStageState.success(List<GrowStageEntity> plants) =
      GrowStageSuccess;
  const factory GrowStageState.remoteFail([
    @Default("Unknown error") String message,
  ]) = GrowStageFail;
  const factory GrowStageState.fail([
    @Default("Unknown error") String message,
  ]) = GrowStageLocalLoadingFail;
  const factory GrowStageState.localLoadingSuccess(
    List<GrowStageEntity> departments,
  ) = GrowStageLocalLoadingSuccess;
}

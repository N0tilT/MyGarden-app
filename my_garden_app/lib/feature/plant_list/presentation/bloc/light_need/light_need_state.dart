part of 'light_need_cubit.dart';

@freezed
class LightNeedState with _$LightNeedState {
  const factory LightNeedState.initial() = LightNeedInitial;
  const factory LightNeedState.loading() = LightNeedLoading;
  const factory LightNeedState.success(List<LightNeedEntity> plants) =
      LightNeedSuccess;
  const factory LightNeedState.remoteFail([
    @Default("Unknown error") String message,
  ]) = LightNeedFail;
  const factory LightNeedState.fail([
    @Default("Unknown error") String message,
  ]) = LightNeedLocalLoadingFail;
  const factory LightNeedState.localLoadingSuccess(
    List<LightNeedEntity> departments,
  ) = LightNeedLocalLoadingSuccess;
}

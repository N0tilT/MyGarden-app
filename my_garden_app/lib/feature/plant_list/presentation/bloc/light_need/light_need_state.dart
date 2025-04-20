part of 'light_need_cubit.dart';

@freezed
class LightNeedState with _$LightNeedState {
  const factory LightNeedState.initial() = _Initial;
  const factory LightNeedState.loading() = _Loading;
  const factory LightNeedState.success(List<LightNeedEntity> plants) = _Success;
  const factory LightNeedState.fail([
    @Default("Unknown error") String message,
  ]) = _Fail;
  const factory LightNeedState.localLoadingFail([
    @Default("Unknown error") String message,
  ]) = _LocalLoadingFail;
  const factory LightNeedState.localLoadingSuccess(
    List<LightNeedEntity> departments,
  ) = _LocalLoadingSuccess;
}

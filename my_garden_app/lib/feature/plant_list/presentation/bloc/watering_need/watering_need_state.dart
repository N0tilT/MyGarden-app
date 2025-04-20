part of 'watering_need_cubit.dart';

@freezed
class WateringNeedState with _$WateringNeedState {
  const factory WateringNeedState.initial() = _Initial;
  const factory WateringNeedState.loading() = _Loading;
  const factory WateringNeedState.success(List<WateringNeedEntity> plants) =
      _Success;
  const factory WateringNeedState.fail([
    @Default("Unknown error") String message,
  ]) = _Fail;
  const factory WateringNeedState.localLoadingFail([
    @Default("Unknown error") String message,
  ]) = _LocalLoadingFail;
  const factory WateringNeedState.localLoadingSuccess(
    List<WateringNeedEntity> departments,
  ) = _LocalLoadingSuccess;
}

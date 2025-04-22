part of 'watering_need_cubit.dart';

@freezed
class WateringNeedState with _$WateringNeedState {
  const factory WateringNeedState.initial() = WateringNeedInitial;
  const factory WateringNeedState.loading() = WateringNeedLoading;
  const factory WateringNeedState.success(List<WateringNeedEntity> plants) =
      WateringNeedSuccess;
  const factory WateringNeedState.remoteFail([
    @Default("Unknown error") String message,
  ]) = WateringNeedFail;
  const factory WateringNeedState.fail([
    @Default("Unknown error") String message,
  ]) = WateringNeedLocalLoadingFail;
  const factory WateringNeedState.localLoadingSuccess(
    List<WateringNeedEntity> departments,
  ) = WateringNeedLocalLoadingSuccess;
}

part of 'event_cubit.dart';

@freezed
class EventState with _$EventState {
  const factory EventState.initial() = _Initial;
  const factory EventState.loading() = _Loading;
  const factory EventState.success(List<EventEntity> departments) = _Success;
  const factory EventState.fail([@Default("Unknown error") String message]) =
      _Fail;
  const factory EventState.remoteFail([
    @Default("Unknown error") String message,
  ]) = _LocalLoadingFail;
  const factory EventState.localLoadingSuccess(List<EventEntity> departments) =
      _LocalLoadingSuccess;
}

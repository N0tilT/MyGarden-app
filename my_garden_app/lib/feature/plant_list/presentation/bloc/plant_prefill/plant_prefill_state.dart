part of 'plant_prefill_cubit.dart';

@freezed
class PlantPrefillState with _$PlantPrefillState {
  const factory PlantPrefillState.initial() = _Initial;
  const factory PlantPrefillState.loading() = _Loading;
  const factory PlantPrefillState.recognizeSuccess(
    PlantPrefillResponseEntity plant,
  ) = _RecognizeSuccess;
  const factory PlantPrefillState.remoteFail([
    @Default("Unknown error") String message,
  ]) = _Fail;
}

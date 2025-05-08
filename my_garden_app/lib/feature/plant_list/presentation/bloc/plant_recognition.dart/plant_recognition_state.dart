part of 'plant_recognition_cubit.dart';

@freezed
class PlantRecognitionState with _$PlantRecognitionState {
  const factory PlantRecognitionState.initial() = _Initial;
  const factory PlantRecognitionState.loading() = _Loading;
  const factory PlantRecognitionState.recognizeSuccess(
    PlantRecognitionResponseEntity plant,
  ) = _RecognizeSuccess;
  const factory PlantRecognitionState.remoteFail([
    @Default("Unknown error") String message,
  ]) = _Fail;
}

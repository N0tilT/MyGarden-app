
part of 'flower_bed_cubit.dart';

@freezed
class FlowerBedState with _$FlowerBedState {
  const factory FlowerBedState.initial() = _Initial;
  const factory FlowerBedState.loading() = _Loading;
  const factory FlowerBedState.success(List<FlowerBedEntity> departments) = _Success;
  const factory FlowerBedState.fail([@Default("Unknown error") String message]) = _Fail;
}

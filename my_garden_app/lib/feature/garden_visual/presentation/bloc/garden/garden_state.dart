
part of 'garden_cubit.dart';

@freezed
class GardenState with _$GardenState {
  const factory GardenState.initial() = _Initial;
  const factory GardenState.loading() = _Loading;
  const factory GardenState.success(List<GardenEntity> departments) = _Success;
  const factory GardenState.fail([@Default("Unknown error") String message]) = _Fail;
}

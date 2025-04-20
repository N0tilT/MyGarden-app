import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/watering_need_model.dart';

part 'watering_need_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class WateringNeedEntity with _$WateringNeedEntity implements ICommonEntity {
  const factory WateringNeedEntity({
    required int id,
    required String? title,
  }) = _WateringNeedEntity;

  const WateringNeedEntity._();

  factory WateringNeedEntity.fromModel(WateringNeedModel model) =>
      WateringNeedEntity(
        id: model.id,
        title: model.title,
      );

  @override
  String toString() {
    return title.toString();
  }
}

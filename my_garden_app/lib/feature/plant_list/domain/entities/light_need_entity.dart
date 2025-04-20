import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/light_need_model.dart';

part 'light_need_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class LightNeedEntity with _$LightNeedEntity implements ICommonEntity {
  const factory LightNeedEntity({
    required int id,
    required String? title,
  }) = _LightNeedEntity;

  const LightNeedEntity._();

  factory LightNeedEntity.fromModel(LightNeedModel model) => LightNeedEntity(
        id: model.id,
        title: model.title,
      );

  @override
  String toString() {
    return title.toString();
  }
}

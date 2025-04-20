import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/grow_stage_model.dart';

part 'grow_stage_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class GrowStageEntity with _$GrowStageEntity implements ICommonEntity {
  const factory GrowStageEntity({
    required int id,
    required String? title,
  }) = _GrowStageEntity;

  const GrowStageEntity._();

  factory GrowStageEntity.fromModel(GrowStageModel model) => GrowStageEntity(
        id: model.id,
        title: model.title,
      );

  @override
  String toString() {
    return title.toString();
  }
}

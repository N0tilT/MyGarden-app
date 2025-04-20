import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_type_model.dart';

part 'garden_type_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class GardenTypeEntity
    with _$GardenTypeEntity
    implements ICommonEntity<GardenTypeModel> {
  const factory GardenTypeEntity({
    required int id,
    required String? title,
  }) = _GardenTypeEntity;

  const GardenTypeEntity._();

  factory GardenTypeEntity.fromModel(GardenTypeModel model) => GardenTypeEntity(
        id: model.id,
        title: model.title,
      );

  @override
  String toString() {
    return title.toString();
  }
}

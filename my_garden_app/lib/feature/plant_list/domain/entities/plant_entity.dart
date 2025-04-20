import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/core/domain/entities/i_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';

part 'plant_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class PlantEntity with _$PlantEntity implements ICommonEntity {
  const factory PlantEntity({
    required int id,
    required String? title,
    required String? biologyTitle,
    required String? fertilization,
    required String? toxicity,
    required String? replacing,
    required String? description,
    required int groupId,
    required int wateringNeedId,
    required int lightNeedId,
    required int plantTypeId,
    required int plantVarietyId,
    required int stageId,
    required int imageId,
    required int ripeningPeriod,
  }) = _PlantEntity;

  const PlantEntity._();

  factory PlantEntity.fromModel(PlantModel model) => PlantEntity(
        id: model.id,
        title: model.title,
        biologyTitle: model.biologyTitle,
        fertilization: model.fertilization,
        toxicity: model.toxicity,
        replacing: model.replacing,
        description: model.description,
        groupId: model.groupId,
        wateringNeedId: model.wateringNeedId,
        lightNeedId: model.lightNeedId,
        plantTypeId: model.plantTypeId,
        plantVarietyId: model.plantVarietyId,
        stageId: model.stageId,
        imageId: model.imageId,
        ripeningPeriod: model.ripeningPeriod,
      );

  @override
  String toString() {
    return title.toString();
  }
}

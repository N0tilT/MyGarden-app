import 'package:my_garden_app/core/domain/usecases/load_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_variety_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_variety_entity.dart';

class LoadPlantVarieties
    extends LoadCommonEntity<PlantVarietyEntity, PlantVarietyModel> {
  LoadPlantVarieties({
    required super.commonRepository,
    required super.authRepository,
    required super.fromModelConverter,
  });
}

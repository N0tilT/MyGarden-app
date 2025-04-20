import 'package:my_garden_app/core/domain/usecases/load_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_type_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_type_entity.dart';

class LoadPlantTypes extends LoadCommonEntity<PlantTypeEntity, PlantTypeModel> {
  LoadPlantTypes({
    required super.commonRepository,
    required super.authRepository,
    required super.fromModelConverter,
  });
}

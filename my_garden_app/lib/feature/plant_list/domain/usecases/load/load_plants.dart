import 'package:my_garden_app/core/domain/usecases/load_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';

class LoadPlants extends LoadCommonEntity<PlantEntity, PlantModel> {
  LoadPlants({
    required super.commonRepository,
    required super.authRepository,
    required super.fromModelConverter,
  });
}

import 'package:my_garden_app/core/domain/usecases/delete_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';

class DeletePlant extends DeleteCommonEntity<PlantEntity, PlantModel> {
  DeletePlant({
    required super.commonRepository,
    required super.authRepository,
  });
}

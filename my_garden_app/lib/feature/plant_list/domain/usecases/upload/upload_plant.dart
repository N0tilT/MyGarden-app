import 'package:my_garden_app/core/domain/usecases/upload_hasUserId_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';

class UploadPlant extends UploadHasuseridEntity<PlantEntity, PlantModel> {
  UploadPlant({
    required super.commonRepository,
    required super.authRepository,
    required super.fromEntityConverter,
  });
}

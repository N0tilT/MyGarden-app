import 'package:my_garden_app/core/domain/usecases/upload_hasUserId_entity.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/garden_entity.dart';

class UploadGarden extends UploadHasuseridEntity<GardenEntity, GardenModel> {
  UploadGarden({
    required super.commonRepository,
    required super.authRepository,
    required super.fromEntityConverter,
  });
}

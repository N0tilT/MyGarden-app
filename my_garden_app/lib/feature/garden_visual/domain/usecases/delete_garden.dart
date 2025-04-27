import 'package:my_garden_app/core/domain/usecases/delete_common_entity.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/garden_entity.dart';

class DeleteGarden extends DeleteCommonEntity<GardenEntity, GardenModel> {
  DeleteGarden({
    required super.commonRepository,
    required super.authRepository,
  });
}

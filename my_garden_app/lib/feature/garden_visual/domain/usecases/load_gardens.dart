import 'package:my_garden_app/core/domain/usecases/load_common_entity.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/garden_entity.dart';

class LoadGardens extends LoadCommonEntity<GardenEntity, GardenModel> {
  LoadGardens({
    required super.commonRepository,
    required super.authRepository,
    required super.fromModelConverter,
  });
}

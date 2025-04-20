import 'package:my_garden_app/core/domain/usecases/load_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/garden_type_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/garden_type_entity.dart';

class LoadGardenTypes
    extends LoadCommonEntity<GardenTypeEntity, GardenTypeModel> {
  LoadGardenTypes({
    required super.commonRepository,
    required super.authRepository,
    required super.fromModelConverter,
  });
}

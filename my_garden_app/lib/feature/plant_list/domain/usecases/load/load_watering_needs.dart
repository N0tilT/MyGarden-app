import 'package:my_garden_app/core/domain/usecases/load_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/watering_need_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/watering_need_entity.dart';

class LoadWateringNeeds
    extends LoadCommonEntity<WateringNeedEntity, WateringNeedModel> {
  LoadWateringNeeds({
    required super.commonRepository,
    required super.authRepository,
    required super.fromModelConverter,
  });
}

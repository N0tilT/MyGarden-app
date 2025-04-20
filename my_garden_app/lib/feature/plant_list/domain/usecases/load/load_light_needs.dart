import 'package:my_garden_app/core/domain/usecases/load_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/light_need_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/light_need_entity.dart';

class LoadLightNeeds extends LoadCommonEntity<LightNeedEntity, LightNeedModel> {
  LoadLightNeeds({
    required super.commonRepository,
    required super.authRepository,
    required super.fromModelConverter,
  });
}

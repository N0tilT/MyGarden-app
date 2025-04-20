import 'package:my_garden_app/core/domain/usecases/load_common_entity.dart';
import 'package:my_garden_app/feature/plant_list/data/model/grow_stage_model.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/grow_stage_entity.dart';

class LoadGrowStages extends LoadCommonEntity<GrowStageEntity, GrowStageModel> {
  LoadGrowStages({
    required super.commonRepository,
    required super.authRepository,
    required super.fromModelConverter,
  });
}

import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/grow_stage_model.dart';

class GrowStageLocalDataSource
    extends LocalDataSource<List<GrowStageModel>, CommonRequestModel> {
  Box<GrowStageModel> growStageBox;

  GrowStageLocalDataSource({required this.growStageBox});

  @override
  Future<void> update(List<GrowStageModel> growStageList) async {
    try {
      if (growStageList.isEmpty) {
        growStageBox.clear();
        return;
      }
      await updateBox<GrowStageModel>(
        {for (final item in growStageList) item.id: item},
        growStageBox.values.map((e) => e.id).toList(),
        growStageBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<GrowStageModel>> load(void request) async {
    try {
      return growStageBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
}

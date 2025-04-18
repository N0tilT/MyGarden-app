import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/plant_list/data/model/watering_need_model.dart';

class WateringNeedLocalDataSource
    extends LocalDataSource<List<WateringNeedModel>, void> {
  Box<WateringNeedModel> wateringNeedBox;

  WateringNeedLocalDataSource({required this.wateringNeedBox});

  @override
  Future<void> update(List<WateringNeedModel> wateringNeedList) async {
    try {
      if (wateringNeedList.isEmpty) {
        wateringNeedBox.clear();
        return;
      }
      await updateBox<WateringNeedModel>(
        {for (final item in wateringNeedList) item.id: item},
        wateringNeedBox.values.map((e) => e.id).toList(),
        wateringNeedBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<WateringNeedModel>> load(void request) async {
    try {
      return wateringNeedBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
}

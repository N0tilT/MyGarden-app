import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';

class GardenLocalDataSource extends LocalDataSource<List<GardenModel>, void> {
  Box<GardenModel> gardenBox;

  GardenLocalDataSource({
    required this.gardenBox,
  });

  @override
  Future<void> update(List<GardenModel> gardenList) async {
    try {
      if (gardenList.isEmpty) {
        gardenBox.clear();
        return;
      }
      await updateBox<GardenModel>(
        {for (final item in gardenList) item.id: item},
        gardenBox.values.map((e) => e.id).toList(),
        gardenBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<GardenModel>> load(void request) async {
    try {
      return gardenBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
}

import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';

class GardenLocalDataSource extends LocalDataSource<List<GardenModel>, void> {
  Box<GardenModel> flowerBedBox;

  GardenLocalDataSource({
    required this.flowerBedBox,
  });

  @override
  Future<void> update(List<GardenModel> flowerBedList) async {
    try {
      if (flowerBedList.isEmpty) {
        flowerBedBox.clear();
        return;
      }
      await updateBox<GardenModel>(
        {for (final item in flowerBedList) item.id: item},
        flowerBedBox.values.map((e) => e.id).toList(),
        flowerBedBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<GardenModel>> load(void request) async {
    try {
      return flowerBedBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
}

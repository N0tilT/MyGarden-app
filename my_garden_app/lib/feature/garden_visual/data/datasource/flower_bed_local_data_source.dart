import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';

class FlowerBedLocalDataSource
    extends LocalDataSource<List<FlowerBedModel>, void> {
  Box<FlowerBedModel> flowerBedBox;

  FlowerBedLocalDataSource({
    required this.flowerBedBox,
  });

  @override
  Future<void> update(List<FlowerBedModel> flowerBedList) async {
    try {
      if (flowerBedList.isEmpty) {
        flowerBedBox.clear();
        return;
      }
      await updateBox<FlowerBedModel>(
        {for (final item in flowerBedList) item.id: item},
        flowerBedBox.values.map((e) => e.id).toList(),
        flowerBedBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<FlowerBedModel>> load(void request) async {
    try {
      return flowerBedBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
}

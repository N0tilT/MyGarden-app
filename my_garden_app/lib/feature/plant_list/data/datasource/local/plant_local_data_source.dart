import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';

class PlantLocalDataSource extends LocalDataSource<List<PlantModel>, void> {
  Box<PlantModel> plantBox;

  PlantLocalDataSource({required this.plantBox});

  @override
  Future<void> update(List<PlantModel> plantList) async {
    try {
      if (plantList.isEmpty) {
        plantBox.clear();
        return;
      }
      await updateBox<PlantModel>(
        {for (final item in plantList) item.id: item},
        plantBox.values.map((e) => e.id).toList(),
        plantBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<PlantModel>> load(void request) async {
    try {
      return plantBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
}

import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';

class PlantLocalDataSource
    extends LocalDataSource<List<PlantModel>, CommonRequestModel> {
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
        {for (final item in plantList) item.id ?? -1: item},
        plantBox.values.map((e) => e.id!).toList(),
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

  @override
  Future<void> delete(int id) async {
    try {
      await plantBox.delete(id);
    } catch (e) {
      throw CacheException();
    }
  }
}

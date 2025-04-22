import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_variety_model.dart';

class PlantVarietyLocalDataSource
    extends LocalDataSource<List<PlantVarietyModel>, CommonRequestModel> {
  Box<PlantVarietyModel> plantVarietyBox;

  PlantVarietyLocalDataSource({required this.plantVarietyBox});

  @override
  Future<void> update(List<PlantVarietyModel> plantVarietyList) async {
    try {
      if (plantVarietyList.isEmpty) {
        plantVarietyBox.clear();
        return;
      }
      await updateBox<PlantVarietyModel>(
        {for (final item in plantVarietyList) item.id: item},
        plantVarietyBox.values.map((e) => e.id).toList(),
        plantVarietyBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<PlantVarietyModel>> load(void request) async {
    try {
      return plantVarietyBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await plantVarietyBox.delete(id);
    } catch (e) {
      throw CacheException();
    }
  }
}

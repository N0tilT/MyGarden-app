import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/core/data/model/common_request_model.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_type_model.dart';

class PlantTypeLocalDataSource
    extends LocalDataSource<List<PlantTypeModel>, CommonRequestModel> {
  Box<PlantTypeModel> plantTypeBox;

  PlantTypeLocalDataSource({required this.plantTypeBox});

  @override
  Future<void> update(List<PlantTypeModel> plantTypeList) async {
    try {
      if (plantTypeList.isEmpty) {
        plantTypeBox.clear();
        return;
      }
      await updateBox<PlantTypeModel>(
        {for (final item in plantTypeList) item.id: item},
        plantTypeBox.values.map((e) => e.id).toList(),
        plantTypeBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<PlantTypeModel>> load(void request) async {
    try {
      return plantTypeBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await plantTypeBox.delete(id);
    } catch (e) {
      throw CacheException();
    }
  }
}

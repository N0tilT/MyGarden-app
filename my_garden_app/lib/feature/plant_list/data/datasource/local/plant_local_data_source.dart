import 'package:hive/hive.dart';
import 'package:my_garden_app/core/data/datasource/datasource.dart';
import 'package:my_garden_app/core/data/error/exception.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_model.dart';

class PlantLocalDataSource
    extends LocalDataSource<List<PlantModel>, void> {
  Box<PlantModel> departmentBox;

  PlantLocalDataSource({required this.departmentBox});

  @override
  Future<void> add(List<PlantModel> departmentList) async {
    try {
      if (departmentList.isEmpty) {
        departmentBox.clear();
        return;
      }
      await updateBox<PlantModel>(
        {for (final item in departmentList) item.id: item},
        departmentBox.values.map((e) => e.id).toList(),
        departmentBox,
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<List<PlantModel>> studentLoad(void request) async {
    try {
      return departmentBox.values.toList();
    } catch (e) {
      throw CacheException();
    }
  }
  
}

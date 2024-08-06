// ignore_for_file: avoid_dynamic_calls, type_annotate_public_apis
import 'package:my_garden_app/feature/garden_visual/data/model/garden_model.dart';

class GardenEntity {
  int id;
  String title;

  GardenEntity({
    required this.id,
    required this.title,
  });

  factory GardenEntity.fromModel(GardenModel model) => GardenEntity(
        id: model.id,
        title: model.title,
      );

  @override
  String toString() {
    return title;
  }
}

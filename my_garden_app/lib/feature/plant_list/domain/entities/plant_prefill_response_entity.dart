import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/data/model/plant_Prefill_response_model.dart';

part 'plant_prefill_response_entity.freezed.dart';

@Freezed(
  toStringOverride: false,
)
class PlantPrefillResponseEntity with _$PlantPrefillResponseEntity {
  const factory PlantPrefillResponseEntity({
    required String type,
    required List<ArticleEntity> articles,
    required String wateringNeed,
    required String lightNeed,
    required List<String> fertilizer,
    required String? summary,
  }) = _PlantPrefillResponseEntity;

  const PlantPrefillResponseEntity._();

  factory PlantPrefillResponseEntity.fromModel(
    PlantPrefillResponseModel model,
  ) =>
      PlantPrefillResponseEntity(
        type: model.type,
        articles:
            model.articles.map((x) => ArticleEntity.fromModel(x)).toList(),
        wateringNeed: model.labels.wateringNeed,
        lightNeed: model.labels.lightNeed,
        fertilizer: model.labels.fertilizer,
        summary: model.summary,
      );
}

@Freezed(
  toStringOverride: false,
)
class ArticleEntity with _$ArticleEntity {
  const factory ArticleEntity({
    required String title,
    required String link,
  }) = _ArticleEntity;

  const ArticleEntity._();

  factory ArticleEntity.fromModel(
    ArticleModel model,
  ) =>
      ArticleEntity(title: model.title, link: model.link);
}

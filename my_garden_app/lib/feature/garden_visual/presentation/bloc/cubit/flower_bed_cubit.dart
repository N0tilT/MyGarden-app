import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/garden_visual/data/model/flower_bed_model.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/flower_bed_entity.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/load_flower_beds.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/upload_flower_bed.dart';

part 'flower_bed_cubit.freezed.dart';
part 'flower_bed_state.dart';

class FlowerBedCubit extends Cubit<FlowerBedState> {
  final LoadFlowerBeds loadFlowerBeds;
  final UploadFlowerBed uploadFlowerBed;
  List<FlowerBedEntity> eventList = [];

  FlowerBedCubit({required this.loadFlowerBeds, required this.uploadFlowerBed})
      : super(const FlowerBedState.initial());

  Future<void> upload(FlowerBedEntity event) async {
    eventList.add(event);
    final result = await uploadFlowerBed(eventList
        .map(
          (e) => FlowerBedModel(
            id: e.id,
            width: e.width,
            height: e.height,
            trueDx: e.truePosition.dx,
            trueDy: e.truePosition.dy,
            dx: e.position.dx,
            dy: e.position.dx,
            rotation: e.rotation,
            plantIds: e.plantIds,
          ),
        )
        .toList());
    result.fold(
      (error) => emit(FlowerBedState.fail(error.message)),
      (success) => emit(FlowerBedState.success(eventList)),
    );
  }

  Future<void> load() async {
    final events = await loadFlowerBeds(() {});
    events.fold(
      (error) => emit(FlowerBedState.fail(error.message)),
      (succededFlowerBedList) {
        eventList = succededFlowerBedList
            .map((e) => FlowerBedEntity.fromModel(e))
            .toList();
        emit(
          FlowerBedState.success(
            eventList,
          ),
        );
      },
    );
  }

  Future<void> loadLocally() async {
    emit(const FlowerBedState.loading());
    final events = await loadFlowerBeds(() {});
    events.fold(
      (error) => emit(FlowerBedState.fail(error.message)),
      (succededFlowerBedList) {
        eventList = succededFlowerBedList
            .map((e) => FlowerBedEntity.fromModel(e))
            .toList();
        emit(
          FlowerBedState.success(
            eventList,
          ),
        );
      },
    );
  }
}

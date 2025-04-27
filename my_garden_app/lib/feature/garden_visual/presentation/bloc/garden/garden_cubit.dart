import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/garden_visual/domain/entities/garden_entity.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/delete_garden.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/load_gardens.dart';
import 'package:my_garden_app/feature/garden_visual/domain/usecases/upload_garden.dart';

part 'garden_cubit.freezed.dart';
part 'garden_state.dart';

class GardenCubit extends Cubit<GardenState> {
  final LoadGardens loadGardens;
  final UploadGarden uploadGarden;
  final DeleteGarden deleteGarden;
  List<GardenEntity> gardens = [];
  GardenEntity? selectedGarden;

  GardenCubit({
    required this.deleteGarden,
    required this.loadGardens,
    required this.uploadGarden,
  }) : super(const GardenState.initial());

  Future<void> upload(GardenEntity garden) async {
    emit(const GardenState.loading());
    final result = await uploadGarden([garden]);
    await load();
    result.fold(
      (error) => emit(GardenState.fail(error.message)),
      (success) => emit(GardenState.success(gardens)),
    );
  }

  Future<void> load() async {
    emit(const GardenState.loading());
    final result = await loadGardens([]);
    result.fold(
      (error) => emit(GardenState.fail(error.message)),
      (succededGardenList) {
        gardens = succededGardenList;
        emit(
          GardenState.success(
            gardens,
          ),
        );
      },
    );
  }

  void selectGarden(GardenEntity garden) {
    selectedGarden = garden;
    emit(GardenState.success(gardens));
  }

  Future<void> loadLocally() async {
    emit(const GardenState.loading());
    final result = await loadGardens([], false);
    result.fold(
      (error) => emit(GardenState.fail(error.message)),
      (succededGardenList) {
        gardens = succededGardenList;
        emit(
          GardenState.success(
            gardens,
          ),
        );
      },
    );
  }

  Future<void> delete(int id) async {
    emit(const GardenState.loading());
    final result = await deleteGarden(id);
    gardens.removeWhere((plant) => plant.id == id);
    result.fold(
      (error) => emit(GardenState.fail(error.message)),
      (success) => emit(GardenState.success(gardens)),
    );
  }
}

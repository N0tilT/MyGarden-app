import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_garden_app/feature/plant_list/domain/entity/plant_entity.dart';

part 'plant_list_state.dart';
part 'plant_list_cubit.freezed.dart';

class PlantListCubit extends Cubit<PlantListState> {
  PlantListCubit() : super(const PlantListState.initial());
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_garden_app/core/constant_values/routes.dart';
import 'package:my_garden_app/core/presentation/UI/garden_loading_widget.dart';
import 'package:my_garden_app/feature/auth/presentation/bloc/cubit/token_cubit.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/group_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/grow_stage_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/light_need_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_type_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_variety_entity.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/watering_need_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/group/group_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/grow_stage/grow_stage_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/light_need/light_need_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_prefill/plant_prefill_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_recognition/plant_recognition_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_type/plant_type_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_variety/plant_variety_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/watering_need/watering_need_cubit.dart';
import 'package:my_garden_app/feature/plant_list/presentation/pages/plant_card_page.dart';

class PlantDetailCardSheet extends StatefulWidget {
  final PlantEntity plant;

  const PlantDetailCardSheet({super.key, required this.plant});

  @override
  State<PlantDetailCardSheet> createState() => _PlantDetailCardSheetState();
}

class _PlantDetailCardSheetState extends State<PlantDetailCardSheet> {
  late PlantEntity _editedPlant;
  late bool _isEditing;
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  final ImagePicker _picker = ImagePicker();
  int _currentPhotoIndex = 0;

  @override
  void initState() {
    super.initState();
    _editedPlant = widget.plant;
    _isEditing = widget.plant.id == null;
    _initializeControllers();
  }

  void _initializeControllers() {
    _controllers['title'] = TextEditingController(text: _editedPlant.title);
    _controllers['biologyTitle'] =
        TextEditingController(text: _editedPlant.biologyTitle);
    _controllers['fertilization'] =
        TextEditingController(text: _editedPlant.fertilization);
    _controllers['toxicity'] =
        TextEditingController(text: _editedPlant.toxicity);
    _controllers['replacing'] =
        TextEditingController(text: _editedPlant.replacing);
    _controllers['description'] =
        TextEditingController(text: _editedPlant.description);
    _controllers['ripeningPeriod'] =
        TextEditingController(text: _editedPlant.ripeningPeriod.toString());
  }

  void _updateField(String field, dynamic value) {
    setState(() {
      _editedPlant = _editedPlant.copyWith(
        groupId: field == 'groupId' ? value as int : _editedPlant.groupId,
        wateringNeedId: field == 'wateringNeedId'
            ? value as int
            : _editedPlant.wateringNeedId,
        lightNeedId:
            field == 'lightNeedId' ? value as int : _editedPlant.lightNeedId,
        plantTypeId:
            field == 'plantTypeId' ? value as int : _editedPlant.plantTypeId,
        plantVarietyId: field == 'plantVarietyId'
            ? value as int
            : _editedPlant.plantVarietyId,
        stageId: field == 'stageId' ? value as int : _editedPlant.stageId,
      );
    });
  }

  Future<void> _addPhoto(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image == null) return;

    final newPhoto = Photo(
      plantId: _editedPlant.id?.toString() ?? '0',
      localPath: image.path,
      isSynced: false,
      createdAt: DateTime.now(),
    );

    setState(() {
      _editedPlant = _editedPlant.copyWith(
        photos: [..._editedPlant.photos, newPhoto],
      );
    });
  }

  void _removePhoto(int index) {
    setState(() {
      final newPhotos = List<Photo>.from(_editedPlant.photos);
      newPhotos.removeAt(index);
      _editedPlant = _editedPlant.copyWith(photos: newPhotos);
      if (_currentPhotoIndex >= newPhotos.length) {
        _currentPhotoIndex = newPhotos.isNotEmpty ? newPhotos.length - 1 : 0;
      }
    });
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final plantToSave = _editedPlant.copyWith(
        title: _controllers['title']!.text,
        biologyTitle: _controllers['biologyTitle']!.text,
        fertilization: _controllers['fertilization']!.text,
        toxicity: _controllers['toxicity']!.text,
        replacing: _controllers['replacing']!.text,
        description: _controllers['description']!.text,
        ripeningPeriod: int.tryParse(_controllers['ripeningPeriod']!.text) ?? 0,
      );

      if (plantToSave.id == null) {
        context.read<PlantListCubit>().upload(plantToSave);
      } else {
        context.read<PlantListCubit>().upload(plantToSave);
      }
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 241, 245),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          _buildTopIndicator(),
          _buildHeader(),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildTopIndicator() {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _editedPlant.id == null
                ? 'Новое растение'
                : _isEditing
                    ? 'Редактирование'
                    : _editedPlant.title ?? "Без названия",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              if (_isEditing)
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () => _addPhoto(ImageSource.camera),
                ),
              if (_isEditing)
                IconButton(
                  icon: const Icon(Icons.photo_library),
                  onPressed: () => _addPhoto(ImageSource.gallery),
                ),
              IconButton(
                icon: Icon(_isEditing ? Icons.save : Icons.edit),
                onPressed: () {
                  if (_isEditing) {
                    _saveChanges();
                  } else {
                    setState(() => _isEditing = true);
                  }
                },
              ),
              if (_editedPlant.id != null)
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<PlantListCubit>().delete(_editedPlant.id!);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoSlider() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: _editedPlant.photos.isEmpty
              ? _buildEmptyPhotoState()
              : PageView.builder(
                  itemCount: _editedPlant.photos.length,
                  onPageChanged: (index) =>
                      setState(() => _currentPhotoIndex = index),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(_editedPlant.photos[index].localPath),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        if (_isEditing)
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removePhoto(index),
                          ),
                      ],
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 8),
        if (_editedPlant.photos.length > 1) _buildPhotoIndicator(),
      ],
    );
  }

  Widget _buildEmptyPhotoState() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.photo_camera, size: 40, color: Colors.grey[400]),
            const SizedBox(height: 8),
            Text(
              'Нет фотографий',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_editedPlant.photos.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: index == _currentPhotoIndex ? 16 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: index == _currentPhotoIndex
                ? Theme.of(context).primaryColor
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<TokenCubit>()..getToken()),
        BlocProvider.value(value: context.read<GroupCubit>()..loadLocally()),
        BlocProvider.value(
          value: context.read<WateringNeedCubit>()..loadLocally(),
        ),
        BlocProvider.value(
          value: context.read<LightNeedCubit>()..loadLocally(),
        ),
        BlocProvider.value(
          value: context.read<PlantTypeCubit>()..loadLocally(),
        ),
        BlocProvider.value(
          value: context.read<PlantVarietyCubit>()..loadLocally(),
        ),
        BlocProvider.value(
          value: context.read<GrowStageCubit>()..loadLocally(),
        ),
        BlocProvider.value(
          value: context.read<PlantRecognitionCubit>(),
        ),
        BlocProvider.value(
          value: context.read<PlantPrefillCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocConsumer<TokenCubit, TokenState>(
            listener: (context, state) {
              state.when(
                fail: (l) =>
                    Navigator.of(context).pushReplacementNamed(authRoute),
                unauthorized: () => context.read<TokenCubit>().passValidation(),
                tokenSuccess: (token) {},
                initial: () {},
                authorized: (token) {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                tokenSuccess: (token) => _buildMainContent(context),
                orElse: () => const Center(child: GardenLoadingWidget()),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final groups = context.watch<GroupCubit>().state.maybeWhen(
          success: (data) => data,
          orElse: () => <GroupEntity>[],
        );

    final wateringNeeds = context.watch<WateringNeedCubit>().state.maybeWhen(
          success: (data) => data,
          orElse: () => <WateringNeedEntity>[],
        );

    final lightNeeds = context.watch<LightNeedCubit>().state.maybeWhen(
          success: (data) => data,
          orElse: () => <LightNeedEntity>[],
        );

    final plantTypes = context.watch<PlantTypeCubit>().state.maybeWhen(
          success: (data) => data,
          orElse: () => <PlantTypeEntity>[],
        );

    final plantVarieties = context.watch<PlantVarietyCubit>().state.maybeWhen(
          success: (data) => data,
          orElse: () => <PlantVarietyEntity>[],
        );

    final growStages = context.watch<GrowStageCubit>().state.maybeWhen(
          success: (data) => data,
          orElse: () => <GrowStageEntity>[],
        );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPhotoSlider(),
          if (!_isEditing) ...[
            const SizedBox(height: 16),
            _buildInfoRow(
              'Группа',
              groups
                      .firstWhere(
                        (g) => g.id == _editedPlant.groupId,
                        orElse: () => const GroupEntity(id: 0, title: ''),
                      )
                      .title ??
                  'Не указано',
            ),
            _buildInfoRow(
              'Полив',
              wateringNeeds
                      .firstWhere(
                        (w) => w.id == _editedPlant.wateringNeedId,
                        orElse: () =>
                            const WateringNeedEntity(id: 0, title: ''),
                      )
                      .title ??
                  'Не указано',
            ),
            _buildInfoRow(
              'Освещение',
              lightNeeds
                      .firstWhere(
                        (l) => l.id == _editedPlant.lightNeedId,
                        orElse: () => const LightNeedEntity(id: 0, title: ''),
                      )
                      .title ??
                  'Не указано',
            ),
            const SizedBox(height: 16),
            const Text(
              'Описание',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(_editedPlant.description ?? 'Не указано'),
          ],
          if (_isEditing) ...[
            const SizedBox(height: 20),
            _buildEditForm(
              groups,
              wateringNeeds,
              lightNeeds,
              plantTypes,
              plantVarieties,
              growStages,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEditForm(
    List<GroupEntity> groups,
    List<WateringNeedEntity> wateringNeeds,
    List<LightNeedEntity> lightNeeds,
    List<PlantTypeEntity> plantTypes,
    List<PlantVarietyEntity> plantVarieties,
    List<GrowStageEntity> growStages,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEditableField('Название', 'title'),
          _buildDescriptionField(),
          _buildEditableField(
            'Биологическое название',
            'biologyTitle',
            isRequired: false,
          ),
          _buildEditableField('Удобрение', 'fertilization', isRequired: false),
          _buildEditableField('Токсичность', 'toxicity', isRequired: false),
          _buildEditableField('Пересадка', 'replacing', isRequired: false),
          _buildEditableField(
            'Период созревания (дни)',
            'ripeningPeriod',
            isRequired: false,
            isNumber: true,
          ),
          const SizedBox(height: 20),
          _buildDropdown<GroupEntity>(
            label: 'Группа',
            items: groups,
            currentId: _editedPlant.groupId,
            displayText: (item) => item.title ?? "Без названия",
            onChanged: (value) => _updateField('groupId', value?.id),
          ),
          _buildDropdown<WateringNeedEntity>(
            label: 'Полив',
            items: wateringNeeds,
            currentId: _editedPlant.wateringNeedId,
            displayText: (item) => item.title ?? "Без названия",
            onChanged: (value) => _updateField('wateringNeedId', value?.id),
          ),
          _buildDropdown<LightNeedEntity>(
            label: 'Освещение',
            items: lightNeeds,
            currentId: _editedPlant.lightNeedId,
            displayText: (item) => item.title ?? "Без названия",
            onChanged: (value) => _updateField('lightNeedId', value?.id),
          ),
          _buildDropdown<PlantTypeEntity>(
            label: 'Тип растения',
            items: plantTypes,
            currentId: _editedPlant.plantTypeId,
            displayText: (item) => item.title ?? "Без названия",
            onChanged: (value) => _updateField('plantTypeId', value?.id),
          ),
          _buildDropdown<PlantVarietyEntity>(
            label: 'Разновидность',
            items: plantVarieties,
            currentId: _editedPlant.plantVarietyId,
            displayText: (item) => item.title ?? "Без названия",
            onChanged: (value) => _updateField('plantVarietyId', value?.id),
          ),
          _buildDropdown<GrowStageEntity>(
            label: 'Стадия роста',
            items: growStages,
            currentId: _editedPlant.stageId,
            displayText: (item) => item.title ?? "Без названия",
            onChanged: (value) => _updateField('stageId', value?.id),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Описание',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextFormField(
            controller: _controllers['description'],
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(12),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildEditableField(
    String label,
    String fieldKey, {
    bool isRequired = true,
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextFormField(
            controller: _controllers[fieldKey],
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                return 'Обязательное поле';
              }
              if (isNumber && value!.isNotEmpty) {
                if (int.tryParse(value) == null) {
                  return 'Введите число';
                }
              }
              return null;
            },
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required List<T> items,
    required int? currentId,
    required String Function(T) displayText,
    required void Function(T?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          DropdownButtonFormField<T>(
            value: items.isNotEmpty
                ? items.firstWhere(
                    (item) => (item as dynamic).id == currentId,
                    orElse: () => items.first,
                  )
                : null,
            items: items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(displayText(item)),
              );
            }).toList(),
            onChanged: onChanged,
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
            ),
            validator: (value) => value == null ? 'Обязательное поле' : null,
          ),
          const Divider(),
        ],
      ),
    );
  }
}

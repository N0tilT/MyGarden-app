// plant_card_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_garden_app/feature/plant_list/domain/entities/plant_entity.dart';
import 'package:my_garden_app/feature/plant_list/presentation/bloc/plant_list/plant_list_cubit.dart';

class PlantCardBottomSheet extends StatefulWidget {
  final PlantEntity plant;

  const PlantCardBottomSheet({super.key, required this.plant});

  @override
  _PlantCardBottomSheetState createState() => _PlantCardBottomSheetState();
}

class _PlantCardBottomSheetState extends State<PlantCardBottomSheet> {
  late PlantEntity _editedPlant;
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _editedPlant = widget.plant;
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
    _controllers['groupId'] =
        TextEditingController(text: _editedPlant.groupId.toString());
    _controllers['wateringNeedId'] =
        TextEditingController(text: _editedPlant.wateringNeedId.toString());
    _controllers['lightNeedId'] =
        TextEditingController(text: _editedPlant.lightNeedId.toString());
    _controllers['plantTypeId'] =
        TextEditingController(text: _editedPlant.plantTypeId.toString());
    _controllers['plantVarietyId'] =
        TextEditingController(text: _editedPlant.plantVarietyId.toString());
    _controllers['stageId'] =
        TextEditingController(text: _editedPlant.stageId.toString());
    _controllers['imageId'] =
        TextEditingController(text: _editedPlant.imageId.toString());
    _controllers['ripeningPeriod'] =
        TextEditingController(text: _editedPlant.ripeningPeriod.toString());
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final updatedPlant = PlantEntity(
        id: _editedPlant.id,
        title: _controllers['title']!.text,
        biologyTitle: _controllers['biologyTitle']!.text,
        fertilization: _controllers['fertilization']!.text,
        toxicity: _controllers['toxicity']!.text,
        replacing: _controllers['replacing']!.text,
        description: _controllers['description']!.text,
        groupId: int.parse(_controllers['groupId']!.text),
        wateringNeedId: int.parse(_controllers['wateringNeedId']!.text),
        lightNeedId: int.parse(_controllers['lightNeedId']!.text),
        plantTypeId: int.parse(_controllers['plantTypeId']!.text),
        plantVarietyId: int.parse(_controllers['plantVarietyId']!.text),
        stageId: int.parse(_controllers['stageId']!.text),
        imageId: int.parse(_controllers['imageId']!.text),
        ripeningPeriod: int.parse(_controllers['ripeningPeriod']!.text),
      );

      context.read<PlantListCubit>().upload(updatedPlant);
      setState(() => _isEditing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 241, 245),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _isEditing
                      ? 'Редактирование'
                      : (_editedPlant.title ?? 'Мое растение'),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(_isEditing ? Icons.save : Icons.close),
                  onPressed: () {
                    if (_isEditing) {
                      _saveChanges();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context
                        .read<PlantListCubit>()
                        .delete(_editedPlant.id ?? -1);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEditableField('Название', 'title', isRequired: false),
            _buildEditableField(
              'Биологическое название',
              'biologyTitle',
              isRequired: false,
            ),
            _buildEditableField(
              'Удобрение',
              'fertilization',
              isRequired: false,
            ),
            _buildEditableField('Токсичность', 'toxicity', isRequired: false),
            _buildEditableField('Пересадка', 'replacing', isRequired: false),
            _buildEditableField('Описание', 'description', isRequired: false),
            _buildEditableField('ID группы', 'groupId', isNumber: true),
            _buildEditableField(
              'ID потребности в поливе',
              'wateringNeedId',
              isNumber: true,
            ),
            _buildEditableField(
              'ID потребности в освещении',
              'lightNeedId',
              isNumber: true,
            ),
            _buildEditableField(
              'ID типа растения',
              'plantTypeId',
              isNumber: true,
            ),
            _buildEditableField(
              'ID разновидности',
              'plantVarietyId',
              isNumber: true,
            ),
            _buildEditableField('ID стадии роста', 'stageId', isNumber: true),
            _buildEditableField('ID изображения', 'imageId', isNumber: true),
            _buildEditableField(
              'Период созревания (дни)',
              'ripeningPeriod',
              isNumber: true,
            ),
            if (!_isEditing)
              Align(
                child: ElevatedButton(
                  onPressed: () => setState(() => _isEditing = true),
                  child: const Text('Изменить'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(
    String label,
    String fieldKey, {
    bool isNumber = false,
    bool isRequired = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (_isEditing)
            TextFormField(
              controller: _controllers[fieldKey],
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.text,
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
            )
          else
            Text(
              _controllers[fieldKey]!.text.isNotEmpty
                  ? _controllers[fieldKey]!.text
                  : 'Не указано',
            ),
          const Divider(),
        ],
      ),
    );
  }
}
